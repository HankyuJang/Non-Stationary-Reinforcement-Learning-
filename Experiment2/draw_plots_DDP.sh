# Load python 3.6
module load python/3.6.0

# DynaQ vs DynaQ+
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 2000 -t bs8_DDP_e0_a04 -o plots/DDP_bs8_e0_a04.png
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 100 -t bs8_start_DDP_e0_a04 -o plots/DDP_bs8_start_e0_a04.png
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8.dat -s_idx 1950 -e_idx 2000 -t bs8_end_DDP_e0_a04 -o plots/DDP_bs8_end_e0_a04.png

#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 2000 -t bs1_DDP_e0_a10 -o plots/DDP_bs1_e0_a10.png
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 100 -t bs1_start_DDP_e0_a10 -o plots/DDP_bs1_start_e0_a10.png
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1.dat -s_idx 1950 -e_idx 2000 -t bs1_end_DDP_e0_a10 -o plots/DDP_bs1_end_e0_a10.png

#################################################################################################
## Bus speed 8to1
#################################################################################################
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 5 -e_idx 4000 -t bs8to1_DDP_e0_a04 -o plots/DDP_bs8to1_e0_a04.png
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 1950 -e_idx 2000 -t bs8to1_50steps_before_DDP_e0_a04 -o plots/DDP_bs8to1_50steps_before_e0_a04.png
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 2000 -e_idx 2050 -t bs8to1_50steps_after_DDP_e0_a04 -o plots/DDP_bs8to1_50steps_after_e0_a04.png
#python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 3950 -e_idx 4000 -t bs8to1_end_DDP_e0_a04 -o plots/DDP_bs8to1_end_e0_a04.png

################################################################################################
# Bus speed 8to1
################################################################################################
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s2 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 5 -e_idx 50000 -y_low 7 -y_high 12 -t bs1to8_DDP_e005 -o plots/DDP_bs1to8_e005_ylim.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s2 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 7950 -e_idx 8000 -t bs1to8_50steps_before_DDP_e005_a005_n16 -o plots/DDP_bs1to8_50steps_before_e005.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s2 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 8000 -e_idx 8100 -t bs1to8_100steps_after_DDP_e005_a005_n16 -o plots/DDP_bs1to8_50steps_after_e005.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s2 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 49950 -e_idx 50000 -t bs1to8_end_DDP_e005_a005_n16 -o plots/DDP_bs1to8_end_e005.png

# Smooth
python plot_steps_DDP_smooth.py -s1 steps/DynaQ_steps_e005_a005_n16_bs1to8.dat -s2 steps/DynaQPlus_steps_e005_a08_n0_k001_bs1to8.dat -s_idx 5 -e_idx 49899 -y_low 7 -y_high 12 -t bs1to8_DDP_e005 -o plots/DDP_smooth_bs1to8_e005_ylim.png
