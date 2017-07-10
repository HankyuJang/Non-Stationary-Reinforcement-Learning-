/*
* Copyright (C) 2007, Adam White

* 
*/


#ifndef RL_interface_h
#define RL_interface_h




#include "RL_common.h"

#ifdef __cplusplus
extern "C" {
#endif

/*	* RL-Glue Interface 
	*
	* This should be included by all C/C++ experiments as #include <rlglue/RL_glue.h>
	* Experiments should not implement these functions, rather, these are the functions
	* that experiments should call.
*/
void RL_init();
const observation_action_t *RL_start();
const reward_observation_action_terminal_t *RL_step();
void RL_cleanup();

const char* RL_agent_message(const char* message);
const char* RL_env_message(const char* message);

double RL_return();
int RL_num_steps();
int RL_num_episodes();
int RL_episode(unsigned int num_steps);

/**
	New Experimental Methods, not part of the public API
**/
const action_t* RL_agent_start(const observation_t* observation);
const action_t* RL_agent_step(double reward, const observation_t* observation);
void RL_agent_end(double reward);  
const observation_t* RL_env_start();
const reward_observation_terminal_t* RL_env_step(const action_t* action);


#ifdef __cplusplus
}
#endif

#endif
