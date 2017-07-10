# Load python 3.6
module load python/3.6.0

################################################################################################
# Bus speed 8to1
################################################################################################
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs8to1.dat -s2 steps/ESarsa_steps_e005_a08_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs8to1.dat -s_idx 5 -e_idx 50000 -t Learning_Curve_bs8to1 -o plots/SEQD_bs8to1.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs8to1.dat -s2 steps/ESarsa_steps_e005_a08_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs8to1.dat -s_idx 7950 -e_idx 8000 -t Learning_Curve_bs8to1_50steps_before_change -o plots/SEQD_bs8to1_50steps_before_change.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs8to1.dat -s2 steps/ESarsa_steps_e005_a08_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs8to1.dat -s_idx 8000 -e_idx 8050 -t Learning_Curve_bs8to1_50steps_after_change -o plots/SEQD_bs8to1_50steps_after_change.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs8to1.dat -s2 steps/ESarsa_steps_e005_a08_bs8to1.dat -s3 steps/Q_steps_e005_a08_bs8to1.dat -s4 steps/DynaQ_steps_e005_a02_n4_bs8to1.dat -s_idx 49950 -e_idx 50000 -t Learning_Curve_bs8to1_end -o plots/SEQD_bs8to1_end.png





# DynaQ learning curves
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e005_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e005_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e005_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e005_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e005_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e005_a08_n16_bs8.dat -s7 steps/DynaQ_steps_e005_a08_n32_bs8.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs8 -o plots/DynaQ_bs8.png 
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e005_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e005_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e005_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e005_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e005_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e005_a08_n16_bs8.dat -s7 steps/DynaQ_steps_e005_a08_n32_bs8.dat -s_idx 5 -e_idx 20 -t Learning_Curve_bs8_start -o plots/DynaQ_bs8_start.png
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e005_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e005_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e005_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e005_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e005_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e005_a08_n16_bs8.dat -s7 steps/DynaQ_steps_e005_a08_n32_bs8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8_end -o plots/DynaQ_bs8_end.png

################################################################################################
# Bus speed 1to8
################################################################################################
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 5 -e_idx 50000 -t Learning_Curve_bs1to8 -o plots/SEQD_bs1to8.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 7950 -e_idx 8000 -t Learning_Curve_bs1to8_50steps_before_change -o plots/SEQD_bs1to8_50steps_before_change.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 8000 -e_idx 8050 -t Learning_Curve_bs1to8_8000_8050 -o plots/SEQD_bs1to8_8000_8050.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 8500 -e_idx 8550 -t Learning_Curve_bs1to8_8500_8550 -o plots/SEQD_bs1to8_8500_8550.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 9000 -e_idx 9050 -t Learning_Curve_bs1to8_9000_9050 -o plots/SEQD_bs1to8_9000_9050.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 9500 -e_idx 9550 -t Learning_Curve_bs1to8_9500_9550 -o plots/SEQD_bs1to8_9500_9550.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 49950 -e_idx 50000 -t Learning_Curve_bs1to8_end -o plots/SEQD_bs1to8_end.png

# ylim
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 5 -e_idx 50000 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQD_bs1to8_ylim.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 20000 -e_idx 20500 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQD_bs1to8_ylim_20000_20500.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 30000 -e_idx 30500 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQD_bs1to8_ylim_30000_30500.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s_idx 40000 -e_idx 40500 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQD_bs1to8_ylim_40000_40500.png

# ylim smoothed over 100 neighbors
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 5 -e_idx 49899 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQDP_smooth_bs1to8_ylim.png
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 20000 -e_idx 20500 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQDP_smooth_bs1to8_ylim_20000_20500.png
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 30000 -e_idx 30500 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQDP_smooth_bs1to8_ylim_30000_30500.png
python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e005_a02_bs1to8.dat -s2 steps/ESarsa_steps_e005_a10_bs1to8.dat -s3 steps/Q_steps_e005_a08_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s5 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 40000 -e_idx 40500 -y_low 7 -y_high 12 -t Learning_Curve_bs1to8 -o plots/SEQDP_smooth_bs1to8_ylim_40000_40500.png






# DynaQ learning curves
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e005_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e005_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e005_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e005_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e005_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e005_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e005_a10_n32_bs1.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs1 -o plots/DynaQ_bs1.png 
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e005_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e005_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e005_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e005_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e005_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e005_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e005_a10_n32_bs1.dat -s_idx 5 -e_idx 50 -t Learning_Curve_bs1_start -o plots/DynaQ_bs1_start.png
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e005_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e005_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e005_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e005_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e005_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e005_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e005_a10_n32_bs1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1_end -o plots/DynaQ_bs1_end.png
