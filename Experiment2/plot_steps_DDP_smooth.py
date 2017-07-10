import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
import sys
import numpy as np
import argparse
from argparse import ArgumentParser

neighbor = 100

def plot_steps(x1, x2, s_idx, e_idx, y_low, y_high, title, xlabel, ylabel, filename):
    x1_smooth = np.zeros(x1.shape[0] - neighbor-1)
    for i in range(x1_smooth.shape[0]):
        x1_smooth[i] = x1[i:i+neighbor].mean()
    x2_smooth = np.zeros(x2.shape[0] - neighbor-1)
    for i in range(x2_smooth.shape[0]):
        x2_smooth[i] = x2[i:i+neighbor].mean()

    plt.plot(np.arange(s_idx, e_idx), x1_smooth[s_idx:e_idx])
    plt.plot(np.arange(s_idx, e_idx), x2_smooth[s_idx:e_idx])
    plt.suptitle(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    if y_low != y_high:
        plt.ylim(y_low, y_high)
    plt.legend(["DynaQ", "DynaQ+"])
    plt.savefig(filename, format=filename.split('.')[-1])

def read_steps(input_file):
    X = []
    for line in input_file:
        X.append(int(line.rstrip()))
    return np.array(X)

if __name__ == '__main__':
    parser = ArgumentParser(description="Comparing learning curve")
    parser.add_argument('-s1', '--step1', type=argparse.FileType('r'), 
            help="step1", default=sys.stdin)
    parser.add_argument('-s2', '--step2', type=argparse.FileType('r'), 
            help="step2", default=sys.stdin)
    parser.add_argument('-t', '--title', help="title of the plot")
    parser.add_argument('-o', '--output', help="output file name")
    parser.add_argument('-s_idx', '--s_idx', type=int, help="start index")
    parser.add_argument('-e_idx', '--e_idx', type=int, help="end index")
    parser.add_argument('-y_low', '--y_low', type=int, default=0, help="ylim low")
    parser.add_argument('-y_high', '--y_high', type=int, default=0, help="ylim high")
    args = parser.parse_args()

    s1 = args.step1
    s2 = args.step2
    s_idx = args.s_idx
    e_idx = args.e_idx
    y_low = args.y_low
    y_high = args.y_high

    X_s1 = read_steps(s1)
    X_s2 = read_steps(s2)

    plot_steps(X_s1, X_s2, s_idx, e_idx, y_low, y_high, args.title, "Episodes", "Steps per episode", args.output)
