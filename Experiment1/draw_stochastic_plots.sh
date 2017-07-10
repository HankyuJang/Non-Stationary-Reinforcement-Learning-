# Load python 3.6
module load python/3.6.0

################################################################################################
# Bus speed 8to1
################################################################################################
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s_idx 5 -e_idx 4000 -t Learning_Curve_bs8to1 -o plots/SEQD_bs8to1.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8to1_50steps_before_change -o plots/SEQD_bs8to1_50steps_before_change.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s_idx 2000 -e_idx 2050 -t Learning_Curve_bs8to1_50steps_after_change -o plots/SEQD_bs8to1_50steps_after_change.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a10_bs8to1.dat -s2 steps/ESarsa_steps_e0_a10_bs8to1.dat -s3 steps/Q_steps_e0_a10_bs8to1.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s_idx 3950 -e_idx 4000 -t Learning_Curve_bs8to1_end -o plots/SEQD_bs8to1_end.png



# DynaQ learning curves
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e0_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e0_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e0_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e0_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e0_a08_n16_bs8.dat -s7 steps/DynaQ_steps_e0_a08_n32_bs8.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs8 -o plots/DynaQ_bs8.png 
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e0_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e0_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e0_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e0_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e0_a08_n16_bs8.dat -s7 steps/DynaQ_steps_e0_a08_n32_bs8.dat -s_idx 5 -e_idx 20 -t Learning_Curve_bs8_start -o plots/DynaQ_bs8_start.png
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e0_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e0_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e0_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e0_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e0_a08_n16_bs8.dat -s7 steps/DynaQ_steps_e0_a08_n32_bs8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8_end -o plots/DynaQ_bs8_end.png

################################################################################################
# Bus speed 1to8
################################################################################################
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s_idx 5 -e_idx 10000 -t Learning_Curve_bs1to8 -o plots/SEQD_bs1to8.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1to8_50steps_before_change -o plots/SEQD_bs1to8_50steps_before_change.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s_idx 2000 -e_idx 2050 -t Learning_Curve_bs1to8_2000_2050 -o plots/SEQD_bs1to8_2000_2050.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s_idx 2500 -e_idx 2550 -t Learning_Curve_bs1to8_2500_2550 -o plots/SEQD_bs1to8_2500_2550.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s_idx 3000 -e_idx 3050 -t Learning_Curve_bs1to8_3000_3050 -o plots/SEQD_bs1to8_3000_3050.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s_idx 3500 -e_idx 3550 -t Learning_Curve_bs1to8_3500_3550 -o plots/SEQD_bs1to8_3500_3550.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s_idx 9950 -e_idx 10000 -t Learning_Curve_bs1to8_end -o plots/SEQD_bs1to8_end.png

#python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e0_a08_bs1to8.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8.dat -s3 steps/Q_steps_e0_a10_bs1to8.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s5 steps/DynaQPlus_steps_e0_a06_n1_k0001_bs1to8.dat -s_idx 5 -e_idx 9899 -t Learning_Curve_bs1to8 -o plots/SEQDP_e0_a06_n1_k0001_bs1to8.png

#python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_099.dat -s_idx 5 -e_idx 9899 -t Learning_Curve_bs1to8 -o plots/SEQDP_e0_a08_n16_k001_bs1to8.png
#python plot_steps_SEQDP_smooth.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_099.dat -s_idx 9850 -e_idx 9899 -t Learning_Curve_bs1to8_end -o plots/SEQDP_e0_a08_n16_k001_bs1to8_end.png

python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_099.dat -s_idx 5 -e_idx 10000 -t Learning_Curve_bs1to8 -o plots/SEQDP_bs1to8.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_099.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1to8_before -o plots/SEQDP_bs1to8_before.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_099.dat -s_idx 2000 -e_idx 2050 -t Learning_Curve_bs1to8_after -o plots/SEQDP_bs1to8_after.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_099.dat -s_idx 2050 -e_idx 2100 -y_low 8 -y_high 14 -t Learning_Curve_bs1to8_2050_2100 -o plots/SEQDP_bs1to8_2050_2100.png
python plot_steps_SEQDP.py -s1 steps/Sarsa_steps_e0_a08_bs1to8_05_099.dat -s2 steps/ESarsa_steps_e0_a10_bs1to8_05_099.dat -s3 steps/Q_steps_e0_a10_bs1to8_05_099.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1to8_05_099.dat -s5 steps/DynaQPlus_steps_e0_a08_n16_k001_bs1to8_05_099.dat -s_idx 9850 -e_idx 10000 -t Learning_Curve_bs1to8_end -o plots/SEQDP_bs1to8_end.png


# DynaQ learning curves
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e0_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e0_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e0_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e0_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs1 -o plots/DynaQ_bs1.png 
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e0_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e0_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e0_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e0_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 50 -t Learning_Curve_bs1_start -o plots/DynaQ_bs1_start.png
#python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e0_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e0_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e0_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e0_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1_end -o plots/DynaQ_bs1_end.png
