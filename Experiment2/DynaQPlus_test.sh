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

# DynaQPlus
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
