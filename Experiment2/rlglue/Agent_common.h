/*
*  
*/


#ifndef Agent_common_h
#define Agent_common_h


#include "RL_common.h"

#ifdef __cplusplus
extern "C" {
#endif

/*	* Agent Interface 
	*
	* This should be included by all C/C++ agents as #include <Agent_common.h>
	* Agents must implement all of these functions.
*/
void agent_init();
const action_t* agent_start(const observation_t* observation);
const action_t* agent_step(double reward, const observation_t* observation);
void agent_end(double reward);  
void agent_cleanup();
const char* agent_message(const char* message);

#ifdef __cplusplus
}
#endif

#endif
