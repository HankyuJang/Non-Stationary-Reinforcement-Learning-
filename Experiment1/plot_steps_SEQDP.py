import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
import sys
import numpy as np
import argparse
from argparse import ArgumentParser

def plot_steps(x1, x2, x3, x4, x5, s_idx, e_idx, y_low, y_high, title, xlabel, ylabel, filename):
    plt.plot(np.arange(s_idx, e_idx), x1[s_idx:e_idx])
    plt.plot(np.arange(s_idx, e_idx), x2[s_idx:e_idx])
    plt.plot(np.arange(s_idx, e_idx), x3[s_idx:e_idx])
    plt.plot(np.arange(s_idx, e_idx), x4[s_idx:e_idx])
    plt.plot(np.arange(s_idx, e_idx), x5[s_idx:e_idx])
    plt.suptitle(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    if y_low != y_high:
        plt.ylim(y_low, y_high)
    plt.legend(["Sarsa", "Expected Sarsa", "Q-learning", "DynaQ", "DynaQ+"])
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
    parser.add_argument('-s3', '--step3', type=argparse.FileType('r'), 
            help="step3", default=sys.stdin)
    parser.add_argument('-s4', '--step4', type=argparse.FileType('r'), 
            help="step4", default=sys.stdin)
    parser.add_argument('-s5', '--step5', type=argparse.FileType('r'), 
            help="step5", default=sys.stdin)
    parser.add_argument('-t', '--title', help="title of the plot")
    parser.add_argument('-o', '--output', help="output file name")
    parser.add_argument('-s_idx', '--s_idx', type=int, help="start index")
    parser.add_argument('-e_idx', '--e_idx', type=int, help="end index")
    parser.add_argument('-y_low', '--y_low', type=int, default=0, help="ylim low")
    parser.add_argument('-y_high', '--y_high', type=int, default=0, help="ylim high")
    args = parser.parse_args()

    s1 = args.step1
    s2 = args.step2
    s3 = args.step3
    s4 = args.step4
    s5 = args.step5
    s_idx = args.s_idx
    e_idx = args.e_idx
    y_low = args.y_low
    y_high = args.y_high

    X_s1 = read_steps(s1)
    X_s2 = read_steps(s2)
    X_s3 = read_steps(s3)
    X_s4 = read_steps(s4)
    X_s5 = read_steps(s5)

    plot_steps(X_s1, X_s2, X_s3, X_s4, X_s5, s_idx, e_idx, y_low, y_high, args.title, "Episodes", "Steps per episode", args.output)
