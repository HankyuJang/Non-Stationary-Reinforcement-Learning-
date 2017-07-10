/*
 * 
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "RL_glue.h"
#include "Agent_common.h"
#include "Environment_common.h"

//#include "RLStruct_util.h"

#include <assert.h>


static const action_t *last_action;
static double total_reward = 0;
static int num_steps       = 0;
static int num_episodes    = 0;


void RL_init() {
      env_init();
      agent_init();

      total_reward=0;
      num_steps=0;
      num_episodes=0;

      /* 
       * Assumes environment allocated space for task_spec in env_init 
       * So it is perfectly valid to return a pointer to this char *
       */
      return;
}

const observation_action_t* RL_start() {
      const observation_t *last_state;
      static observation_action_t oa;

      total_reward=0;
      num_steps=1;

      last_state = env_start();
      last_action = agent_start(last_state);

      oa.observation = last_state;
      oa.action = last_action;

      return &oa;
}

const action_t* RL_agent_start(const observation_t* observation){
      return agent_start(observation);
}
const action_t* RL_agent_step(double reward, const observation_t* observation){
      return agent_step(reward, observation);
}
void RL_agent_end(double reward){
      agent_end(reward);
}
const observation_t* RL_env_start(){
      const observation_t *thisObservation=0;

      total_reward=0;
      num_steps=1;

      thisObservation = env_start();
      return thisObservation;
}
const reward_observation_terminal_t* RL_env_step(const action_t* action){
      const reward_observation_terminal_t *ro=0;
      double this_reward=0;

      ro = env_step(action);
      this_reward = ro->reward;

      total_reward += this_reward;

      if (ro->terminal == 1) {
         num_episodes += 1;
      }
      else {
         num_steps+=1;
      }
      return ro;
}

const reward_observation_action_terminal_t * RL_step() {
      /* 
       * Despite returning a pointer to a static variable this function is re-entrant
       * because the values in roa are completely replaced each time
       */
      static reward_observation_action_terminal_t roa={0,0,0,0};
      const reward_observation_terminal_t *ro;
      double this_reward=0;
      const observation_t *last_state;

      ro = env_step(last_action);
      this_reward = ro->reward;
      last_state = ro->observation;
  
      roa.reward = ro->reward;
      roa.observation = ro->observation;
      roa.terminal = ro->terminal;
  
      total_reward += this_reward;

      /* Sept 28/08, The reason that we only increment stepcount if we're not terminal is that if an episode ends on 
         its first env_step, num_step will be 1 from env_start, but we don't want to go to num_step=2.*/
      if (ro->terminal == 1) {
         num_episodes += 1;
         agent_end(this_reward);
      }
      else {
         num_steps+=1;
         last_action = agent_step(this_reward,last_state);
         roa.action = last_action;
      }

      return &roa;
}

void RL_cleanup() {
      env_cleanup();
      agent_cleanup();
}

const char* RL_agent_message(const char* message) {
      const char *theAgentResponse=0;
      const char *messageToSend=0;

      if(message!=0){
         messageToSend=message;
      }else{
         messageToSend="";
      }

      theAgentResponse=agent_message(messageToSend);
      if(theAgentResponse==0){
         return "";
      }

      return theAgentResponse;
}

const char* RL_env_message(const char* message) {
      const char *theEnvResponse=0;
      const char *messageToSend=0;

      if(message!=0){
         messageToSend=message;
      }else{
         messageToSend="";
      }

      theEnvResponse=env_message(messageToSend);
      if(theEnvResponse==0){
         return "";
      }

      return theEnvResponse;
}

int RL_episode(const unsigned int maxStepsThisEpisode) {
      const reward_observation_action_terminal_t *rl_step_result=0;
      int isTerminal=0;

	
      RL_start();
      /*RL_start sets steps to 1*/
      for (; !isTerminal && (maxStepsThisEpisode == 0 ? 1 : num_steps < maxStepsThisEpisode); ) {
         rl_step_result=RL_step();
         isTerminal=rl_step_result->terminal;
      }

      /*Return the value of terminal to tell the caller whether the episode ended naturally or was cut off*/
      return isTerminal;
}

double RL_return() {
      return total_reward;
}

int RL_num_steps() {
      /* number of steps of the current or just completed episodes of run */
      return num_steps;
}

int RL_num_episodes() {
      return num_episodes;
}
