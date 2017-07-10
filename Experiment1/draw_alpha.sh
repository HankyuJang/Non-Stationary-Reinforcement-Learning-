module load python/3.6.0

for b_str in bs8 bs1 bs8to1 bs1to8
do
    python plot_alpha.py -s1 steps/Sarsa_steps_e0_a005_${b_str}.dat  -s2 steps/Sarsa_steps_e0_a01_${b_str}.dat  -s3 steps/Sarsa_steps_e0_a02_${b_str}.dat -s4 steps/Sarsa_steps_e0_a04_${b_str}.dat   -s5 steps/Sarsa_steps_e0_a08_${b_str}.dat  -s6 steps/Sarsa_steps_e0_a10_${b_str}.dat -t Cumulated_steps_to_goal -o plots/Sarsa_steps_e0_${b_str}_alpha.png
    python plot_alpha.py -s1 steps/ESarsa_steps_e0_a005_${b_str}.dat  -s2 steps/ESarsa_steps_e0_a01_${b_str}.dat  -s3 steps/ESarsa_steps_e0_a02_${b_str}.dat -s4 steps/ESarsa_steps_e0_a04_${b_str}.dat   -s5 steps/ESarsa_steps_e0_a08_${b_str}.dat  -s6 steps/ESarsa_steps_e0_a10_${b_str}.dat -t Cumulated_steps_to_goal -o plots/ESarsa_steps_e0_${b_str}_alpha.png
    python plot_alpha.py -s1 steps/Q_steps_e0_a005_${b_str}.dat  -s2 steps/Q_steps_e0_a01_${b_str}.dat  -s3 steps/Q_steps_e0_a02_${b_str}.dat -s4 steps/Q_steps_e0_a04_${b_str}.dat   -s5 steps/Q_steps_e0_a08_${b_str}.dat  -s6 steps/Q_steps_e0_a10_${b_str}.dat -t Cumulated_steps_to_goal -o plots/Q_steps_e0_${b_str}_alpha.png

    for n in 0 1 2 4 8 16 32
    do
        python plot_alpha.py -s1 steps/DynaQ_steps_e0_a005_n${n}_${b_str}.dat -s2 steps/DynaQ_steps_e0_a01_n${n}_${b_str}.dat -s3 steps/DynaQ_steps_e0_a02_n${n}_${b_str}.dat -s4 steps/DynaQ_steps_e0_a04_n${n}_${b_str}.dat -s5 steps/DynaQ_steps_e0_a08_n${n}_${b_str}.dat -s6 steps/DynaQ_steps_e0_a10_n${n}_${b_str}.dat -t Cumulated_steps_to_goal -o plots/DynaQ_steps_e0_n${n}_${b_str}_alpha.png
    done  
done

