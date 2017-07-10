# Load python 3.6
module load python/3.6.0

# DynaQ vs DynaQ+
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 2000 -t bs8_DDP_e0_a04 -o plots/DDP_bs8_e0_a04.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8.dat -s_idx 5 -e_idx 100 -t bs8_start_DDP_e0_a04 -o plots/DDP_bs8_start_e0_a04.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8.dat -s_idx 1950 -e_idx 2000 -t bs8_end_DDP_e0_a04 -o plots/DDP_bs8_end_e0_a04.png

python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 2000 -t bs1_DDP_e0_a10 -o plots/DDP_bs1_e0_a10.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1.dat -s_idx 5 -e_idx 100 -t bs1_start_DDP_e0_a10 -o plots/DDP_bs1_start_e0_a10.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1.dat -s_idx 1950 -e_idx 2000 -t bs1_end_DDP_e0_a10 -o plots/DDP_bs1_end_e0_a10.png

################################################################################################
# Bus speed 8to1
################################################################################################
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 5 -e_idx 4000 -t bs8to1_DDP_e0_a04 -o plots/DDP_bs8to1_e0_a04.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 1950 -e_idx 2000 -t bs8to1_50steps_before_DDP_e0_a04 -o plots/DDP_bs8to1_50steps_before_e0_a04.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 2000 -e_idx 2050 -t bs8to1_50steps_after_DDP_e0_a04 -o plots/DDP_bs8to1_50steps_after_e0_a04.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a04_n32_bs8to1.dat -s2 steps/DynaQPlus_steps_e0_a04_n32_bs8to1.dat -s_idx 3950 -e_idx 4000 -t bs8to1_end_DDP_e0_a04 -o plots/DDP_bs8to1_end_e0_a04.png

################################################################################################
# Bus speed 8to1
################################################################################################
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1to8.dat -s_idx 5 -e_idx 100000 -t bs1to8_DDP_e0_a10_n32 -o plots/DDP_bs1to8_e0_a10_n32.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1to8.dat -s_idx 1950 -e_idx 2000 -t bs1to8_50steps_before_DDP_e0_a10_n32 -o plots/DDP_bs1to8_50steps_before_e0_a10_n32.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1to8.dat -s_idx 2000 -e_idx 2100 -t bs1to8_100steps_after_DDP_e0_a10_n32 -o plots/DDP_bs1to8_50steps_after_e0_a10_n32.png
python plot_steps_DDP.py -s1 steps/DynaQ_steps_e0_a10_n32_bs1to8.dat -s2 steps/DynaQPlus_steps_e0_a10_n32_bs1to8.dat -s_idx 99950 -e_idx 100000 -t bs1to8_end_DDP_e0_a10_n32 -o plots/DDP_bs1to8_end_e0_a10_n32.png


