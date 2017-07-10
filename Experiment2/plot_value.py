import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
import sys
import numpy as np
import argparse
from argparse import ArgumentParser

GRID_WIDTH = 10
GRID_HEIGHT = 7
adjust_text = 0.35
S = [5, 0]
G = [4, 9]
B1 = [4, 8]
B2 = [2, 2]
road = [[2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [3, 7], [3, 8], 
        [4, 8], [4, 7], [4, 6], [4, 5], [4, 4], [4, 3], [4, 2], [3, 2]]

def plot_heatmap(data, title, xlabel, ylabel, filename):
    plt.matshow(data, cmap="plasma")
    plt.suptitle(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.text(S[1] - adjust_text, S[0] + adjust_text, 'S', fontsize=35)
    plt.text(G[1] - adjust_text, G[0] + adjust_text, 'G', fontsize=35)
    plt.text(B1[1] - adjust_text, B1[0] + adjust_text, 'B', fontsize=35)
    plt.text(B2[1] - adjust_text, B2[0] + adjust_text, 'B', fontsize=35)

    # Draw arrows
    # A = [S[0], S[1]]
    # Goal = [G[0], G[1]]

    # arrow = {0: '\u2191', 1:'\u2192', 2:'\u2193', 3:'\u2190'}
    
    # while True:
        # # Terminal State
        # if A[0] == Goal[0] and A[1] == Goal[1]:
            # plt.text(A[1]-adjust_text, A[0]+adjust_text, 'G', fontsize=35)
            # break
        # # Bus Stop
        # elif A[0] == B2[0] and A[1] == B2[1]:
            # plt.text(A[1]-adjust_text, A[0]+adjust_text, '\u27b9', fontsize=35)
            # A[0], A[1] = B1[0], B1[1]

        # else:
            # if (-1 < A[0]-1 < GRID_HEIGHT and [A[0]-1, A[1]] not in road):
                # A_up = [A[0]-1, A[1]] #up
            # else:
                # A_up = A
            # if (-1 < A[1]+1 < GRID_WIDTH and [A[0], A[1]+1] not in road):
                # A_right = [A[0], A[1]+1] #right
            # else:
                # A_right = A
            # if (-1 < A[0]+1 < GRID_HEIGHT and [A[0]+1, A[1]] not in road):
                # A_down = [A[0]+1, A[1]] #down
            # else:
                # A_down = A
            # if (-1 < A[1]-1 < GRID_WIDTH and [A[0], A[1]-1] not in road):
                # A_left = [A[0], A[1]-1] #left
            # else:
                # A_left = A
            
            # neighbor = []
            # neighbor_cor = []
            
            # neighbor_cor.append(A_up)            
            # neighbor_cor.append(A_right)
            # neighbor_cor.append(A_down)
            # neighbor_cor.append(A_left)
            # print("-"*50)
            # print("A: ({},{})".format(A[0], A[1]))
            # print("A_up: ({},{})".format(A_up[0], A_up[1]))
            # print("A_right: ({},{})".format(A_right[0], A_right[1]))
            # print("A_down: ({},{})".format(A_down[0], A_down[1]))
            # print("A_left: ({},{})".format(A_left[0], A_left[1]))
            # neighbor = [data[A_up[0],A_up[1]], data[A_right[0],A_right[1]], data[A_down[0],A_down[1]], data[A_left[0],A_left[1]]]

            # maximum = neighbor[0]
            # maximum_idx = 0

            # for i in range(1, len(neighbor)):
                # if neighbor[i] > maximum:
                    # maximum = neighbor[i]
                    # maximum_idx = i
            
            # direction = maximum_idx

            # plt.text(A[1]-adjust_text, A[0]+adjust_text, arrow[direction], fontsize=35)
            # A = neighbor_cor[direction]

    plt.savefig(filename, format=filename.split('.')[-1])
    plt.show()

def read_values(input_file):
    X = np.zeros((7, 10))
    for i in range(7):
        for j in range(10):
            X[i][j] = float(input_file.readline().rstrip())
    return X

def set_road_values(X):
    minimum = X.min()
    for j in range(3, 9):
        X[2][j] = minimum
    for j in range(2, 9):
        X[3][j] = minimum
    for j in range(2, 8):
        X[4][j] = minimum

if __name__ == '__main__':
    parser = ArgumentParser(description="Comparing learning curve")
    parser.add_argument('-v', '--value', type=argparse.FileType('r'), 
            help="value", default=sys.stdin)
    parser.add_argument('-t', '--title', help="title of the plot")
    parser.add_argument('-o', '--output', help="output file name")
    args = parser.parse_args()

    v = args.value
    X_v = read_values(v)
    set_road_values(X_v)
    plot_heatmap(X_v, args.title, "", "", args.output)

