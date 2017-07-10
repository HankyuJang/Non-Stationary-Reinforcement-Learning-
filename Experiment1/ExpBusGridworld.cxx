#include <stdio.h>
#include <math.h>
#include <string.h>
#include "rlglue/RL_glue.h" /* Required for RL-Glue  */
#include <time.h>

#define NUM_STATES 70
//
//use global pointer for passing Vt from agent to experiment 
extern double *ValueEst_GP;

double epsilon;
double alpha;
int n;
int num_episodes;
double discount;
double kappa;
int max_steps;

void saveResults(double* data, int dataSize, const char* filename) {
    FILE *dataFile;
    int i;
    dataFile = fopen(filename, "w");
    for(i = 0; i < dataSize; i++){
        fprintf(dataFile, "%lf\n", data[i]);
    }
    fclose(dataFile);
}

void saveResults_int(int* data, int dataSize, const char* filename) {
    FILE *dataFile;
    int i;
    dataFile = fopen(filename, "w");
    for(i = 0; i < dataSize; i++){
        fprintf(dataFile, "%d\n", data[i]);
    }
    fclose(dataFile);
}

void saveCumulatedSteps(int cum_steps, double epsilon, double alpha, int n, double kappa, const char* filename) {
    FILE *dataFile;
    dataFile = fopen(filename, "a+");
    fprintf(dataFile, "%d,%g,%g,%d,%g\n", cum_steps, epsilon, alpha, n, kappa);
    fclose(dataFile);
}

int main(int argc, char *argv[]) {
    max_steps = 1000;

    epsilon = atof(argv[1]);
    alpha = atof(argv[2]);
    n = atoi(argv[3]);
    num_episodes = atoi(argv[4]);

    discount = atof(argv[5]);
    kappa = atof(argv[6]);

    char output_value[50];
    char output_steps[50];
    char output_cumsteps[50];
    strcpy(output_value, argv[7]);
    strcpy(output_steps, argv[8]);
    strcpy(output_cumsteps, argv[9]);

    time_t t;
    srand((unsigned) time(&t));

    int numRuns = 500;
    int result_steps[num_episodes];
    double result_value[NUM_STATES];
    int cum_steps = 0;

    memset(result_value, 0, sizeof(result_value));
    memset(result_steps, 0, sizeof(result_steps));
    
    printf("\nPrinting dot per run( eps:%g, alpha:%g, n:%d, kappa:%g )\n",epsilon, alpha, n, kappa);
    for (int k =0; k<numRuns; k++)
    {
        RL_init();
        for (int i =0; i<num_episodes; i++) {
            RL_episode(max_steps);
            result_steps[i] += RL_num_steps();
            cum_steps += RL_num_steps(); 
        }
        //get Vt from global pointer
        for (int j=0;j< NUM_STATES;j++) {
            result_value[j] +=  ValueEst_GP[j];
        }
        RL_cleanup();
        printf(".");
        fflush( stdout );
    }
    printf("\nDone\n");
    
    /* average over runs */
    for (int i = 0; i < NUM_STATES; i++){
        result_value[i] = result_value[i]/numRuns;
    }
    for (int i = 0; i < num_episodes; i++){
        result_steps[i] = result_steps[i]/numRuns;
    }
    
    //save averaged Vt
    saveResults(result_value, NUM_STATES, output_value);
    saveResults_int(result_steps, num_episodes, output_steps); 
    saveCumulatedSteps(cum_steps, epsilon, alpha, n, kappa, output_cumsteps);
    
    return 0;
}
