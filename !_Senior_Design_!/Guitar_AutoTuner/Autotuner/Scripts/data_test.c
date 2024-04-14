/* Team GA-5
 * File name: data_test.c
 * 
 * Content Description: Contains code to importing data from the Pi's
 * USB audio interface
 *
 */
 
/* Use the newer ALSA API. */
#define ALSA_PCM_NEW_HW_PARAMS_API

/* File Parameters. */
#define SAMPLE_RATE 8192
#define NUM_FRAMES 8192
#define FRAMES_PER_SAMPLE 32
#define GRAIN 10
char capture_interface[] = "plughw:1";

#include <alsa/asoundlib.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
    /* Variables */
    int i, rc;
    snd_pcm_t *handle;
    snd_pcm_hw_params_t *params;
    unsigned int val;
    int dir;
    snd_pcm_uframes_t frames;
    int16_t *data_read = NULL;
    int16_t *buffer = NULL;

    char *commandsForGnuplot[] = {"set title \"Data from Guitar\"", "plot 'data.temp'"};
    FILE *temp = fopen("data.temp", "w");
    
    FILE *gnuplotPipe = popen ("gnuplot -persistent", "w"); 
 
    /* Open PCM device for recording (capture). */
    rc = snd_pcm_open(&handle, capture_interface,
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
    val = SAMPLE_RATE;
    snd_pcm_hw_params_set_rate_near(handle, params,
                                    &val, &dir);
printf("val = %d\n", val);
    /* Set period size. */
    frames = FRAMES_PER_SAMPLE;
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
    data_read = (int16_t *) malloc(FRAMES_PER_SAMPLE*sizeof(int16_t));
  
    /* Set up buffer to store data. */
    buffer = (int16_t *) malloc(NUM_FRAMES * sizeof(int16_t));
    uint8_t *casted = (uint8_t *) buffer; 
  
    /* Read data in. */
    for(i= 0; i < NUM_FRAMES / FRAMES_PER_SAMPLE; ++i) {
	    /* Sampe in data. */
	    rc = snd_pcm_readi(handle, data_read, 32);
      
        /* Error checking. */
        if (rc == -EPIPE) {
            /* EPIPE means overrun */
            fprintf(stderr, "overrun occurred\n");
            snd_pcm_prepare(handle);
        } else if (rc < 0) {
            fprintf(stderr, "error from read: %s\n",
            snd_strerror(rc));
        } else if (rc != 32) {
            fprintf(stderr, "short read, read %d frames\n", rc);
        }
      
        /* Copy data into permanent buffer. */
        memcpy(casted + (i*2*FRAMES_PER_SAMPLE), data_read, 
               2*FRAMES_PER_SAMPLE);
    }  
  
    /* Clean up data_read. */
    free(data_read);
   
    /* Close PCM. */
    snd_pcm_drain(handle);
    snd_pcm_close(handle);
   
    /* Graph data. */     

    /*     Opens an interface that one can use to send commands as if they were typing into the
     *     gnuplot command line.  "The -persistent" keeps the plot open even after your
     *     C program terminates.
     */
    for (i=0; i < NUM_FRAMES/GRAIN; ++i)
        fprintf(temp, "%lf %d \n", (float) i / (float) SAMPLE_RATE, buffer[i]); //Write the data to a temporary file 

    for (i=0; i < 2; i++)
        fprintf(gnuplotPipe, "%s \n", commandsForGnuplot[i]); //Send commands to gnuplot one by one.
    
    return 0;
}

