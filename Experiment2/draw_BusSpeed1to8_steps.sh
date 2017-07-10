# Load python 3.6
module load python/3.6.0

# At step 2000, epsilon: 0.5
# After step 2000, epsilon = epsilon * 0.95 (per episode)
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s_idx 5 -e_idx 10000 -t Learning_Curve_05_095_bs1to8 -o plots/SEQD_bs1to8_05_095.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_05_095_bs1to8_50steps_before_change -o plots/SEQD_bs1to8_05_095_50steps_before_change.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s_idx 2000 -e_idx 2050 -t Learning_Curve_05_095_bs1to8_2000_2050 -o plots/SEQD_bs1to8_05_095_2000_2050.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s_idx 2500 -e_idx 2550 -t Learning_Curve_05_095_bs1to8_2500_2550 -o plots/SEQD_bs1to8_05_095_2500_2550.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s_idx 3000 -e_idx 3050 -t Learning_Curve_05_095_bs1to8_3000_3050 -o plots/SEQD_bs1to8_05_095_3000_3050.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s_idx 3500 -e_idx 3550 -t Learning_Curve_05_095_bs1to8_3500_3550 -o plots/SEQD_bs1to8_05_095_3500_3550.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_095.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_095.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_095.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_095.dat -s_idx 9950 -e_idx 10000 -t Learning_Curve_05_095_bs1to8_end -o plots/SEQD_bs1to8_05_095_end.png

# At step 2000, epsilon: 0.5
# After step 2000, epsilon = epsilon * 0.99 (per episode)
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s_idx 5 -e_idx 10000 -t Learning_Curve_05_099_bs1to8 -o plots/SEQD_bs1to8_05_099.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s_idx 1990 -e_idx 2000 -t Learning_Curve_05_099_bs1to8_50steps_before_change -o plots/SEQD_bs1to8_05_099_50steps_before_change.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s_idx 2000 -e_idx 2050 -t Learning_Curve_05_099_bs1to8_2000_2050 -o plots/SEQD_bs1to8_05_099_2000_2050.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s_idx 2500 -e_idx 2550 -t Learning_Curve_05_099_bs1to8_2500_2550 -o plots/SEQD_bs1to8_05_099_2500_2550.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s_idx 3000 -e_idx 3050 -t Learning_Curve_05_099_bs1to8_3000_3050 -o plots/SEQD_bs1to8_05_099_3000_3050.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s_idx 3500 -e_idx 3550 -t Learning_Curve_05_099_bs1to8_3500_3550 -o plots/SEQD_bs1to8_05_099_3500_3550.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s_idx 9950 -e_idx 10000 -t Learning_Curve_05_099_bs1to8_end -o plots/SEQD_bs1to8_05_099_end.png

