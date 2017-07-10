#!/bin/bash

# DynaQPlus

discount=1.0
kappa=0

for Environment in EnvBusSpeed8to1.cxx # EnvBusSpeed1to8.cxx  
do
    make clean
    make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQPlus.cxx utils.c"
    b_str="${Environment%.*}"
    b_str="${b_str#*d}"
    cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"

    if [ $b_str == "1" ] || [ $b_str == "8" ] ; then 
        num_episodes=2000
    elif [ $b_str == "8to1" ] ; then 
        num_episodes=4000
    elif [ $b_str == "1to8" ] ; then 
        num_episodes=10000
    fi

    for epsilon in 0 
    do
        for alpha in 0.05 0.1 0.2 0.4 0.8 1.0
        #for alpha in 0.8
        do
            for n in 0 1 2 4 8 16 32
            #for n in 16
            do
                for kappa in 0.01 0.003 0.001 0.0003 0.0001 0.00003 0.00001
                #for kappa in 0.01 
                do
                    e_str="${epsilon//./}"
                    a_str="${alpha//./}"
                    k_str="${kappa//./}"
                    value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
                    steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
                    ./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps
                done
            done
        done
    done
done
