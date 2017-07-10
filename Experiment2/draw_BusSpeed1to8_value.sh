module load python/3.6.0

################################################################################################
# Bus speed 1to8
################################################################################################
python plot_value.py -v value/Sarsa_value_e0_a08_bs1to8_05_095.dat  -t Sarsa_value_e0_a08_bs1to8_05_095 -o plots/Sarsa_value_e0_a08_bs1to8_05_095.png
python plot_value.py -v value/ESarsa_value_e0_a10_bs1to8_05_095.dat  -t ESarsa_value_e0_a10_bs1to8_05_095 -o plots/ESarsa_value_e0_a10_bs1to8_05_095.png
python plot_value.py -v value/Q_value_e0_a10_bs1to8_05_095.dat  -t Q_value_e0_a10_bs1to8_05_095 -o plots/Q_value_e0_a10_bs1to8_05_095.png
python plot_value.py -v value/DynaQ_value_e0_a10_n32_bs1to8_05_095.dat  -t DynaQ_value_e0_a10_n32_bs1to8_05_095 -o plots/DynaQ_value_e0_a10_n32_bs1to8_05_095.png

python plot_value.py -v value/Sarsa_value_e0_a08_bs1to8_05_099.dat  -t Sarsa_value_e0_a08_bs1to8_05_099 -o plots/Sarsa_value_e0_a08_bs1to8_05_099.png
python plot_value.py -v value/ESarsa_value_e0_a10_bs1to8_05_099.dat  -t ESarsa_value_e0_a10_bs1to8_05_099 -o plots/ESarsa_value_e0_a10_bs1to8_05_099.png
python plot_value.py -v value/Q_value_e0_a10_bs1to8_05_099.dat  -t Q_value_e0_a10_bs1to8_05_099 -o plots/Q_value_e0_a10_bs1to8_05_099.png
python plot_value.py -v value/DynaQ_value_e0_a10_n32_bs1to8_05_099.dat  -t DynaQ_value_e0_a10_n32_bs1to8_05_099 -o plots/DynaQ_value_e0_a10_n32_bs1to8_05_099.png
