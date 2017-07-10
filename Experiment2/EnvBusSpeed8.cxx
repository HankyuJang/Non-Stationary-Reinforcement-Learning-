/*
 Bus Gridworld

 Bus speed: 8
 Reward: 0 (every step)
         1 (terminal state)
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "utils.h"
#include "rlglue/RL_glue.h"
#include "rlglue/Environment_common.h" /* Required for RL-Glue interface*/

/*** IMPORTANT: 
 * Any private variables to the environment must be declared static
 * Otherwise they are default public global variables that can be 
 * accessed in other files 
 ***/

#define NUM_STATES 70
#define GRID_WIDTH 10
#define GRID_HEIGHT 7
#define S_STATE 50
#define G_STATE 49
#define NUM_STOPS 2
#define NUM_PATH 16
#define BUS_SPEED 8 

static gsl_vector* local_observation;
static reward_observation_terminal_t this_reward_observation;

static int *bus_stop;
static int *road;

void env_init()
{    
    local_observation = gsl_vector_calloc(1);
    
    this_reward_observation.observation=local_observation;
    this_reward_observation.reward=-1;
    this_reward_observation.terminal=0;
    
    bus_stop = (int *)malloc(sizeof(int)*NUM_STOPS);
    bus_stop[0] = 22;
    bus_stop[1] = 48;

    road = (int *)malloc(sizeof(int)*NUM_PATH);
    road[0] = 48;
    road[1] = 47;
    road[2] = 46;
    road[3] = 45;
    road[4] = 44;
    road[5] = 43;
    road[6] = 42;
    road[7] = 32;
    road[8] = 22;
    road[9] = 23;
    road[10] = 24;
    road[11] = 25;
    road[12] = 26;
    road[13] = 27;
    road[14] = 28;
    road[15] = 38;
    return;
}

const observation_t* env_start()
{
    //printf("---------------------------------------\n");
    //start with state s50
    int stp1 = S_STATE;
    
    gsl_vector_set(local_observation,0,stp1);
    return this_reward_observation.observation;
}

const reward_observation_terminal_t *env_step(const action_t *this_action)
{
    //get previous state from local observation
    int stp0 = (int)gsl_vector_get(local_observation,0);
    int atp1 = gsl_vector_get(this_action,0);
    int stp1;

    double the_reward = -1;
    int episode_over = 0;
    
    int row = stp0/GRID_WIDTH;
    int col = stp0%GRID_WIDTH;

    int bus_loc = road[(RL_num_steps() * BUS_SPEED) % NUM_PATH]; 
    //agent at bus stop, action:0, bus at bus stop
    if (stp0==bus_stop[0]&&atp1==0&&bus_loc==bus_stop[0] || stp0==bus_stop[1]&&atp1==0&&bus_loc==bus_stop[1]){
        stp1 = road[((RL_num_steps()+1) * BUS_SPEED) % NUM_PATH];
    }//agent at the bus on the road
    else if (stp0==bus_loc && bus_loc!=bus_stop[0] && bus_loc!=bus_stop[1]){
        stp1 = road[((RL_num_steps()+1) * BUS_SPEED) % NUM_PATH]; 
    }
    else{//agents plans to walk either direction
        if (atp1==1)
            row -= 1; //move one step up
        else if (atp1==2)
            col += 1;//move one step right
        else if (atp1==3)
            row += 1;//move one step down
        else if (atp1==4)
            col -= 1;//move one step left

        //next state
        stp1 = row*GRID_WIDTH + col;

        //if agent is off grid, set next state as previous state
        if (row < 0 || row>=GRID_HEIGHT || col<0 || col>=GRID_WIDTH)
            stp1 = stp0;

        //if agent on the road, set next state as previous state
        for (int i=0; i<NUM_PATH; i++){
            if (stp1 == road[i])
                if (stp1 != bus_stop[0] && stp1 != bus_stop[1])
                    stp1 = stp0;
        }
        
    }

    if (stp1 == G_STATE){
        the_reward = 0;
        episode_over = 1;
    }
    
    //store new state to local_oberservation
    gsl_vector_set(local_observation, 0,stp1);

    //return new state and reward
    this_reward_observation.reward = the_reward;
    this_reward_observation.terminal = episode_over;
    return &this_reward_observation;
}

void env_cleanup()
{
    free(bus_stop);
    bus_stop = NULL;
    free(road);
    road = NULL;
    gsl_vector_free(local_observation);
}

const char* env_message(const char* inMessage) {
      if(strcmp(inMessage,"what is your name?")==0)
            return "my name is skeleton_environment!";

      /* else */
      return "I don't know how to respond to your message";
}

