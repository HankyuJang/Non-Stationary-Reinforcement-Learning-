/* 
    DynaQ agent with priority sweep
    Five actions total (stay, up, right, down, left)
 */

#include <stdio.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <gsl/gsl_matrix.h>

#include "utils.h"
#include "rlglue/RL_glue.h"
#include "rlglue/Agent_common.h" /* Required for RL-Glue */
//#include "rlglue/TaskSpec_Parser.h" /* helpful functions parsing task spec string */

#define MAX(a,b) (((a)>(b))?(a):(b))
#define MIN(a,b) (((a)<(b))?(a):(b))
#define NUM_STATES 70
#define NUM_ACTIONS 5

/*** IMPORTANT: 
 * Any private variables to the environment must be declared static
 * Otherwise they are default public global variables that can be 
 * accessed in other files 
 ***/

static gsl_vector* local_action;
static action_t* this_action;
static gsl_vector* last_observation;

static double **Q;
static double **Model_r;
static int **Model_s;

static int *Pi;
static int *S_seq;
static int *A_seq;
static int *action_tie;

static int *PQueue;
static double *PQueue_P;

//These parameters are from the terminal
extern double epsilon;
extern double alpha;
extern int n;
extern double discount;
extern double theta;
extern int max_steps;
extern int num_episodes;

double *ValueEst_GP;

double get_maxQ(int stp1){
    double max_Q = Q[stp1][0];
    int max_Q_idx = 0;
    int count = 1;
    int tie_breaker;
    action_tie[0] = 0;

    for (int a=1; a < NUM_ACTIONS; a++){
        if (max_Q-Q[stp1][a]>-0.0000000001 && max_Q-Q[stp1][a]<0.0000000001){
            action_tie[count] = a;
            count += 1;
        }
        else if (Q[stp1][a] > max_Q){
            max_Q = Q[stp1][a];
            max_Q_idx = a;
            action_tie[0] = max_Q_idx;
            count = 1;
        }
    }

    if (count > 1){
        tie_breaker = randInRange(count);
        Pi[stp1] = action_tie[tie_breaker];
    }
    else
        Pi[stp1] = max_Q_idx;

    return max_Q;
}

void save_value(int stp1){
    double max_Q = Q[stp1][0];

    for (int a=1; a < NUM_ACTIONS; a++){
        if (Q[stp1][a] > max_Q){
            max_Q = Q[stp1][a];
        }
    }
    ValueEst_GP[stp1] = max_Q;
}

void agent_init()
{
    //use secondary array to store Q(s,a)
    //initial values set to 0. Q(s,a)=0
    Q = (double **)malloc(sizeof(double *)*NUM_STATES);
    for (int i = 0; i < NUM_STATES;i++) {
        Q[i] = (double *)malloc(sizeof(double) * NUM_ACTIONS);
        for (int j=0; j < NUM_ACTIONS; j++) {
            Q[i][j] = 0;
        }
    }
    
    //model holding the reward corresponding to state action pair
    Model_r = (double **)malloc(sizeof(double *)*NUM_STATES);
    for (int i = 0; i < NUM_STATES;i++) {
        Model_r[i] = (double *)malloc(sizeof(double) * NUM_ACTIONS);
        for (int j=0; j < NUM_ACTIONS; j++) {
            Model_r[i][j] = -1;
        }
    }
    
    //model holding the next state corresponding to state action pair
    Model_s = (int **)malloc(sizeof(int *)*NUM_STATES);
    for (int i = 0; i < NUM_STATES;i++) {
        Model_s[i] = (int *)malloc(sizeof(int) * NUM_ACTIONS);
        for (int j=0; j < NUM_ACTIONS; j++) {
            Model_s[i][j] = -1;
        }
    }
    
    //use an extern pointer to return Vt to experiment
    ValueEst_GP = (double *)malloc(sizeof(double)*NUM_STATES);
    for (int i = 0;i < NUM_STATES;i++) {
        ValueEst_GP[i] = 0;
    }

    action_tie = (int *)malloc(sizeof(int)*NUM_ACTIONS);
    
    //Initialize Pi randomly
    Pi = (int *)malloc(sizeof(int)*NUM_STATES);
    for (int i = 0;i < NUM_STATES;i++) {
        Pi[i] = randInRange(NUM_ACTIONS);
    }

    //use two array to store the sequence of S,A in an episode
    S_seq = (int *)malloc(sizeof(int)*max_steps);
    A_seq = (int *)malloc(sizeof(int)*max_steps);

    //Priority Queue
    PQueue = (int *)malloc(sizeof(int)*NUM_STATES);
    for (int i = 0;i < NUM_STATES;i++) {
        PQueue[i] = 0;
    }

    // Initialize the priorities to -1
    PQueue_P = (double *)malloc(sizeof(double)*NUM_STATES);
    for (int i = 0;i < NUM_STATES;i++) {
        PQueue_P[i] = -1;
    }

    local_action = gsl_vector_calloc(1);
    this_action = local_action;
    last_observation = gsl_vector_calloc(1);
}

const action_t *agent_start(const observation_t *this_observation) {
    //printf("---------------------------------------\n");
    //get s0 from environment, select a0 according to initial policy
    int stp1 = (int)gsl_vector_get(this_observation,0);
    int atp1 = Pi[stp1];
    
    S_seq[0] = stp1;
    A_seq[0] = atp1;
    
    gsl_vector_set(local_action,0,atp1);
    gsl_vector_memcpy(last_observation,this_observation);

    return this_action;
}

const action_t *agent_step(double reward, const observation_t *this_observation) {

    //get state from environment
    int stp1 = (int)gsl_vector_get(this_observation,0);
    //choose action according to current policy
    int atp1, stp0, atp0, index, empty;
    double max_Q;

    double random_number = rand_un();
    if (random_number < epsilon){
        atp1 = randInRange(NUM_ACTIONS);
    }
    else
        atp1 = Pi[stp1];

    int t = RL_num_steps()-1;

    //store current state and action into sequence
    S_seq[t] = stp1;
    A_seq[t] = atp1;
    stp0 = S_seq[t-1];
    atp0 = A_seq[t-1];

    gsl_vector_set(local_action,0,atp1);
    gsl_vector_memcpy(last_observation,this_observation);

    Model_r[stp0][atp0] = reward; 
    Model_s[stp0][atp0] = stp1; 

    max_Q = get_maxQ(stp1);
    double P = reward + discount*max_Q - Q[stp0][atp0];

    // Specially update the Q if n=0 (Q-learning Agent)
    if (n==0)
        Q[stp0][atp0] = Q[stp0][atp0] + alpha*(reward + discount*max_Q - Q[stp0][atp0]) ;

    if (P>theta){
        PQueue[stp0] = atp0;
        PQueue_P[stp0] = P;
    }

    for (int i=0; i<n; i++){
        // Check if PQueue is empty (1)
        empty = 1;
        for (int s=0; s<NUM_STATES; s++) {
            if (PQueue_P[s] > 0){
                empty = 0;
                break;
            }
        }
        if (empty == 1)
            break;

        double maxP = PQueue_P[0];
        int maxP_state = 0;
        for (int s=1; s<NUM_STATES; s++) {
            if (PQueue_P[s] > maxP){
                maxP = PQueue_P[s];
                maxP_state = s;
            }
        }        

        stp0 = maxP_state;
        atp0 = PQueue[maxP_state];
        PQueue_P[maxP_state] = -1;

        stp1 = Model_s[stp0][atp0];
        reward = Model_r[stp0][atp0];

        max_Q = get_maxQ(stp1);
        Q[stp0][atp0] = Q[stp0][atp0] + alpha*(reward + discount*max_Q - Q[stp0][atp0]) ;

        double reward_bar;
        for (int S_bar = 0; S_bar < NUM_STATES; S_bar++) {
            for (int A_bar=0; A_bar < NUM_ACTIONS; A_bar++) {
                if (Model_s[S_bar][A_bar] == stp0){
                    reward_bar = Model_r[S_bar][A_bar];
                    max_Q = get_maxQ(stp0);
                    P = reward_bar + discount*max_Q - Q[S_bar][A_bar]; 
                    if (P>theta){
                        PQueue[S_bar] = A_bar;
                        PQueue_P[S_bar] = P;
                    }
                }
            }            
        }
    }

    return this_action;
}

void agent_end(double reward) {

    //begin to learn at end of episode
    int t = RL_num_steps()-1;
    int stp1, atp1, stp0, atp0, index, empty;
    double max_Q;

    //One step update
    //update previous step with the current step

    stp1 = S_seq[t];
    atp1 = A_seq[t];
    stp0 = S_seq[t];
    atp0 = A_seq[t];

    if (n==0){
        max_Q = get_maxQ(stp1);
        Q[stp0][atp0] = Q[stp0][atp0] + alpha*(reward + discount*max_Q - Q[stp0][atp0]) ;
    }

    Model_r[stp0][atp0] = reward; 
    Model_s[stp0][atp0] = stp1; 

    max_Q = get_maxQ(stp0);
    double P = reward + discount*max_Q - Q[stp0][atp0];
    
    if (P>theta){
        PQueue[stp0] = atp0;
        PQueue_P[stp0] = P;
    }

    for (int i=0; i<n; i++){
        // Check if PQueue is empty (1)
        empty = 1;
        for (int s=0; s<NUM_STATES; s++) {
            if (PQueue_P[s] > 0){
                empty = 0;
                break;
            }
        }
        if (empty == 1)
            break;

        double maxP = PQueue_P[0];
        int maxP_state = 0;
        for (int s=1; s<NUM_STATES; s++) {
            if (PQueue_P[s] > maxP){
                maxP = PQueue_P[s];
                maxP_state = s;
            }
        }        
        
        stp0 = maxP_state;
        atp0 = PQueue[maxP_state];
        PQueue_P[maxP_state] = -1;

        stp1 = Model_s[stp0][atp0];
        reward = Model_r[stp0][atp0];

        max_Q = get_maxQ(stp1);
        Q[stp0][atp0] = Q[stp0][atp0] + alpha*(reward + discount*max_Q - Q[stp0][atp0]) ;

        double reward_bar;
        for (int S_bar = 0; S_bar < NUM_STATES; S_bar++) {
            for (int A_bar=0; A_bar < NUM_ACTIONS; A_bar++) {
                if (Model_s[S_bar][A_bar] == stp0){
                    reward_bar = Model_r[S_bar][A_bar];
                    max_Q = get_maxQ(stp0);
                    P = reward_bar + discount*max_Q - Q[S_bar][A_bar]; 
                    if (P>theta){
                        PQueue[S_bar] = A_bar;
                        PQueue_P[S_bar] = P;
                    }
                }
            }            
        }
    }

    // Save the value at the last step of the episode
    if (RL_num_episodes()==num_episodes){
        for (int stp=0; stp < NUM_STATES; stp++){
            save_value(stp); 
        }
    }
}

void agent_cleanup() {
      /* clean up mememory */
    gsl_vector_free(local_action);
    gsl_vector_free(last_observation);
    
    for (int i = 0; i < NUM_STATES;i++) {
        free(Q[i]);
    }
    free(Q);
    Q = NULL;
    
    for (int i = 0; i < NUM_STATES;i++) {
        free(Model_r[i]);
    }
    free(Model_r);
    Model_r = NULL;
    
    for (int i = 0; i < NUM_STATES;i++) {
        free(Model_s[i]);
    }
    free(Model_s);
    Model_s = NULL;
    
    free(Pi);
    Pi = NULL;
    free(S_seq);
    S_seq = NULL;
    free(A_seq);
    A_seq = NULL;
    free(PQueue);
    PQueue = NULL;
    free(PQueue_P);
    PQueue_P = NULL;
    free(action_tie);
    action_tie = NULL;

    free(ValueEst_GP);
    ValueEst_GP = NULL;
}

const char* agent_message(const char* inMessage) {
      /* might be useful to get information from the agent */
    return "path setted...";
}
