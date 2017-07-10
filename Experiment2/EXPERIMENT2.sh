#!/bin/bash
module load python/3.6.0
#################################################################################
# EXPERIMENT1
# 
#    S_STATE 50
#    G_STATE 49
#
#    road[0] = 48;
#    road[1] = 47;
#    road[2] = 46;
#    road[3] = 45;
#    road[4] = 44;
#    road[5] = 43;
#    road[6] = 42;
#    road[7] = 32;
#    road[8] = 22;
#    road[9] = 23;
#    road[10] = 24;
#    road[11] = 25;
#    road[12] = 26;
#    road[13] = 27;
#    road[14] = 28;
#    road[15] = 38;
#
#    bus_stop[0] = 28;
#    bus_stop[1] = 42;
#
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
num_episodes=8000
discount=1.0
n=0
kappa=0

# Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0.05
alpha=0.4
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# Expected Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentESarsa.cxx utils.c"

epsilon=0.05
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

epsilon=0.05
alpha=0.8
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Q_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Q_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Q_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQ
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"

n=1
epsilon=0.05
alpha=0.4
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/DynaQ_value_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
steps="steps/DynaQ_steps_e${e_str}_a${a_str}_n${n}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQPlus
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQPlus.cxx utils.c"

n=1
epsilon=0.05
alpha=0.4
kappa=0.00003
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"

./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs8.dat -s2 steps/ESarsa_steps_e005_a10_bs8.dat -s3 steps/Q_steps_e005_a08_bs8.dat -s4 steps/DynaQ_steps_e005_a04_n1_bs8.dat -s5 steps/DynaQPlus_steps_e005_a04_n1_k000003_bs8.dat -s_idx 5 -e_idx 8000 -t "Learning Curve: Bus speed8" -o plots/SEQDP_bs8.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs8.dat -s2 steps/ESarsa_steps_e005_a10_bs8.dat -s3 steps/Q_steps_e005_a08_bs8.dat -s4 steps/DynaQ_steps_e005_a04_n1_bs8.dat -s5 steps/DynaQPlus_steps_e005_a04_n1_k000003_bs8.dat -s_idx 5 -e_idx 50 -t "Learning Curve: Bus speed8 start" -o plots/SEQDP_bs8_start.png

python plot_value.py -v value/Sarsa_value_e005_a04_bs8.dat -t "Heatmap of the Bus Gridworld (Bus speed:8)" -o plots/Sarsa_value_e005_a04_bs8.png

#################################################################################
# Bus speed 1
#################################################################################
Environment=EnvBusSpeed1.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=8000
discount=1.0
n=0
kappa=0

# Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0.05
alpha=0.4
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# ESarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentESarsa.cxx utils.c"

epsilon=0.05
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

epsilon=0.05
alpha=0.8
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
epsilon=0.05
alpha=0.8
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
epsilon=0.05
alpha=0.8
kappa=0.0001
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs1.dat -s2 steps/ESarsa_steps_e005_a10_bs1.dat -s3 steps/Q_steps_e005_a08_bs1.dat -s4 steps/DynaQ_steps_e005_a08_n32_bs1.dat -s5 steps/DynaQPlus_steps_e005_a08_n32_k00001_bs1.dat -s_idx 5 -e_idx 8000 -t "Learning Curve: Bus speed1" -o plots/SEQDP_bs1.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs1.dat -s2 steps/ESarsa_steps_e005_a10_bs1.dat -s3 steps/Q_steps_e005_a08_bs1.dat -s4 steps/DynaQ_steps_e005_a08_n32_bs1.dat -s5 steps/DynaQPlus_steps_e005_a08_n32_k00001_bs1.dat -s_idx 5 -e_idx 50 -t "Learning Curve: Bus speed1 Start" -o plots/SEQDP_bs1_start.png

python plot_value.py -v value/Sarsa_value_e005_a04_bs1.dat -t "Heatmap of the Bus Gridworld (Bus speed:1)" -o plots/Sarsa_value_e005_a04_bs1.png

#################################################################################
# Bus speed 8 to 1
#################################################################################
Environment=EnvBusSpeed8to1.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=50000
discount=1.0
n=0
kappa=0

# Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0.05
alpha=0.05
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# ESarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentESarsa.cxx utils.c"

epsilon=0.05
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

epsilon=0.05
alpha=0.8
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Q_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Q_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Q_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQ
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"

n=1
epsilon=0.05
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

n=2
epsilon=0.05
alpha=0.4
kappa=0.001
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a005_bs8to1.dat -s2 steps/ESarsa_steps_e005_a10_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a04_n1_bs8to1.dat -s5 steps/DynaQPlus_steps_e005_a04_n2_k0001_bs8to1.dat -s_idx 5 -e_idx 50000 -t "Learning Curve: Bus speed8 to speed1 at episode 8000" -o plots/SEQDP_bs8to1.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a005_bs8to1.dat -s2 steps/ESarsa_steps_e005_a10_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a04_n1_bs8to1.dat -s5 steps/DynaQPlus_steps_e005_a04_n2_k0001_bs8to1.dat -s_idx 5 -e_idx 50000 -y_low 6 -y_high 30 -t "Learning Curve: Bus speed8 to speed1 at episode 8000" -o plots/SEQDP_bs8to1_ylim30.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a005_bs8to1.dat -s2 steps/ESarsa_steps_e005_a10_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a04_n1_bs8to1.dat -s5 steps/DynaQPlus_steps_e005_a04_n2_k0001_bs8to1.dat -s_idx 7950 -e_idx 8000 -t "Learning Curve: episode 7950 to episode 8000" -o plots/SEQDP_bs8to1_before.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a005_bs8to1.dat -s2 steps/ESarsa_steps_e005_a10_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a04_n1_bs8to1.dat -s5 steps/DynaQPlus_steps_e005_a04_n2_k0001_bs8to1.dat -s_idx 8000 -e_idx 8200 -t "Learning Curve: episode 8000 to episode 8200" -o plots/SEQDP_bs8to1_after.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a005_bs8to1.dat -s2 steps/ESarsa_steps_e005_a10_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a04_n1_bs8to1.dat -s5 steps/DynaQPlus_steps_e005_a04_n2_k0001_bs8to1.dat -s_idx 49950 -e_idx 50000 -t "Learning Curve: end behavior" -o plots/SEQDP_bs8to1_end.png



#################################################################################
# Bus speed 1 to 8
#################################################################################
Environment=EnvBusSpeed1to8.cxx
b_str="${Environment%.*}"
b_str="${b_str#*d}"
num_episodes=50000
discount=1.0
n=0
kappa=0

# Sarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentSarsa.cxx utils.c"

epsilon=0.05
alpha=0.4
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Sarsa_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Sarsa_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Sarsa_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# ESarsa
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentESarsa.cxx utils.c"

epsilon=0.05
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

epsilon=0.05
alpha=0.8
e_str="${epsilon//./}"
a_str="${alpha//./}"
value="value/Q_value_e${e_str}_a${a_str}_bs${b_str}.dat"
steps="steps/Q_steps_e${e_str}_a${a_str}_bs${b_str}.dat"
cumsteps="cumsteps/Q_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

# DynaQ
make clean
make FILES="${Environment} ExpBusGridworld.cxx AgentDynaQ.cxx utils.c"

n=4
epsilon=0.05
alpha=0.2
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

n=0
epsilon=0.05
alpha=0.8
kappa=0.01
e_str="${epsilon//./}"
a_str="${alpha//./}"
k_str="${kappa//./}"
value="value/DynaQPlus_value_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
steps="steps/DynaQPlus_steps_e${e_str}_a${a_str}_n${n}_k${k_str}_bs${b_str}.dat"
cumsteps="cumsteps/DynaQPlus_cumsteps_bs${b_str}.dat"
./RL_Exp $epsilon $alpha $n $num_episodes $discount $kappa $value $steps $cumsteps

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 5 -e_idx 50000  -t "Learning Curve: Bus speed1 to speed8 at episode 8000" -o plots/SEQDP_bs1to8.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 7950 -e_idx 8000 -t "Learning Curve: episode 7950 to episode 8000" -o plots/SEQDP_bs1to8_before.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 8000 -e_idx 8050 -t "Learning Curve: episode 8000 to episode 8050" -o plots/SEQDP_bs1to8_after.png
#python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 2050 -e_idx 2100 -y_low 8 -y_high 14 -t "Learning Curve: episode 8050 to episode 8100 zoom in" -o plots/SEQDP_bs1to8_2050_2100.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 49950 -e_idx 50000 -t "Learning Curve: end behavior" -o plots/SEQDP_bs1to8_end.png

# Smoothed version
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 5 -e_idx 49899 -t "Learning Curve: Bus speed1 to speed8 at episode 8000" -o plots/SEQDP_smooth_bs1to8.png
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 5 -e_idx 49899 -y_low 8 -y_high 11 -t "Learning Curve: Bus speed1 to speed8 at episode 8000" -o plots/SEQDP_bs1to8_ylim11.png
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 8000 -e_idx 49899 -y_low 8 -y_high 11 -t "Learning Curve: after episode 8000" -o plots/SEQDP_smooth_bs1to8_after_8000episodes_ylim11.png
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 8000 -e_idx 8200 -y_low 8 -y_high 11 -t "Learning Curve: episode 8000 to 8200" -o plots/SEQDP_smooth_bs1to8_after_8000_8200_ylim11.png
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 49850 -e_idx 49899 -t "Learning Curve: end behavior" -o plots/SEQDP_smooth_bs1to8_end.png
