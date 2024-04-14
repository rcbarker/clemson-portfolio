/* Team GA-5
 * File name: calibrate.c
 * 
 * Content Description: Used to tune constants in guitarTuner.h.
 *
 */

/* Import project header file. */
#include "guitarTuner.h"

int main(void)
{
	/* Variables. */
	data_t *data = NULL;
    tuning_t *tune = NULL;
	int tuning_num = -1;
	int string_num = -1;
	float frequency = -1;
	float first_harmonic = -1;
	int in_tune = FALSE;	
	int exit = FALSE;
	
    /* Set GPIO. */
    wiringPiSetup();
    pinMode(STEP, OUTPUT); 
    pinMode(DIR, OUTPUT);   
    pinMode(ENABLE, OUTPUT); 
    pinMode(C2, OUTPUT);
    pinMode(C1, OUTPUT);   
    pinMode(C0, OUTPUT);   
    
    /* Parameter calibration file. */
    printf("CALIBRATE MODE - Uses standard tuning.\n"); 
    printf("Noise threshold is %d hertz.\n", AMBIENT_NOISE);

    /* Run forever. */
    while(TRUE) {
		/* Get tuning number. */
	    tuning_num = 0;
		printf("Obtained tuning number. Starting guitar tuner...\n");
		
	    /* Reset number of strings. */
		string_num = NUM_STRINGS;
		printf("string_num = %d\n", string_num);
		/* Main loop. */
		while(string_num > 0) {
			/* Reset frequency and in_tune. */
			frequency = -1;
			in_tune = FALSE;
			
			do {				
				/* Seperate data with enter keystrokes. */
				printf("Press enter to capture data...\n");
				getchar();
				
				/* Grab data for this string. */
			    data = readPickupData();
			
				/* Fast Fourier Transform data. */
				frequency = processFFT_calibrate(data);
				
                /* Only process string data. */
				if(frequency >= AMBIENT_NOISE) {
					/* Get first harmonic. */
					first_harmonic = killHarmonics_calibrate(tuning_num,
					                               string_num, 
					                               frequency);
					
					/* Check if string is in tune. */
					tune = checkTuning(tuning_num, string_num, 
					                   first_harmonic);
					                   
					if(tune->type == IN_TUNE) in_tune = TRUE;
					else in_tune = FALSE;
					 
					/* Move motor accordingly */
				    moveMotor(string_num, tune->type, tune->direction);
					
					/* Clean up tune. */
					free(tune);
				}
				
				/* Clean up data. */
				free(data->data);
				free(data);
		    } while(!in_tune);
        
            /* String is in tune. */
            if(string_num != 1) printf("Strum next string.\n");
            
		    /* Decrement string number. */
            string_num--;
	    }
	    
	    /* All strings are in tune. */
	    printf("All strings are in tune. Exit (0 or 1)? ");
	    scanf("%d", &exit);
	    if(exit) break;
    } 
    
    return 0; 
}
