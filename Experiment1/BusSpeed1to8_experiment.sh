#!/bin/bash

discount=1.0
n=0
kappa=0

#################################################################################
# Bus speed 1 to 8
#################################################################################
Environment=EnvBusSpeed1to8.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=10000

#################################################################################
# Sarsa
#################################################################################
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0
alpha=0.8
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

#################################################################################
# ESarsa
#################################################################################
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentESarsa.cxx utils.c"

epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/ESarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/ESarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/ESarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

#################################################################################
# Q
#################################################################################
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentQ.cxx utils.c"

epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Q_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Q_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Q_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

#################################################################################
# DynaQ
#################################################################################
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"

n=32
epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/DynaQ_value_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
steps="steps/DynaQ_steps_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQ_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

#################################################################################
# DynaQPlus
#################################################################################
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQPlus.cxx utils.c"

n=16
epsilon=0
alpha=0.8
kappa=0.01
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQ_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps


