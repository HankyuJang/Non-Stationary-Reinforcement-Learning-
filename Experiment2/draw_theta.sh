module load python/3.6.0

python plot_theta.py -s1 steps/DynaQ_steps_e0_a005_n4_t005_bs8.dat  -s2 steps/DynaQ_steps_e0_a005_n4_t01_bs8.dat -s3 steps/DynaQ_steps_e0_a005_n4_t02_bs8.dat -s4 steps/DynaQ_steps_e0_a005_n4_t04_bs8.dat -s5 steps/DynaQ_steps_e0_a005_n4_t08_bs8.dat -t Cumulated_steps_to_goal -o plots/DynaQ_steps_e0_a005_n4_bs8.png


