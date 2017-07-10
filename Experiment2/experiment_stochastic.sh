#!/bin/bash

#################################################################################
# epsilon = {0}
# alpha = {0.05, 0.1, 0.2, 0.4, 0.8, 1.0}
# n = {0, 1, 2, 4, 8, 16, 32}
# theta = {0.05, 0.1, 0.2, 0.4, 0.8}
#################################################################################

discount=1.0

#################################################################################
# Sarsa, ESarsa, Q-learning doesn't have parameters n and theta
#################################################################################

n=0
theta=0

#################################################################################
# Sarsa
#################################################################################
for Environment in EnvBusSpeed8to1.cxx EnvBusSpeed1to8.cxx 
do
    make clean
    make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"
    b_str="${Environment%.*}"
    b_str="${b_str#*d}"
    cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"

    if [ $b_str == "1" ] || [ $b_str == "8" ] ; then 
        num_episodes=8000
    elif [ $b_str == "8to1" ] ; then 
        num_episodes=50000
    elif [ $b_str == "1to8" ] ; then 
        num_episodes=50000
    fi

    for epsilon in 0.05
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

#################################################################################
# Expected Sarsa
#################################################################################
for Environment in EnvBusSpeed8to1.cxx EnvBusSpeed1to8.cxx
do
    make clean
    make FILES="${Environment} ExpBusGridworld.cxx AgentESarsa.cxx utils.c"
    b_str="${Environment%.*}"
    b_str="${b_str#*d}"
    cumsteps="cumsteps/ESarsa_cumsteps_bs${b_str}.dat"

    if [ $b_str == "1" ] || [ $b_str == "8" ] ; then 
        num_episodes=8000
    elif [ $b_str == "8to1" ] ; then 
        num_episodes=50000
    elif [ $b_str == "1to8" ] ; then 
        num_episodes=50000
    fi

    for epsilon in 0.05
    do
        for alpha in 0.05 0.1 0.2 0.4 0.8 1.0
        do
            e_str="${epsilon//./}"
            a_str="${alpha//./}"
            value="value/ESarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
            steps="steps/ESarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
            ./RL_Exp $epsilon $alpha $n $num_episodes $discount $theta $value $steps $cumsteps
        done
    done
done

#################################################################################
# Q-learning
#################################################################################
for Environment in EnvBusSpeed8to1.cxx EnvBusSpeed1to8.cxx
do
    make clean
    make FILES="${Environment} ExpBusGridworld.cxx AgentQ.cxx utils.c"
    b_str="${Environment%.*}"
    b_str="${b_str#*d}"
    cumsteps="cumsteps/Q_cumsteps_bs${b_str}.dat"

    if [ $b_str == "1" ] || [ $b_str == "8" ] ; then 
        num_episodes=8000
    elif [ $b_str == "8to1" ] ; then 
        num_episodes=50000
    elif [ $b_str == "1to8" ] ; then 
        num_episodes=50000
    fi

    for epsilon in 0.05
    do
        for alpha in 0.05 0.1 0.2 0.4 0.8 1.0
        do
            e_str="${epsilon//./}"
            a_str="${alpha//./}"
            value="value/Q_value_e${e_str}_a${a_str}_bs${b_str}.dat"
            steps="steps/Q_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
            ./RL_Exp $epsilon $alpha $n $num_episodes $discount $theta $value $steps $cumsteps
        done
    done
done

#################################################################################
# DynaQ
#################################################################################
for Environment in EnvBusSpeed8to1.cxx EnvBusSpeed1to8.cxx
do
    make clean
    make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"
    b_str="${Environment%.*}"
    b_str="${b_str#*d}"
    cumsteps="cumsteps/DynaQ_cumsteps_bs${b_str}.dat"

    if [ $b_str == "1" ] || [ $b_str == "8" ] ; then 
        num_episodes=8000
    elif [ $b_str == "8to1" ] ; then 
        num_episodes=50000
    elif [ $b_str == "1to8" ] ; then 
        num_episodes=50000
    fi

    for epsilon in 0.05
    do
        for alpha in 0.05 0.1 0.2 0.4 0.8 1.0
        do
            for n in 0 1 2 4 8 16 32
            do
                e_str="${epsilon//./}"
                a_str="${alpha//./}"
                t_str="${theta//./}"
                value="value/DynaQ_value_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
                steps="steps/DynaQ_steps_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
                ./RL_Exp $epsilon $alpha $n $num_episodes $discount $theta $value $steps $cumsteps
            done
        done
    done
done
