# Load python 3.6
module load python/3.6.0

################################################################################################
# Bus speed 8
################################################################################################
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a10_bs8.dat -s2 steps/ESarsa_steps_e0_a10_bs8.dat -s3 steps/Q_steps_e0_a10_bs8.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs8 -o plots/SEQD_bs8.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a10_bs8.dat -s2 steps/ESarsa_steps_e0_a10_bs8.dat -s3 steps/Q_steps_e0_a10_bs8.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 100 -t Learning_Curve_bs8_start -o plots/SEQD_bs8_start.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a10_bs8.dat -s2 steps/ESarsa_steps_e0_a10_bs8.dat -s3 steps/Q_steps_e0_a10_bs8.dat -s4 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8_end -o plots/SEQD_bs8_end.png

# DynaQ learning curves
python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e0_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e0_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e0_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e0_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e0_a04_n16_bs8.dat -s7 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs8 -o plots/DynaQ_bs8.png 
python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e0_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e0_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e0_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e0_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e0_a04_n16_bs8.dat -s7 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 20 -t Learning_Curve_bs8_start -o plots/DynaQ_bs8_start.png
python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a08_n0_bs8.dat -s2 steps/DynaQ_steps_e0_a08_n1_bs8.dat -s3 steps/DynaQ_steps_e0_a08_n2_bs8.dat -s4 steps/DynaQ_steps_e0_a08_n4_bs8.dat -s5 steps/DynaQ_steps_e0_a08_n8_bs8.dat -s6 steps/DynaQ_steps_e0_a04_n16_bs8.dat -s7 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8_end -o plots/DynaQ_bs8_end.png
################################################################################################
# Bus speed 1
################################################################################################
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1.dat -s2 steps/ESarsa_steps_e0_a10_bs1.dat -s3 steps/Q_steps_e0_a10_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs1 -o plots/SEQD_bs1.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1.dat -s2 steps/ESarsa_steps_e0_a10_bs1.dat -s3 steps/Q_steps_e0_a10_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 100 -t Learning_Curve_bs1_start -o plots/SEQD_bs1_start.png
python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a08_bs1.dat -s2 steps/ESarsa_steps_e0_a10_bs1.dat -s3 steps/Q_steps_e0_a10_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1_end -o plots/SEQD_bs1_end.png

# DynaQ learning curves
python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e0_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e0_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e0_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e0_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 2000 -t Learning_Curve_bs1 -o plots/DynaQ_bs1.png 
python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e0_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e0_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e0_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e0_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 50 -t Learning_Curve_bs1_start -o plots/DynaQ_bs1_start.png
python plot_steps_DynaQ.py -s1 steps/DynaQ_steps_e0_a10_n0_bs1.dat -s2 steps/DynaQ_steps_e0_a10_n1_bs1.dat -s3 steps/DynaQ_steps_e0_a10_n2_bs1.dat -s4 steps/DynaQ_steps_e0_a10_n4_bs1.dat -s5 steps/DynaQ_steps_e0_a10_n8_bs1.dat -s6 steps/DynaQ_steps_e0_a10_n16_bs1.dat -s7 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1_end -o plots/DynaQ_bs1_end.png

# Q-learning vs DynaQ (n=0)
python plot_steps_QD.py -s1 steps/Q_steps_e0_a04_bs8.dat -s2 steps/DynaQ_steps_e0_a04_n0_bs8.dat -s_idx 5 -e_idx 2000 -t bs8_QD_e0_a04 -o plots/QD_bs8_e0_a04.png
python plot_steps_QD.py -s1 steps/Q_steps_e0_a04_bs8.dat -s2 steps/DynaQ_steps_e0_a04_n0_bs8.dat -s_idx 5 -e_idx 100 -t bs8_start_QD_e0_a04 -o plots/QD_bs8_start_e0_a04.png
python plot_steps_QD.py -s1 steps/Q_steps_e0_a10_bs8.dat -s2 steps/DynaQ_steps_e0_a10_n0_bs8.dat -s_idx 5 -e_idx 2000 -t bs8_QD_e0_a10 -o plots/QD_bs8_e0_a10.png
python plot_steps_QD.py -s1 steps/Q_steps_e0_a10_bs8.dat -s2 steps/DynaQ_steps_e0_a10_n0_bs8.dat -s_idx 5 -e_idx 100 -t bs8_start_QD_e0_a10 -o plots/QD_bs8_start_e0_a10.png




# Learning Curve
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a005_bs8.dat -s2 steps/ESarsa_steps_e0_a005_bs8.dat -s3 steps/Q_steps_e0_a01_bs8.dat -s4 steps/DynaQ_steps_e0_a01_n4_t005_bs8.dat -s_idx 5 -e_idx 30 -t Learning_Curve_bs8 -o plots/SEQD_bs8.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a005_bs8.dat -s2 steps/ESarsa_steps_e0_a005_bs8.dat -s3 steps/Q_steps_e0_a01_bs8.dat -s4 steps/DynaQ_steps_e0_a01_n4_t005_bs8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8_end_behavior -o plots/SEQD_bs8_endbehavior.png

#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a005_bs1.dat -s2 steps/ESarsa_steps_e0_a02_bs1.dat -s3 steps/Q_steps_e0_a005_bs1.dat -s4 steps/DynaQ_steps_e0_a01_n16_t01_bs1.dat -s_idx 5 -e_idx 60 -t Learning_Curve_bs1 -o plots/SEQD_bs1.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a005_bs1.dat -s2 steps/ESarsa_steps_e0_a02_bs1.dat -s3 steps/Q_steps_e0_a005_bs1.dat -s4 steps/DynaQ_steps_e0_a01_n16_t01_bs1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1_end_behavior -o plots/SEQD_bs1_endbehavior.png

#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a01_bs8to1.dat -s2 steps/ESarsa_steps_e0_a005_bs8to1.dat -s3 steps/Q_steps_e0_a005_bs8to1.dat -s4 steps/DynaQ_steps_e0_a01_n4_t005_bs8to1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8to1_before -o plots/SEQD_bs8to1_before.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a01_bs8to1.dat -s2 steps/ESarsa_steps_e0_a005_bs8to1.dat -s3 steps/Q_steps_e0_a005_bs8to1.dat -s4 steps/DynaQ_steps_e0_a01_n4_t005_bs8to1.dat -s_idx 2000 -e_idx 2005 -t Learning_Curve_bs8to1_after -o plots/SEQD_bs8to1_after.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a01_bs8to1.dat -s2 steps/ESarsa_steps_e0_a005_bs8to1.dat -s3 steps/Q_steps_e0_a005_bs8to1.dat -s4 steps/DynaQ_steps_e0_a01_n4_t005_bs8to1.dat -s_idx 3950 -e_idx 4000 -t Learning_Curve_bs8to1_end_behavior -o plots/SEQD_bs8to1_endbehavior.png

#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a005_bs1to8.dat -s2 steps/ESarsa_steps_e0_a005_bs1to8.dat -s3 steps/Q_steps_e0_a005_bs1to8.dat -s4 steps/DynaQ_steps_e0_a005_n1_t02_bs1to8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1to8_before -o plots/SEQD_bs1to8_before.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a005_bs1to8.dat -s2 steps/ESarsa_steps_e0_a005_bs1to8.dat -s3 steps/Q_steps_e0_a005_bs1to8.dat -s4 steps/DynaQ_steps_e0_a005_n1_t02_bs1to8.dat -s_idx 2000 -e_idx 2050 -t Learning_Curve_bs1to8_after_50steps -o plots/SEQD_bs1to8_after_50steps.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e0_a005_bs1to8.dat -s2 steps/ESarsa_steps_e0_a005_bs1to8.dat -s3 steps/Q_steps_e0_a005_bs1to8.dat -s4 steps/DynaQ_steps_e0_a005_n1_t02_bs1to8.dat -s_idx 99950 -e_idx 100000 -t Learning_Curve_bs1to8_end_behavior -o plots/SEQD_bs1to8_endbehavior.png

#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a005_bs8.dat -s2 steps/ESarsa_steps_e005_a005_bs8.dat -s3 steps/Q_steps_e005_a005_bs8.dat -s4 steps/DynaQ_steps_e005_a01_n4_t005_bs8.dat -s_idx 5 -e_idx 30 -t Learning_Curve_bs8 -o plots/SEQD_bs8.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a005_bs1.dat -s2 steps/ESarsa_steps_e005_a02_bs1.dat -s3 steps/Q_steps_e005_a02_bs1.dat -s4 steps/DynaQ_steps_e005_a01_n16_t01_bs1.dat -s_idx 5 -e_idx 60 -t Learning_Curve_bs1 -o plots/SEQD_bs1.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a08_bs8to1.dat -s2 steps/ESarsa_steps_e005_a10_bs8to1.dat -s3 steps/Q_steps_e005_a10_bs8to1.dat -s4 steps/DynaQ_steps_e005_a02_n1_t005_bs8to1.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs8to1_before -o plots/SEQD_bs8to1_before.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a08_bs8to1.dat -s2 steps/ESarsa_steps_e005_a10_bs8to1.dat -s3 steps/Q_steps_e005_a10_bs8to1.dat -s4 steps/DynaQ_steps_e005_a02_n1_t005_bs8to1.dat -s_idx 2000 -e_idx 2005 -t Learning_Curve_bs8to1_after -o plots/SEQD_bs8to1_after.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a005_bs1to8.dat -s3 steps/Q_steps_e005_a005_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n1_t02_bs1to8.dat -s_idx 1950 -e_idx 2000 -t Learning_Curve_bs1to8_before -o plots/SEQD_bs1to8_before.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a005_bs1to8.dat -s3 steps/Q_steps_e005_a005_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n1_t02_bs1to8.dat -s_idx 2000 -e_idx 2050 -t Learning_Curve_bs1to8_after_50steps -o plots/SEQD_bs1to8_after_50steps.png
#python plot_steps_SEQD.py -s1 steps/Sarsa_steps_e005_a04_bs1to8.dat -s2 steps/ESarsa_steps_e005_a005_bs1to8.dat -s3 steps/Q_steps_e005_a005_bs1to8.dat -s4 steps/DynaQ_steps_e005_a005_n1_t02_bs1to8.dat -s_idx 2000 -e_idx 100000 -t Learning_Curve_bs1to8_after -o plots/SEQD_bs1to8_after.png



