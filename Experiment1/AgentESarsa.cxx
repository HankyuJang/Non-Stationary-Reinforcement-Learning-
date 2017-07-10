/* 
    Expected Sarsa agent
    Five actions (stay, up, right, down, left)
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
static double **Prob;
static int **C;

static int *Pi;
static int *S_seq;
static int *A_seq;
static int *action_tie;

extern double epsilon;
extern double alpha;
extern double discount;
extern int max_steps;
extern int num_episodes;

double *ValueEst_GP;

void update_policy(int stp1){
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
    
    //use secondary array to store the counts C(s,a)
    C = (int **)malloc(sizeof(int *)*NUM_STATES);
    for (int i = 0; i < NUM_STATES;i++) {
        C[i] = (int *)malloc(sizeof(int) * NUM_ACTIONS);
        for (int j=0; j < NUM_ACTIONS; j++) {
            C[i][j] = 1;
        }
    }
    
    //use secondary array to store the probability Prob(s,a)
    int count_per_state;
    Prob = (double **)malloc(sizeof(double *)*NUM_STATES);
    for (int i = 0; i < NUM_STATES;i++) {
        Prob[i] = (double *)malloc(sizeof(double) * NUM_ACTIONS);
        count_per_state = 0;
        for (int j=0; j < NUM_ACTIONS; j++) {
            count_per_state += C[i][j];
        }
        for (int j=0; j < NUM_ACTIONS; j++) {
            Prob[i][j] = double(C[i][j])/count_per_state;
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


    local_action = gsl_vector_calloc(1);
    this_action = local_action;
    last_observation = gsl_vector_calloc(1);
}

const action_t *agent_start(const observation_t *this_observation) {
    int stp1 = (int)gsl_vector_get(this_observation,0);
    int atp1 = Pi[stp1];
    
    S_seq[0] = stp1;
    A_seq[0] = atp1;
    
    //update the Count array
    C[stp1][atp1] += 1;
    //update the Probability array
    int count_per_state = 0;
    for (int j=0; j < NUM_ACTIONS; j++) {
        count_per_state += C[stp1][j];
    }
    Prob[stp1][atp1] = double(C[stp1][atp1])/count_per_state;

    gsl_vector_set(local_action,0,atp1);
    gsl_vector_memcpy(last_observation,this_observation);

    return this_action;
}

const action_t *agent_step(double reward, const observation_t *this_observation) {

    //get state from environment
    int stp1 = (int)gsl_vector_get(this_observation,0);
    //choose action according to current policy
    int atp1, stp0, atp0;
   
    double random_number = rand_un();
    if (random_number < epsilon){
        atp1 = randInRange(NUM_ACTIONS);
    }
    else
        atp1 = Pi[stp1];

    int t = RL_num_steps()-1;

    //update the Count array
    C[stp1][atp1] += 1;
    //update the Probability array
    int count_per_state = 0;
    for (int j=0; j < NUM_ACTIONS; j++) {
        count_per_state += C[stp1][j];
    }
    Prob[stp1][atp1] = double(C[stp1][atp1])/count_per_state;

    //store current state and action into sequence
    S_seq[t] = stp1;
    A_seq[t] = atp1;
    stp0 = S_seq[t-1];
    atp0 = A_seq[t-1];

    gsl_vector_set(local_action,0,atp1);
    gsl_vector_memcpy(last_observation,this_observation);
    
    //One step update
    //update previous step with the current step
    double E = 0;
    for (int a=0; a < NUM_ACTIONS; a++) {
        E += Prob[stp1][a]*Q[stp1][a];
    }

    Q[stp0][atp0] = Q[stp0][atp0] + alpha*(reward + discount * E - Q[stp0][atp0]) ;
    
    //update policy
    //update_policy(stp0);
    update_policy(stp1);

    //return action choice
    return this_action;
}

void agent_end(double reward) {

    //begin to learn at end of episode
    int t = RL_num_steps()-1;
    int stp1, atp1, stp0, atp0;

    //One step update
    //update previous step with the current step
    stp1 = S_seq[t];
    atp1 = A_seq[t];
    stp0 = S_seq[t-1];
    atp0 = A_seq[t-1];

    double E = 0;
    for (int a=0; a < NUM_ACTIONS; a++) {
        E += Prob[stp1][a]*Q[stp1][a];
    }

    Q[stp0][atp0] = Q[stp0][atp0] + alpha*(reward + discount * E - Q[stp0][atp0]) ;

    //update_policy(stp0);
    update_policy(stp1);
    
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
        free(C[i]);
    }
    free(C);
    C = NULL;

    for (int i = 0; i < NUM_STATES;i++) {
        free(Q[i]);
    }
    free(Q);
    Q = NULL;
    
    for (int i = 0; i < NUM_STATES;i++) {
        free(Prob[i]);
    }
    free(Prob);
    Prob = NULL;
    
    free(Pi);
    Pi = NULL;
    free(S_seq);
    S_seq = NULL;
    free(A_seq);
    A_seq = NULL;
    free(action_tie);
    action_tie = NULL;
    
    free(ValueEst_GP);
    ValueEst_GP = NULL;
}

const char* agent_message(const char* inMessage) {
      /* might be useful to get information from the agent */
    return "path setted...";
}
