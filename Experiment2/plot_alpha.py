import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
import sys
import numpy as np
import argparse
from argparse import ArgumentParser

def read_steps(input_file):
    X = []
    for line in input_file:
        X.append(int(line.rstrip()))
    return sum(X)

def plot_cumsteps(x, y, title, xlabel, ylabel, filename):
    plt.plot(x, y, marker='o')
    plt.suptitle(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.savefig(filename, format=filename.split('.')[-1])

if __name__ == '__main__':
    parser = ArgumentParser(description="Comparing learning curve wrt alpha")
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
    parser.add_argument('-s6', '--step6', type=argparse.FileType('r'), 
            help="step6", default=sys.stdin)
    parser.add_argument('-t', '--title', help="title of the plot")
    parser.add_argument('-o', '--output', help="output file name")
    args = parser.parse_args()

    s1 = args.step1
    s2 = args.step2
    s3 = args.step3
    s4 = args.step4
    s5 = args.step5
    s6 = args.step6

    s1 = read_steps(s1)
    s2 = read_steps(s2)
    s3 = read_steps(s3)
    s4 = read_steps(s4)
    s5 = read_steps(s5)
    s6 = read_steps(s6)

    x = np.array(["0.05", "0.1", "0.2", "0.4", "0.8", "1.0"])
    y = np.array([s1, s2, s3, s4, s5, s6])
    plot_cumsteps(x, y, args.title, "alpha", "total setps", args.output)

