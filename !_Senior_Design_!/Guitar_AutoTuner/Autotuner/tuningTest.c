/* Team GA-5
 * File name: tuningTest.c
 * 
 * Content Description: Tests Main Guitar AutoTuner logic.
 *
 */

/* Import project header file. */
#include "guitarTuner.h"

int main(void)
{
	/* Variables. */
	float *data = NULL;
    tuning_t *tune = NULL;
	int tuning_num = -1;
	int string_num = -1;
	float frequency = -1;
	int in_tune = FALSE;	
	
    /* Set GPIO. */
    wiringPiSetup();
    pinMode(STEP, OUTPUT); 
    pinMode(DIR, OUTPUT);   
    pinMode(ENABLE, OUTPUT); 
    pinMode(C2, OUTPUT);
    pinMode(C1, OUTPUT);   
    pinMode(C0, OUTPUT);   
    
    /* Test file. */
    printf("TEST MODE - Tests guitar auto-tuner frequency software "); 
    printf("and overall software logic.\n");
    printf("Noise threshold is %d hertz.\n", AMBIENT_NOISE);

    /* Run forever. */
    while(TRUE) {
		/* Get tuning number. */
	    printf("Enter tuning to use. See below options:\n");
		printf("    0 - Standard Tuning\n");
		printf("    1 - Drop D Tuning\n");
		printf("    2 - Open G Tuning\n");
		printf("Enter selection: ");
		scanf("%d", &tuning_num);
		
		/* Error check tuning_num. */
		while(tuning_num < 0 || tuning_num > 2) {
			printf("Invalid tuning number. Please re-enter: ");
			scanf("%d", &tuning_num);
		}
	
		printf("Obtained tuning number. Starting guitar tuner...\n");
		
	    /* Reset number of strings. */
		string_num = NUM_STRINGS;
		
		/* Main loop. */
		while(string_num > 0) {
			/* Reset frequency and in_tune. */
			frequency = -1;
			in_tune = FALSE;
			
			do {				
				/* Grab data for this string. */
			    data = readPickupData_test();
			
				/* Fast Fourier Transform data. */
				frequency = processFFT_test(data);
				
                /* Only process string data. */
				if(frequency >= AMBIENT_NOISE) {
					/* Check if string is in tune. */
					tune = checkTuning(tuning_num, string_num, 
					                   frequency);
					if(tune->type == IN_TUNE) in_tune = TRUE;
					else in_tune = FALSE;
					 
					/* Move motor accordingly */
					moveMotor(string_num, tune->type, tune->direction);	

					/* Clean up tune. */
					free(tune);
				}
				
				/* Clean up data. */
				free(data);
		    } while(!in_tune);
        
            /* String is in tune. */
            if(string_num != 1) printf("Strum next string.\n");
            
		    /* Decrement string number. */
            string_num--;
	    }
	    
	    /* All strings are in tune. */
	    printf("All strings are in tune.\n");
	    printf("\n\n\n");
    } 
    
    /* Note: This will never happen. */
    return 0; 
}
