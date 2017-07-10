/*
* 
*/


#ifndef Environment_common_h
#define Environment_common_h

#ifdef __cplusplus
extern "C" {
#endif

/*	* Environment Interface 
	*
	* This should be included by all C/C++ environments as #include <rlglue/Environment_common.h>
	* Environments must implement all of these functions.
*/
#include "RL_common.h"

	/* Environment Interface */
	void env_init();
	const observation_t* env_start();
	const reward_observation_terminal_t* env_step(const action_t* action);
	void env_cleanup();
	const char* env_message(const char * message);

#ifdef __cplusplus
}
#endif

#endif
