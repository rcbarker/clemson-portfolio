/* Team GA-5
 * File name: blueServer.c
 * 
 * Content Description: Main Guitar AutoTuner logic as Bluetooth Server.
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
	
    /* Set GPIO. */
    wiringPiSetup();
    pinMode(STEP, OUTPUT); 
    pinMode(DIR, OUTPUT);   
    pinMode(ENABLE, OUTPUT); 
    pinMode(C2, OUTPUT);
    pinMode(C1, OUTPUT);   
    pinMode(C0, OUTPUT);   
    
    /* Parameter calibration file. */
    printf("\nGA-5 Guitar AutoTuner Program\n\n");

    /* Start bluetooth server. */
    startBluetoothServer();
    
    /* Run forever. */
    while(TRUE) {
		/* Get tuning number. */
	    tuning_num = receiveBluetoothServer();
		
		/* Error check tuning_num. */
		while(tuning_num < 0 || tuning_num > 2) {
			tuning_num = receiveBluetoothServer();
		}
		
		printf("Obtained tuning command. Starting guitar tuner...\n");
		printf("Please strum all strings individually starting with ");
		printf("the thickest string.\n");
		
	    /* Reset number of strings. */
		string_num = NUM_STRINGS;
		
		/* Main loop. */
		while(string_num > 0) {
			/* Reset frequency and in_tune. */
			frequency = -1;
			in_tune = FALSE;
			
			do {								
				/* Grab data for this string. */
			    data = readPickupData();
			
				/* Fast Fourier Transform data. */
				frequency = processFFT(data);
				printf("frequency = %1.2f Hz\n", frequency);
				
                /* Only process string data. */
				if(frequency >= AMBIENT_NOISE) {
				    /* Get first harmonic. */
					first_harmonic = killHarmonics(tuning_num,
					                               string_num, 
					                               frequency);
					printf("first harmonic = %1.2f Hz\n", first_harmonic);
					
					/* Check if string is in tune. */
					tune = checkTuning(tuning_num, string_num, 
					                   first_harmonic);
					if(tune->type == IN_TUNE) in_tune = TRUE;
					else in_tune = FALSE;
					 
					/* Move motor accordingly */
					moveMotor(string_num, tune->type, tune->direction);
					
					/* Clean up tune. */
					free(tune);
					
					/* Wait before grabbing new audio. */
					sleep(0.5);
				}
				
				/* Clean up data. */
				free(data->data);
				free(data);
		    } while(!in_tune);
        
            /* String is in tune. */
            
            /* Send frequency to control application. */
            transmitBluetoothServer(string_num, frequency);
            
            /* Prompt user if not finished. */
            if(string_num != 1) printf("Strum next string.\n");
            
		    /* Decrement string number. */
            string_num--;
	    }
	    
	    /* All strings are in tune. */
	    printf("All strings are in tune.\n\n\n\n");
	    
	    /* Close connection to Bluetooth Client. */
	    closeBluetoothClient();
    } 

    /* Should not reach here. */
    printf("Error - Closing Bluetooth server...\n");
    closeBluetoothServer();
    printf("Terminated.\n");
   
    return 0; 
}
