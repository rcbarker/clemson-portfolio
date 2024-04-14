/* Team GA-5
 * File name: audio.c
 * 
 * Content Description: Contains code to interface the guitar input
 * circuit of the design with the ALSA library.
 *
 */

/* Import project header file. */
#include "guitarTuner.h"
char Capture_Interface[] = "plughw:1";

/* Function Name: readPickupData
 * Input          None.
 * Return Value:  data - A structure containing the sampling rate for
 *                       data and a buffer full of NUM_FRAMES samples.
 * Precondition:  None.
 * Purpose:       Reads data from the guitar input circuit with the
 *                ALSA library and returns the raw data to the user.
 */
data_t *readPickupData(void)
{
    /* Variables */
    data_t *data = malloc(sizeof(data_t));
    int i, rc;
    snd_pcm_t *handle;
    snd_pcm_hw_params_t *params;
    int dir;
    snd_pcm_uframes_t frames;
    int16_t *data_read = NULL;
 
    /* Open PCM device for recording (capture). */
    rc = snd_pcm_open(&handle, Capture_Interface,
                      SND_PCM_STREAM_CAPTURE, 0);
                      
    if (rc < 0) {
        fprintf(stderr,
               "unable to open pcm device: %s\n",
               snd_strerror(rc));
        exit(1);
    }

    /* Allocate a hardware parameters object. */
    snd_pcm_hw_params_alloca(&params);

    /* Fill it in with default values. */
    snd_pcm_hw_params_any(handle, params);

    /* Set the desired hardware parameters. */

    /* Interleaved mode. */
    snd_pcm_hw_params_set_access(handle, params,
                  SND_PCM_ACCESS_RW_INTERLEAVED);

    /* Signed 16-bit little-endian format. */
    snd_pcm_hw_params_set_format(handle, params,
                                 SND_PCM_FORMAT_S16_LE);
                              
    /* One channel (mono). */
    snd_pcm_hw_params_set_channels(handle, params, 1);

    /* Set sample rate. */
    data->sample_rate = DESIRED_SAMPLE_RATE;
    snd_pcm_hw_params_set_rate_near(handle, params,
                                    &data->sample_rate, &dir);

    /* Set period size. */
    frames = SAMPLES_PER_PERIOD;
    snd_pcm_hw_params_set_period_size_near(handle,
                                params, &frames, &dir);
                              
    /* Write the parameters to the driver. */
    rc = snd_pcm_hw_params(handle, params);
    if (rc < 0) {
        fprintf(stderr,
                "unable to set hw parameters: %s\n",
                snd_strerror(rc));
        exit(1);
    }
  
    /* Set up software buffer for read. */
    data_read = (int16_t *) malloc(SAMPLES_PER_PERIOD*BYTES_PER_SAMPLE);
  
    /* Set up buffer to store data. */
    data->data = (int16_t *) malloc(NUM_SAMPLES*BYTES_PER_SAMPLE);
    uint8_t *casted = (uint8_t *) data->data; 
  
    /* Read data in. */
    for(i= 0; i < NUM_SAMPLES / SAMPLES_PER_PERIOD; ++i) {
	    /* Sample in data. */
	    rc = snd_pcm_readi(handle, data_read, SAMPLES_PER_PERIOD);
      
        /* Error checking. */
        if (rc == -EPIPE) {
            /* EPIPE means overrun */
            fprintf(stderr, "overrun occurred\n");
            snd_pcm_prepare(handle);
        } else if (rc < 0) {
            fprintf(stderr, "error from read: %s\n",
            snd_strerror(rc));
        } else if (rc != SAMPLES_PER_PERIOD) {
            fprintf(stderr, "short read, read %d frames\n", rc);
        }
      
        /* Copy data into permanent buffer. */
        memcpy(casted + (i*BYTES_PER_SAMPLE*SAMPLES_PER_PERIOD),
               data_read, BYTES_PER_SAMPLE*SAMPLES_PER_PERIOD);
    }  
    
    /* Free data read buffer. */
    free(data_read);
    
    /* Close PCM. */
    snd_pcm_drain(handle);
    snd_pcm_close(handle);
    
    /* Give data to the user. */
    return data;
}

/* Function Name: readPickupData_test
 * Input          None.
 * Return Value:  data - Simulated data.
 * Precondition:  None.
 * Purpose:       Generates signals centered around an input frequency 
 *                from the user to test the remainder of the code logic.
 */
float *readPickupData_test(void)
{
	/* Variables. */
    float *data = malloc(NUM_SAMPLES*sizeof(float));
	int i;
	float frequency;
	char *commandsForGnuplot[] = {"set title \"Data from Guitar\"", 
		                         "plot 'data.temp' with lines ls 1 \n"};
    FILE *temp = fopen("data.temp", "w");
    FILE *gnuplotPipe = popen ("gnuplot -persistent", "w"); 
	
	/* Get frequency of wave from user. */
    printf("readPickupData_test: Enter audio frequency to ");
    printf("simulate: ");
    scanf("%f", &frequency);
    
    /* Generate wave. */
    for(i = 0; i < NUM_SAMPLES; ++i) 
        data[i] =  sin((2*GPU_FFT_PI*frequency*i)/NUM_SAMPLES);
	
	 
    /* Graph data. */     

    /*     Opens an interface that one can use to send commands as if   
     *     they were typing into the gnuplot command line.  
     *     "The -persistent" keeps the plot open even after your
     *     C program terminates.
     */
    for (i=0; i < NUM_SAMPLES; ++i)
        fprintf(temp, "%lf %lf \n", 
               (float) i / (float) DESIRED_SAMPLE_RATE, 
               data[i]); //Write the data to a temporary file 

    for (i=0; i < 2; i++)
        fprintf(gnuplotPipe, "%s \n", 
          commandsForGnuplot[i]); //Send commands to gnuplot one by one.
        
    /* Clean up. */
    fclose(temp);
    fclose(gnuplotPipe);
    
    return data;
}
