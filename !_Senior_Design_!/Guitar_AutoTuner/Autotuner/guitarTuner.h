/* Team GA-5
 * File name: guitarTuner.h
 * 
 * Content Desciption: Header file containing necessary references for 
 * all guitar tuner files.
 *
 */
 
/* Common Libraries: */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <wiringPi.h>
#include <alsa/asoundlib.h>
#include <stdint.h>
#include <sys/socket.h>
#include <bluetooth/bluetooth.h>
#include <bluetooth/rfcomm.h>

/* Note: The paths in these lines need to be updated to reflect where
 * the headers are saved for the program to compile. 
 */
#include "/home/pi/ECE4960/FFT/mailbox.h"
#include "/home/pi/ECE4960/FFT/gpu_fft.h"

/* GPIO Pinouts: */
#define STEP 0    // physical pin 11
#define DIR 1     // physical pin 12
#define ENABLE 2  // physical pin 13
#define C2 3      // physical pin 15 (C on Multiplexer)
#define C1 4      // physical pin 16 (B on Multiplexer)
#define C0 5      // physical pin 18 (A on Multiplexer)
/* DO NOT USE PIN 17 for A: It is a +3.3V pin!! */

/* General Constants: */
#define TRUE 1
#define FALSE 0
#define BUFF_SIZE 1024
#define NUM_STRINGS 6
#define NUM_TUNINGS 3
#define CLOCKWISE 1
#define COUNTERCLOCKWISE 0
#define BOUND 50           // Strings must be within +/- BOUND hertz of
                           // the target value for the algorithm to work
                           // correctly.
                           
/* Audio Sampling Constants: */
#define ALSA_PCM_NEW_HW_PARAMS_API
#define BYTES_PER_SAMPLE 2
#define DESIRED_SAMPLE_RATE 4096
#define NUM_SAMPLES 4096
#define SAMPLES_PER_PERIOD 32

/* Tuning Constants: */
#define ACCURACY 1          // Sets how accurate the tuner is to the target frequency. The tuner is accurate to
                            // +/- ACCURACY hertz of the target frequency.
#define AMBIENT_NOISE 65    // Frequency Threshold (in Hz) of ambient noise signal to ignore.
#define THRES_PERCENT 0.45  // Percentage of max signal value to threshold noise out of the 
                            // frequency calculation process.
#define TUNING_THRESHOLD 5  // Threshold (in Hz) that determines whether the program fine or coarse tunes.
#define COARSE 36           // Amount of hertz to tune by for coarse tuning.
#define FINE   18           // Amount of hertz to tune by for fine tuning.
#define IN_TUNE -1          // Constant representing if the string is or tune or not. Do not change.

/* Motor Constants: */
#define STEP_SIZE 0.9       // Step size for motor.
#define FREQ 0.25           // Used to move motor. Do not change.
#define DUTY_CYCLE 5        // Used to move motor. Do not change.

/* Structure ADTs. */
typedef struct data_tag {
	/* Used to read data from the pickup. */
	unsigned int sample_rate;   // Stores rate data was sampled 
	                            // at for later use.
	int16_t *data;              // Stores the data itself.
} data_t;
    
typedef struct tuning_tag {
	/* Used to send motor control commands */
	/* based off of frequency data. */
	float type;       // Degrees to turn motor.
	int direction;    // Either clockwise or counter-clockwise.
} tuning_t;

/* Function Prototypes: */
data_t *readPickupData(void);
float *readPickupData_test(void);
float processFFT(data_t *input_data);
float processFFT_calibrate(data_t *input_data);
float processFFT_test(float *input_data);
float killHarmonics(int tuneNum, int stringNum, float frequency);
float killHarmonics_calibrate(int tuneNum, int stringNum, 
                              float frequency);
float findMaxMagnitude(struct GPU_FFT_COMPLEX *base);
float getFrequency(int sample_rate, int sample_num);
float getMagnitude(float real, float imaginary);
tuning_t *checkTuning(int tuneNum, int stringNum, float frequency);
void setMultiplexer(int motorNum);
void moveMotor(int motorNum, float degrees, int direction);
void startBluetoothServer(void);
void startBluetoothClient(void);
int receiveBluetoothServer(void);
int receiveBluetoothClient(void);
void transmitBluetoothServer(int stringNum, float frequency);
void transmitBluetoothClient(int stringNum, float frequency);
void closeBluetoothClient(void);
void closeBluetoothServer(void);
void disconnectServer(void);
