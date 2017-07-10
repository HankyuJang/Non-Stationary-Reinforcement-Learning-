#!/bin/bash
module load python/3.6.0
#################################################################################
# EXPERIMENT1
# 
#    S_STATE 50
#    G_STATE 19
#
#    bus_stop[0] = 28;
#    bus_stop[1] = 42;
#
#    road[0] = 28;
#    road[1] = 38;
#    road[2] = 48;
#    road[3] = 47;
#    road[4] = 46;
#    road[5] = 45;
#    road[6] = 44;
#    road[7] = 43;
#    road[8] = 42;
#    road[9] = 32;
#    road[10] = 22;
#    road[11] = 23;
#    road[12] = 24;
#    road[13] = 25;
#    road[14] = 26;
#    road[15] = 27;
#
# The experiments and plots drawn from here is only for the ones used in the paper.
# Other experiments and plots to find the good parameter sets are in bash scripts.

rm -f cumsteps/*.dat
rm -f steps/*.dat
rm -f value/*.dat
rm -f plots/*.png

#################################################################################
# Bus speed 8
#################################################################################
Environment=EnvBusSpeed8.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=2000
discount=1.0
n=0
kappa=0

# Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# Expected Sarsa
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

# Q-learning
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

# DynaQ
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"

n=32
epsilon=0
alpha=0.4
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/DynaQ_value_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
steps="steps/DynaQ_steps_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQ_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQPlus
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQPlus.cxx utils.c"

n=32
epsilon=0
alpha=0.8
kappa=0.0001
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"

./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8.dat -s2 steps/ESarsa_steps_e0_a10_bs8.dat -s3 steps/Q_steps_e0_a10_bs8.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8.dat -s_idx 5 -e_idx 2000 -t "Learning Curve: Bus speed8" -o plots/SEQDP_bs8.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8.dat -s2 steps/ESarsa_steps_e0_a10_bs8.dat -s3 steps/Q_steps_e0_a10_bs8.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8.dat -s_idx 5 -e_idx 50 -t "Learning Curve: Bus speed8 start" -o plots/SEQDP_bs8_start.png

python plot_value.py -v value/Sarsa_value_e0_a10_bs8.dat -t "Heatmap of the Bus Gridworld (Bus speed:8)" -o plots/Sarsa_value_e0_a10_bs8.png

#################################################################################
# Bus speed 1
#################################################################################
Environment=EnvBusSpeed1.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=2000
discount=1.0
n=0
kappa=0

# Sarsa
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

# ESarsa
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

# Q
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

# DynaQ
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

# DynaQPlus
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
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1.dat -s2 steps/ESarsa_steps_e0_a10_bs1.dat -s3 steps/Q_steps_e0_a10_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1.dat -s_idx 5 -e_idx 2000 -t "Learning Curve: Bus speed1" -o plots/SEQDP_bs1.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1.dat -s2 steps/ESarsa_steps_e0_a10_bs1.dat -s3 steps/Q_steps_e0_a10_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1.dat -s_idx 5 -e_idx 50 -t "Learning Curve: Bus speed1 Start" -o plots/SEQDP_bs1_start.png

python plot_value.py -v value/Sarsa_value_e0_a08_bs1.dat -t "Heatmap of the Bus Gridworld (Bus speed:1)" -o plots/Sarsa_value_e0_a08_bs1.png

#################################################################################
# Bus speed 8 to 1
#################################################################################
Environment=EnvBusSpeed8to1.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=4000
discount=1.0
n=0
kappa=0

# Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# ESarsa
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

# Q
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

# DynaQ
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"

n=32
epsilon=0
alpha=0.4
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/DynaQ_value_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
steps="steps/DynaQ_steps_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQ_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQPlus
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQPlus.cxx utils.c"

n=32
epsilon=0
alpha=0.8
kappa=0.0001
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 5 -e_idx 4000 -t "Learning Curve: Bus speed8 to speed1 at episode 2000" -o plots/SEQDP_bs8to1.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 5 -e_idx 4000 -y_low 0 -y_high 30 -t "Learning Curve: Bus speed8 to speed1 at episode 2000" -o plots/SEQDP_bs8to1_ylim30.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 2000 -e_idx 3000 -y_low 10 -y_high 30 -t "Learning Curve: Bus speed8 to speed1 at episode 2000" -o plots/SEQDP_bs8to1_after_ylim30.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 1950 -e_idx 2000 -t "Learning Curve: episode 1950 to episode 2000" -o plots/SEQDP_bs8to1_before.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 2000 -e_idx 2050 -t "Learning Curve: episode 2000 to episode 2050" -o plots/SEQDP_bs8to1_after.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 2000 -e_idx 2200 -t "Learning Curve: episode 2000 to episode 2200" -o plots/SEQDP_bs8to1_after_2200.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 2000 -e_idx 2500 -t "Learning Curve: episode 2000 to episode 2500" -o plots/SEQDP_bs8to1_after_2500.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s5 steps/DynaQPlus_steps_e0_a08_n32_k00001_bs8to1.dat -s_idx 3950 -e_idx 4000 -t "Learning Curve: end behavior" -o plots/SEQDP_bs8to1_end.png



#################################################################################
# Bus speed 1 to 8
#################################################################################
Environment=EnvBusSpeed1to8.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=10000
discount=1.0
n=0
kappa=0

# Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0
alpha=0.8
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}_05_095.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}_05_095.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# ESarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentESarsa.cxx utils.c"

epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/ESarsa_value_e${e_str}_a${a_str}_bs${b_str}_05_095.dat"
steps="steps/ESarsa_steps_e${e_str}_a${a_str}_bs${b_str}_05_095.dat"
cumsteps="cumsteps/ESarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# Q
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentQ.cxx utils.c"

epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Q_value_e${e_str}_a${a_str}_bs${b_str}_05_095.dat"
steps="steps/Q_steps_e${e_str}_a${a_str}_bs${b_str}_05_095.dat"
cumsteps="cumsteps/Q_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQ
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"

n=32
epsilon=0
alpha=1.0
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/DynaQ_value_e${e_str}_a${a_str}_n${n}_bs${b_str}_05_095.dat"
steps="steps/DynaQ_steps_e${e_str}_a${a_str}_n${n}_bs${b_str}_05_095.dat"
cumsteps="cumsteps/DynaQ_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQPlus
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQPlus.cxx utils.c"

n=16
epsilon=0
alpha=0.8
kappa=0.01
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}_05_095.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}_05_095.dat"
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_095.dat -s_idx 5 -e_idx 10000 -t "Learning Curve: Bus speed1 to speed8 at episode 2000" -o plots/SEQDP_bs1to8.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_095.dat -s_idx 5 -e_idx 10000 -y_low 0 -y_high 20 -t "Learning Curve: Bus speed1 to speed8 at episode 2000" -o plots/SEQDP_bs1to8_ylim20.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_095.dat -s_idx 1950 -e_idx 2000 -t "Learning Curve: episode 1950 to episode 2000" -o plots/SEQDP_bs1to8_before.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_095.dat -s_idx 2000 -e_idx 2050 -t "Learning Curve: episode 2000 to episode 2050" -o plots/SEQDP_bs1to8_after.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_095.dat -s_idx 2000 -e_idx 2200 -y_low 8 -y_high 20 -t "Learning Curve: episode 2000 to episode 2200" -o plots/SEQDP_bs1to8_after_ylim20.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_095.dat -s_idx 2050 -e_idx 2100 -y_low 8 -y_high 14 -t "Learning Curve: episode 2050 to episode 2100 zoom in" -o plots/SEQDP_bs1to8_2050_2100.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_095.dat -s_idx 9950 -e_idx 10000 -t "Learning Curve: end behavior" -o plots/SEQDP_bs1to8_end.png

