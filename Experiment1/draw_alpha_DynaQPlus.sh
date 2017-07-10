module load python/3.6.0

# DynaQPlus plots

# Epsilon: 0
for b_str in bs8 bs1 bs8to1 bs1to8
do
    for n in 0 1 2 4 8 16 32
    do
        python plot_alpha.py -s1 steps/DynaQPlus_steps_e0_a005_n${n}_${b_str}.dat -s2 steps/DynaQPlus_steps_e0_a01_n${n}_${b_str}.dat -s3 steps/DynaQPlus_steps_e0_a02_n${n}_${b_str}.dat -s4 steps/DynaQPlus_steps_e0_a04_n${n}_${b_str}.dat -s5 steps/DynaQPlus_steps_e0_a08_n${n}_${b_str}.dat -s6 steps/DynaQPlus_steps_e0_a10_n${n}_${b_str}.dat -t Cumulated_steps_to_goal -o plots/DynaQPlus_steps_e0_n${n}_${b_str}_alpha.png
    done  
done

# Epsilon: 0
#for b_str in bs1to8
#do
    #for n in 0 1 2 4 8 16 32
    #do
        #python plot_alpha.py -s1 steps/DynaQPlus_steps_e0_a005_n${n}_${b_str}.dat -s2 steps/DynaQPlus_steps_e0_a01_n${n}_${b_str}.dat -s3 steps/DynaQPlus_steps_e0_a02_n${n}_${b_str}.dat -s4 steps/DynaQPlus_steps_e0_a04_n${n}_${b_str}.dat -s5 steps/DynaQPlus_steps_e0_a08_n${n}_${b_str}.dat -s6 steps/DynaQPlus_steps_e0_a10_n${n}_${b_str}.dat -t Cumulated_steps_to_goal -o plots/DynaQPlus_steps_e0_n${n}_${b_str}_alpha.png
    #done  
#done
