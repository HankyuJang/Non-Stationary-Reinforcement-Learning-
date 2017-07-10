module load python/3.6.0

################################################################################################
# Bus speed 8
################################################################################################
#python plot_value.py -v value/Sarsa_value_e01_a04_bs8.dat  -t Sarsa_value_e01_a04_bs8 -o plots/Sarsa_value_e01_a04_bs8.png
#python plot_value.py -v value/ESarsa_value_e0_a10_bs8.dat  -t ESarsa_value_e0_a10_bs8 -o plots/ESarsa_value_e0_a10_bs8.png
#python plot_value.py -v value/Q_value_e0_a10_bs8.dat  -t Q_value_e0_a10_bs8 -o plots/Q_value_e0_a10_bs8.png
#python plot_value.py -v value/DynaQ_value_e0_a04_n32_bs8.dat  -t DynaQ_value_e0_a04_n32_bs8 -o plots/DynaQ_value_e0_a04_n32_bs8.png

#################################################################################################
## Bus speed 1
#################################################################################################
#python plot_value.py -v value/Sarsa_value_e0_a08_bs1.dat  -t Sarsa_value_e0_a08_bs1 -o plots/Sarsa_value_e0_a08_bs1.png
#python plot_value.py -v value/ESarsa_value_e0_a10_bs1.dat  -t ESarsa_value_e0_a10_bs1 -o plots/ESarsa_value_e0_a10_bs1.png
#python plot_value.py -v value/Q_value_e0_a10_bs1.dat  -t Q_value_e0_a10_bs1 -o plots/Q_value_e0_a10_bs1.png
#python plot_value.py -v value/DynaQ_value_e0_a10_n32_bs1.dat  -t DynaQ_value_e0_a10_n32_bs1 -o plots/DynaQ_value_e0_a10_n32_bs1.png

#################################################################################################
## Bus speed 8to1
#################################################################################################
python plot_value.py -v value/Sarsa_value_e005_a02_bs8to1.dat  -t Sarsa_value_e005_a02_bs8to1 -o plots/Sarsa_value_e005_a02_bs8to1.png
python plot_value.py -v value/ESarsa_value_e005_a08_bs8to1.dat  -t ESarsa_value_e005_a08_bs8to1 -o plots/ESarsa_value_e005_a08_bs8to1.png
python plot_value.py -v value/Q_value_e005_a08_bs8to1.dat  -t Q_value_e005_a08_bs8to1 -o plots/Q_value_e005_a08_bs8to1.png
python plot_value.py -v value/DynaQ_value_e005_a02_n4_bs8to1.dat  -t DynaQ_value_e005_a02_n4_bs8to1 -o plots/DynaQ_value_e005_a02_n4_bs8to1.png

#################################################################################################
## Bus speed 1to8
#################################################################################################
python plot_value.py -v value/Sarsa_value_e005_a02_bs1to8.dat  -t Sarsa_value_e005_a02_bs1to8 -o plots/Sarsa_value_e005_a02_bs1to8.png
python plot_value.py -v value/ESarsa_value_e005_a10_bs1to8.dat  -t ESarsa_value_e005_a10_bs1to8 -o plots/ESarsa_value_e005_a10_bs1to8.png
python plot_value.py -v value/Q_value_e005_a08_bs1to8.dat  -t Q_value_e005_a08_bs1to8 -o plots/Q_value_e005_a08_bs1to8.png
python plot_value.py -v value/DynaQ_value_e005_a005_n16_bs1to8.dat  -t DynaQ_value_e005_a005_n16_bs1to8 -o plots/DynaQ_value_e005_a005_n16_bs1to8.png
