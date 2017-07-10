**B659 - RLGlue README.md**
====================

Created by: Matthew Schlegel, Created on: Jan 3, 2017

This will be a general overview of the framework used for this course. It is a simpler version of the RLGlue found at http://glue.rl-community.org/wiki/Main_Page.
Please use this for ALL assignment code unless otherwise specified in the assignment or in class. If there are any questions contact Adam White or Matthew Schlegel.

You should only use gsl as your linear algebra pack, no other LA libraries will be used during grading.


Makefile
---------------------

The makefile you will be customizing is called Makefile.settings. This includes all
the necessary details to change your compilation to your liking. Please do not change
the main makefile as we will be using the original during grading. If there is something
you need access to that you can't get using this system contact Matthew Schlegel and we'll
figure out a solution.

The first three variables you need to notice in makefile.settings are INCLUDE, LIBS, 
and FILES.

INCLUDE: Where the header files for the libraries used (such as gsl) are located.
LIBS: Which libraries to link against when compiling.
FILES: Your files to compile.

**NOTE:**
A note on the extension names for SimpleAgent, SimpleEnv, and SimpleExp. The .cxx is used for files if you want to rely on the makefile to manage your build type. You can replace these with .c or .cpp, but make sure you compile for c or cpp respectively and ensure they are the same type (see below).


There are several options in the makefile you can tweak if you wish but the given makefile can compile for both c and cpp
out of the box. The versions used are the default versions compiled by your gcc/g++ (you can change this using EXTRA_CFLAGS or EXTRA_CPPFLAGS through `make EXTRA_CPPFLAGS=-std=c++11`
	or by setting EXTRA_CPPFLAGS=-std=c++11 in Makefile.settings).

To compile for c you are done and can just use make as normal.

	make

To use cpp there are two options. Either you can use the command

	make language_selection=cpp

or your can tweak the make file at line 48-51 to

	#cpp
	language_selection ?= cpp
	#c
	#language_selection ?= c

Finally you can change your compiler for c and cpp at lines 52 and 53, but I recommend
using gcc and g++ on silo/sharks to test your code before submitting.


Environment file : SimpleEnv.cxx
---------------------

this contains a simple environment implementation and what you should base your environments on during this class. There are several functions and variables you should notice.

### void env_init() {...}

The env_init function manages the initialization of the environment at the beginning of the program. It is invoked during the RL_init(...) call. You should initialize most if not all
the dynamic memory your environment needs.

### const observation_t* env_start() {...}

The env_start function is called at the beginning of a run of the experiment. It is invoked
during the RL_start function and should return the initial observation of the environment.

### const reward_observation_terminal_t *env_step(const action_t *this_action) {...}

This is the meat of the environment and where most of an experiment will take place. This 
should update the environment based on the given action, and return the local
reward_observation_terminal_t* (see the RL_common.h for the type definition).

### void env_cleanup() {...}

This function is called at the end of an experiment and should deallocate any memory dynamically allocated by the environment.

### const char* env_message(const char* inMessage) {...}

This function is used for sending messages from your experiment to your environment


Agent file : SimpleAgent.cxx
---------------------

this contains a simple agent implementation and what you should base your agents on during this class. There are several functions and variables you should notice.

### void agent_init(){...}

The agent_init function manages the initialization of the agent at the beginning of the program. It is invoked during the RL_init(...) call. You should initialize most if not all
the dynamic memory your agent needs.

### const action_t *agent_start(const observation_t *this_observation){...}

The agent_start function is called at the beginning of a run of the experiment. It is
invoked after the environment makes its first observation during the RL_start(...) function.
You should initialize what you need here but should typically not allocate any memory.

This function also returns an action_t*, which is a gsl vector which contains the next action
to be sent to the environment.

### const action_t *agent_step(double reward, const observation_t *this_observation) {...}

This is the meat of the agent and where most of the learning takes place. You will implement 
various RL algorithms here.

This function also returns an action_t*, which is a gsl vector which contains the next action
to be sent to the environment.

### void agent_end(double reward) {...}

This function is called at the end of an episode.

### void agent_cleanup() {...}

This function is called at the end of an experiment and should deallocate any memory dynamically allocated by the agent.

### const char* agent_message(const char* inMessage) {...}

This function is used for sending messages across your environment, agent and experiment.

Experiment file : SimpleExp.cxx
---------------------

This file contains a basic episode based RL experiment.


Parameter Sweeping : ParameterSweepExp.cxx ParameterSweepAgent.cxx ParameterSweep.h
---------------------

These files are a simple way of performing a parameter sweep with the given framework.
If you have any questions about this please ask. This only uses one learning parameter
for a sweep but can be easily extended to include more. To run this change lines 24-26
in your Makefile.settings to

	#Change this to add the files you need to compile. (Your added files while doing homework.)
	# FILES = SimpleEnv.cxx SimpleAgent.cxx SimpleExp.cxx utils.c
	FILES = SimpleEnv.cxx ParameterSweepAgent.cxx ParameterSweepExp.cxx utils.c

**HINT**: Notice how you can use your environment file for multiple different experiments and
agents. You can also implement in such a way to have the experiment be reused with different
agents as well.

Plotting: plot.r
--------------------

This is just an example plot file. Please feel free using any plotting language you wish, 
but still include all code used for plotting.
