/* Team GA-5
 * File name: fft_test.c
 * 
 * Content Description: Contains code to test fourier transforms on the Raspberry Pi Model 2B.
 * Uses a simple sine wave input with frequency specified in a #define. The data points are
 * output to the terminal, and the input wave and its transform are graphed.
 *
 */
  
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <math.h>
#include <time.h>

/* Note: The paths in these lines need to be updated to reflect where
 * the headers are saved for the program to compile. 
 */
#include "/home/pi/ECE4960/FFT/mailbox.h"
#include "/home/pi/ECE4960/FFT/gpu_fft.h"

#define LOG2_N 11
#define NUM_JOBS 1
#define FREQUENCY 330

unsigned Microseconds(void) {
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    return ts.tv_sec*1000000 + ts.tv_nsec/1000;
}

int main(void) 
{
    /* Variables */
    int i, j, ret, mb = mbox_open();
    int num_samples = pow(2, LOG2_N);
    int frequency[NUM_JOBS];
    unsigned t[2];
    float mag;

    struct GPU_FFT_COMPLEX *base;
    struct GPU_FFT *fft;

    /* Open files for graphing. */
    FILE *in_temp = fopen("in.temp", "w");
    FILE *out_temp = fopen("out.temp", "w");
    FILE * gnuplotPipe = popen("gnuplot -persistent", "w");
    
    /* Initialize FFT. */
    ret = gpu_fft_prepare(mb, LOG2_N, GPU_FFT_REV, NUM_JOBS, &fft); // call once

    /* Print appropriate error message if initialization fails. */
    switch(ret) {
        case -1: printf("Unable to enable V3D. Please check your firmware is up to date.\n"); return -1;
        case -2: printf("NUM_SAMPLES=%d not supported.  Try between 8 and 22.\n", LOG2_N);    return -1;
        case -3: printf("Out of memory.  Try a smaller batch or increase GPU memory.\n");     return -1;
        case -4: printf("Unable to map Videocore peripherals into ARM memory space.\n");      return -1;
        case -5: printf("Can't open libbcm_host.\n");                                         return -1;
    }

    for (j = 0; j < NUM_JOBS; ++j) {
        /* Move to index for input data. */
        base = fft->in + j*fft->step; 
        
        /*Set up input signal. */
        for (i = 0; i < num_samples; ++i) {
            base[i].re = sin((2*GPU_FFT_PI*FREQUENCY*i)/num_samples);
            base[i].re += sin((2*2*GPU_FFT_PI*FREQUENCY*i)/num_samples);
            base[i].re += sin((0.5*2*GPU_FFT_PI*FREQUENCY*i)/num_samples);
            base[i].re += sin((0.25*2*GPU_FFT_PI*FREQUENCY*i)/num_samples);
            base[i].im = 0;
            
            /* Write input points to file. */
            fprintf(in_temp, "%lf %lf \n", (double) i, (double) base[i].re);
            
            /* Print input signal */
            printf("INPUT: x = %d, y = %1.2f\n", i, base[i].re);
        }
    }

    /* Graph input wave. */

    /* Yield to OS. */
    usleep(1);
    
    /* Begin timing FFT. */
    t[0] = Microseconds();
    
    /* Execute FFT. */
    gpu_fft_execute(fft); 
    printf("\n");
    
    /* End timing FFT. */
    t[1] = Microseconds();

    /* Analyze output. */
    for (j = 0; j < NUM_JOBS; ++j) {
        /* Grab index for output data. */
        base = fft->out + j*fft->step; 

        for (i =  0; i < num_samples; ++i) {
             /* Get magnitude. */
             mag = pow(base[i].re, 2) + pow(base[i].im, 2);
             mag = (2 * sqrt(mag)) / num_samples;
       
             /* Check for frequency of the wave. */
             if(round(mag) && i < num_samples / 2)
				 frequency[j] = i;
		     
		     /* Write input points to file. */
             fprintf(out_temp, "%lf %lf \n", (double) i, (double) mag);
             
             /* Print output. */
             printf("FFT: x = %d, y = %1.2f\n", i, mag);
        }
    }

    /* Graph FFT. */    
    fprintf(gnuplotPipe, "set multiplot layout 1,2 rowsfirst \n");
    fprintf(gnuplotPipe, "plot 'in.temp' with lines ls 1 \n");
    fprintf(gnuplotPipe, "plot 'out.temp' with lines ls 1 \n");
    fprintf(gnuplotPipe, "unset multiplot \n");
    
    /* Print Output. */
    printf("Total FFT Execution Time = %d us\n", (t[1]-t[0])/NUM_JOBS);
    for(j = 0; j < NUM_JOBS; ++j)
		printf("The largest frequency component of wave %d is %d Hz.\n", j + 1, frequency[j]);

    /* Release FFT Memory. */
    gpu_fft_release(fft); // Videocore memory lost if not freed !
    
    return 0;
}
