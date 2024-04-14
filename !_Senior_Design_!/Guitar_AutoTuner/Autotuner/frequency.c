/* Team GA-5
 * File name: frequency.c
 *
 *  
 * Content Description: Contains code for frequency manipulation in the
 * overall system.
 *
 */
 
/* Import project header file. */
#include "guitarTuner.h"

/* Global Variables. */
/* NOTE: See Dropbox Document "Guitar Frequency Calculation".pdf */
/*       to view the method used to determing tuning frequencies. */
float Tuning_Matrix[NUM_TUNINGS][NUM_STRINGS] = 
  {{ 329.63, 246.94, 196.00, 146.83, 110.00, 82.41 }, // Standard Tuning
   { 329.63, 246.94, 196.00, 146.83, 110.00, 73.42 }, // Drop D Tuning
   { 293.63, 246.94, 196.00, 146.83,  98.00, 73.42}}; // Open G Tuning
float Degrees_Per_Hertz[NUM_STRINGS] = 
   { 9.57, 14.06, 12.33, 7.38, 1.36, 1.07 };

/* Function Name: processFFT
 * Input          input_data - Data to transform.
 * Return Value:  frequency  - Frequency of input data.
 * Precondition:  Data adheres to parameters in the guitarTuner.h file.
 * Purpose:       Runs an FFT on the input data and returns the resonant
 *                frequency of the wave.
 */
float processFFT(data_t *input_data)
{   
    /* Variables. */
    int i, mb = mbox_open();
    int log2_n = (int) truncf(log2f(NUM_SAMPLES));
    float frequency, curr_mag;
    float max, threshold, next_mag;
    float res_freq = -1;

    struct GPU_FFT_COMPLEX *base;
    struct GPU_FFT *fft;

    /* Initialize FFT. */
    gpu_fft_prepare(mb, log2_n, GPU_FFT_REV, 1, &fft); 

    /* Move to index for input data. */
    base = fft->in;
        
    /* Set up input signal. */
    for (i = 0; i < NUM_SAMPLES; ++i) {
            base[i].re = input_data->data[i];
            base[i].im = 0;
    }

    /* Yield to OS. */
    usleep(1);
    
    /* Execute FFT. */
    gpu_fft_execute(fft); 
    
    /* Grab index for output data. */
    base = fft->out;

    /* Find max signal value. */
    max = findMaxMagnitude(base);
    threshold = THRES_PERCENT*max;
    
    /* Find resonant frequency of strummed note. */
    for (i =  0; i < NUM_SAMPLES; ++i) {
		 /* Get frequencies. */
		 frequency = getFrequency(input_data->sample_rate, i);
		 
         /* Get magnitudes of current and next data points. */
         curr_mag = getMagnitude(base[i].re, base[i].im);
		 if(i != NUM_SAMPLES)
		     next_mag = getMagnitude(base[i + 1].re, base[i + 1].im);
		 else next_mag = -1;
		 		          
		 /* Check for resonant frequency. */
		 if(frequency > 0 && curr_mag > threshold 
		    && curr_mag > next_mag) {
		     res_freq = frequency;
		     break;
         }
    }
  
    /* Release FFT memory and clean up. */
    gpu_fft_release(fft); // Videocore memory lost if not freed!
    
    return res_freq;
}

/* Function Name: processFFT_debug
 * Input          input_data - Data to transform.
 * Return Value:  frequency  - Frequency of input data.
 * Precondition:  Data adheres to parameters in the guitarTuner.h file.
 * Purpose:       processFFT() with verbose prints and ability to graph
 *                data.
 * 
 *                Not used in final design to increase speed, but was
 *                used heavily during development.
 * 
 *                Used in guitarTuner.h calibration.
 */
float processFFT_calibrate(data_t *input_data)
{   
    /* Variables. */
    int i, ret, mb = mbox_open();
    int log2_n = (int) truncf(log2f(NUM_SAMPLES));
    float frequency, mag;
    float max, threshold, next_mag;
    float res_freq = -1;

    struct GPU_FFT_COMPLEX *base;
    struct GPU_FFT *fft;

    /* Open files for graphing. */
    FILE *out_temp = fopen("out.temp", "w");
    FILE *gnuplotPipe = popen("gnuplot -persistent", "w");

    /* Initialize FFT. */
    ret = gpu_fft_prepare(mb, log2_n, GPU_FFT_REV, 1, &fft);
    
    /* Print appropriate error message if initialization fails. */
    switch(ret) {
        case -1: 
            printf("Unable to enable V3D. ");
            printf("Please check your firmware is up to date.\n"); 
            return -1;
        case -2: 
            printf("NUM_SAMPLES=%d not supported. ", log2_n);
            printf("Try between 8 and 22.\n");
            return -1;
        case -3: 
            printf("Out of memory. ");
            printf("Try a smaller batch or increase GPU memory.\n");
            return -1;
        case -4: 
            printf("Unable to map Videocore peripherals ");
            printf("into ARM memory space.\n");      
            return -1;
        case -5: 
            printf("Can't open libbcm_host.\n");                                         
            return -1;
    }  

    /* Move to index for input data. */
    base = fft->in;
        
    /*Set up input signal. */
    for (i = 0; i < NUM_SAMPLES; ++i) {
            base[i].re = input_data->data[i];
            base[i].im = 0;
    }

    /* Yield to OS. */
    usleep(1);
    
    /* Execute FFT. */
    gpu_fft_execute(fft); 
    
    /* Grab index for output data. */
    base = fft->out;
  
    /* Find max signal value. */
    max = findMaxMagnitude(base);
    threshold = THRES_PERCENT*max;
    printf("FFT_DEBUG: max = %1.2f, thres = %1.2f\n", max, threshold);
  
    /* Find resonant frequency and graph. */   
    for (i =  0; i < NUM_SAMPLES; ++i) {
		 /* Get frequencies. */
		 frequency = getFrequency(input_data->sample_rate, i);
		 
         /* Get magnitude. */
         mag = getMagnitude(base[i].re, base[i].im);
		 if(i != NUM_SAMPLES)
		     next_mag = getMagnitude(base[i + 1].re, base[i + 1].im);
		 else next_mag = -1;
		 		          
		 /* Check for resonant frequency. */
		 if(frequency > 0 && mag > threshold && mag > next_mag) {
		     res_freq = frequency;
		     break;
         }
    }
    
    /* DEBUG: For graphing data. */
    for(i = 1; i < NUM_SAMPLES; ++i) {
         /* Get frequencies. */
		 frequency = getFrequency(input_data->sample_rate, i);
		 
         /* Get magnitude. */
         mag = getMagnitude(base[i].re, base[i].im);
    
         /* Write input points to file. */
         fprintf(out_temp, "%lf %lef \n", 
                 (double) frequency, (double) mag);
    }
    
    /* Graph FFT. */    
    fprintf(gnuplotPipe, "set title \"Frequency Transform of Data\"\n");
    fprintf(gnuplotPipe, "plot 'out.temp' with lines ls 1 \n");
    printf("FFT_DEBUG: Frequency from FFT is %1.2f hertz\n", res_freq);
  
    /* Release FFT memory and clean up. */
    gpu_fft_release(fft); // Videocore memory lost if not freed!
    fclose(out_temp);
    pclose(gnuplotPipe); 
    
    return res_freq;
}

/* Function Name: processFFT_test
 * Input          input_data - Data to transform.
 * Return Value:  frequency  - Frequency of input data.
 * Precondition:  Data adheres to parameters in the guitarTuner.h file.
 * Purpose:       processFFT() with verbose prints and ability to graph
 *                data.
 * 
 *                Not used in final design to increase speed, but was
 *                used heavily during development.
 * 
 *                Used to test overall software logic.
 */
float processFFT_test(float *input_data)
{   
    /* Variables. */
    int i, ret, mb = mbox_open();
    int log2_n = (int) truncf(log2f(NUM_SAMPLES));
    float frequency, mag;
    float max, threshold, next_mag;
    float res_freq = -1;

    struct GPU_FFT_COMPLEX *base;
    struct GPU_FFT *fft;

    /* Open files for graphing. */
    FILE *out_temp = fopen("out.temp", "w");
    FILE *gnuplotPipe = popen("gnuplot -persistent", "w");

    /* Initialize FFT. */
    ret = gpu_fft_prepare(mb, log2_n, GPU_FFT_REV, 1, &fft);
    
    /* Print appropriate error message if initialization fails. */
    switch(ret) {
        case -1: 
            printf("Unable to enable V3D. ");
            printf("Please check your firmware is up to date.\n"); 
            return -1;
        case -2: 
            printf("NUM_SAMPLES=%d not supported. ", log2_n);
            printf("Try between 8 and 22.\n");
            return -1;
        case -3: 
            printf("Out of memory. ");
            printf("Try a smaller batch or increase GPU memory.\n");
            return -1;
        case -4: 
            printf("Unable to map Videocore peripherals ");
            printf("into ARM memory space.\n");      
            return -1;
        case -5: 
            printf("Can't open libbcm_host.\n");                                         
            return -1;
    }  

    /* Move to index for input data. */
    base = fft->in;
        
    /*Set up input signal. */
    for (i = 0; i < NUM_SAMPLES; ++i) {
            base[i].re = input_data[i];
            base[i].im = 0;
    }

    /* Yield to OS. */
    usleep(1);
    
    /* Execute FFT. */
    gpu_fft_execute(fft); 
    
    /* Grab index for output data. */
    base = fft->out;
  
    /* Find max signal value. */
    max = findMaxMagnitude(base);
    threshold = THRES_PERCENT*max;
  
    /* Find resonant frequency and graph. */   
    for (i =  0; i < NUM_SAMPLES; ++i) {
		 /* Get frequencies. */
		 frequency = getFrequency(DESIRED_SAMPLE_RATE, i);
		 
         /* Get magnitude. */
         mag = getMagnitude(base[i].re, base[i].im);
		 if(i != NUM_SAMPLES)
		     next_mag = getMagnitude(base[i + 1].re, base[i + 1].im);
		 else next_mag = -1;
		 		          
		 /* Check for resonant frequency. */
		 if(frequency > 0 && mag > threshold && mag > next_mag) {
		     res_freq = frequency;
		     break;
         }
    }
    
    /* DEBUG: For graphing data. */
    for(i = 1; i < NUM_SAMPLES; ++i) {
         /* Get frequencies. */
		 frequency = getFrequency(DESIRED_SAMPLE_RATE, i);
		 
         /* Get magnitude. */
         mag = getMagnitude(base[i].re, base[i].im);
    
         /* Write input points to file. */
         fprintf(out_temp, "%lf %lef \n", 
                 (double) frequency, (double) mag);
    }
    
    /* Graph FFT. */    
    fprintf(gnuplotPipe, "set title \"Frequency Transform of Data\"\n");
    fprintf(gnuplotPipe, "plot 'out.temp' with lines ls 1 \n");
    printf("processFFT: Frequency from FFT is %1.2f hertz\n", res_freq);
  
    /* Release FFT memory and clean up. */
    gpu_fft_release(fft); // Videocore memory lost if not freed!
    fclose(out_temp);
    pclose(gnuplotPipe); 
    
    return res_freq;
}

/* Function Name: findMaxMagnitude
 * Input:         base - Input signal.
 * Return value:  max  - max signal magnitude.
 * Precondition:  None.
 * Purpose:       Finds max signal magnitude.
 */
float findMaxMagnitude(struct GPU_FFT_COMPLEX *base)
{
	int i;
	float mag, max = -1;
    for(i = 1; i < NUM_SAMPLES; ++i) {
         /* Get magnitude. */
         mag = getMagnitude(base[i].re, base[i].im);
    
         /* Test for maximum value. */
         if(mag > max) max = mag;
    }

    return max;
}

/* Function Name: getFrequency
 * Input:         sample_rate - Sample rate of input data.
 *                sample_num  - Number of FFT sample to calculate 
 *                              frequency for.
 * Return value:  Frequency of this sample.
 * Precondition:  0 <= sample_num <= NUM_SAMPLES
 * Purpose:       Allows for quick calculation of frequencies.
 */
float getFrequency(int sample_rate, int sample_num)
{
	return (sample_rate * sample_num)/NUM_SAMPLES;
}

/* Function Name: getMagnitude
 * Input:         real      - Real component of FFT sample to calculate 
 *                            magnitude (amount of frequency in signal)
 *                            for.
 *                imaginary - Imaginary component of FFT sample to
 *                            calculate magnitude for.
 * Return value:  Magnitude of this sample.
 * Precondition:  0 <= sample_num <= NUM_SAMPLES
 * Purpose:       Allows for quick calculation of magnitudes.
 */
float getMagnitude(float real, float imaginary)
{
	float mag = pow(real, 2) + pow(imaginary, 2);
    mag = (2 * sqrt(mag)) / NUM_SAMPLES; // Normalize data.
    
    return mag;
}

/* Function Name: killHarmonics
 * Input:         tuneNum    - Number ID of tuning being used.
 *                stringNum  - Number ID of current string.
 *                frequency  - Frequency of current string.
 * Return value:  1st harmonic of frequency.
 * Precondition:  This function cannot be called on noise.
 * Purpose:       Retrieves first harmonic from read frequency of string.
 * 
 *                Prints first harmonic to stdio.
 */
float killHarmonics(int tuneNum, int stringNum, float frequency)
{
    float first_harmonic = frequency;
	float upper_bound = Tuning_Matrix[tuneNum][stringNum - 1] + BOUND;
	
    while(first_harmonic > upper_bound)    
        first_harmonic = first_harmonic / 2;
   
    return first_harmonic;
}

/* Function Name: killHarmonics_calibrate
 * Input:         tuneNum    - Number ID of tuning being used.
 *                stringNum  - Number ID of current string.
 *                frequency  - Frequency of current string.
 * Return value:  1st harmonic of frequency.
 * Precondition:  This function cannot be called on noise.
 * 
 * Purpose:       Retrieves first harmonic from read frequency of string.
 * 
 *                Prints first harmonic to stdio.
 */
float killHarmonics_calibrate(int tuneNum, int stringNum, float frequency)
{
    float first_harmonic = frequency;
	float upper_bound = Tuning_Matrix[tuneNum][stringNum - 1] + BOUND;
	
    while(first_harmonic > upper_bound) first_harmonic = first_harmonic / 2;
   
    printf("FFT_DEBUG: First harmonic = %1.2f\n", first_harmonic);
    return first_harmonic;
}

/* Function Name: checkTuning
 * Input:         tuneNum   - Number ID of tuning being used.
 *                stringNum - Number ID of current string.
 *                frequency - Frequency of current string.
 * Return Value:  tune      - Tuning command for the string. Contains:
 *                          - type: Tune string COARSE, FINE, or 
 *                                  IN_TUNE (no action).
 *                          - direction: Direction to turn stepper 
 *                                       motor.
 * Precondition:  None.
 * Purpose:       Determines a tuning command to tune string stringNum
 *                with frequency frequency to the tuning specified by
 *                tuneNum.
 * 
 *                The accuracy of the tuner is configured by the global
 *                variable ACCURACY. See guitarTuner.h. 
 *                
 *                By default, the accuracy is +/- 1 Hertz.
 */
tuning_t *checkTuning(int tuneNum, int stringNum, float frequency)
{
    /* Get target tuning. */	
	float target_tuning = Tuning_Matrix[tuneNum][stringNum - 1];
    printf("checkTuning: Target Frequency = %1.2f.\n", target_tuning);
    
    /* Allocate tuning variable. */
    tuning_t *tune = malloc(sizeof(tuning_t));  
    
    /* Check if in tune. */
    if(frequency >= target_tuning - ACCURACY && 
	   frequency <= target_tuning + ACCURACY) {
        /* String is in tune. */
		tune->type = IN_TUNE;
		tune->direction = IN_TUNE;
		
		printf("\nString %d is in tune.\n\n", stringNum);
	    
	    return tune;
	} 
    
    /* Initialize tuning variable. */
	if(stringNum > 3) {
		if(frequency < target_tuning) {
			/* String is flat. */
		    printf("\nFLAT: Turn string %d clockwise.\n", 
		           stringNum);
		    tune->direction = CLOCKWISE;
		    if(frequency + TUNING_THRESHOLD < target_tuning) {
	            /* Use coarse tuning.  */
	            printf("Coarse tune string %d.\n\n", stringNum);
	            tune->type = COARSE;
			} else {
                /* Use fine tuning. */		
                printf("Fine tune string %d.\n\n", stringNum);	
                tune->type = FINE;
			}
		} else {
			/* String is sharp. */
            printf("\nSHARP: Turn string %d counter-clockwise.\n", stringNum);
            tune->direction = COUNTERCLOCKWISE;
            if(frequency - TUNING_THRESHOLD > target_tuning) {
		        /* Use coarse tuning. */
		        printf("Coarse tune string %d.\n\n", stringNum);
		        tune->type = COARSE;
			 } else {
			    /* Use fine tuning. */  
		        printf("Fine tune string %d.\n\n", stringNum);
		        tune->type = FINE;
			 }
        }
	} else {
		/* Reverse orientation. */
		if(frequency < target_tuning) {
			/* String is flat. */
		    printf("\nFLAT: Turn string %d clockwise.\n", stringNum);
	        tune->direction = CLOCKWISE;
		    if(frequency + TUNING_THRESHOLD < target_tuning) {
	            /* Use coarse tuning.  */
	            printf("Coarse tune string %d.\n\n", stringNum);
	            tune->type = COARSE;
			} else {
                /* Use fine tuning. */	
              	printf("Fine tune string %d.\n\n", stringNum);			
                tune->type = FINE;
			}
		} else {
			/* String is sharp. */
	        printf("\nSHARP: Turn string %d counter-clockwise.\n", 
	               stringNum);
	        tune->direction = COUNTERCLOCKWISE;
            if(frequency - TUNING_THRESHOLD > target_tuning) {
		        /* Use coarse tuning. */
		        printf("Coarse tune string %d.\n\n", stringNum);
		        tune->type = COARSE;
			} else {
			    /* Use fine tuning. */   
		        printf("Fine tune string %d.\n\n", stringNum);
		        tune->type = FINE;
		    }
        }
	}

	/* Give tuning command to calling function. */
	return tune;
}
