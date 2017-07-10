#!/bin/bash

#################################################################################
# Sarsa
#################################################################################

# Usage

# make clean
# make FILES="EnvBusSpeed8.cxx ExpBusGridworld.cxx AgentSarsa.cxx utils.c"
# ./RL_Exp 0 0.05 0 2000 1.0 0 value/Sarsa_value_2000_e0_a005_bs8.dat steps/Sarsa_steps_2000_e0_a005_bs8.dat Sarsa_cumsteps.dat

# epsilon = {0, 0.05, 0.1}
# alpha = {0.05, 0.1, 0.2, 0.4, 0.8, 1.0}

discount=1.0
# Sarsa doesn't have parameters n and theta
n=0
theta=0

#################################################################################
for Environment in EnvBusSpeed8.cxx EnvBusSpeed1.cxx #EnvBusSpeed8to1.cxx EnvBusSpeed1to8.cxx  
do
    make clean
    make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"
    b_str="${Environment%.*}"
    b_str="${b_str#*d}"
    cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"

    if [ $b_str == "1" ] || [ $b_str == "8" ] ; then 
        num_episodes=2000
    elif [ $b_str == "8to1" ] ; then 
        num_episodes=4000
    elif [ $b_str == "1to8" ] ; then 
        num_episodes=100000
    fi

    for epsilon in 0 0.05 0.1
    do
        for alpha in 0.05 0.1 0.2 0.4 0.8 1.0
        do
            e_str="${epsilon//./}"
            a_str="${alpha//./}"
            value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
            steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
            ./RL_Exp $epsilon $alpha $n $num_episodes $discount $theta $value $steps $cumsteps
        done
    done
done

