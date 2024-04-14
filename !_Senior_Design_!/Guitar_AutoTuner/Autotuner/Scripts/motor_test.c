/* Team GA-5
 * File name: motor_test.c
 * 
 * Content Description: Contains code to test motor control with the Raspberry Pi.
 * 
 * NOTE: If you test this file with a not gate on the enable line, switch
 * lines 92 and 116. The file will not work if you do not do this!
 *
 */
  
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <wiringPi.h>

#define STEP_SIZE 0.9
#define MAX_SIZE 256
#define FREQ 0.25
#define DUTY_CYCLE 0.5

/* GPIO Pinouts */
#define STEP 0    // physical pin 11
#define DIR 1     // physical pin 12
#define ENABLE 2  // physical pin 13
#define C2 3      // physical pin 15
#define C1 4      // physical pin 16
#define C0 5      // physical pin 17

/* Function Prototypes */

void setMultiplexer(int motorNum)
{
	switch(motorNum)
	{
		case 1:
			digitalWrite(C2, LOW);
			digitalWrite(C1, LOW);
			digitalWrite(C0, HIGH);
			break;
		case 2:
			digitalWrite(C2, LOW);
			digitalWrite(C1, HIGH);
			digitalWrite(C0, LOW);
			break;
		case 3:
			digitalWrite(C2, LOW);
			digitalWrite(C1, HIGH);
			digitalWrite(C0, HIGH);
			break;
		case 4:
			digitalWrite(C2, HIGH);
			digitalWrite(C1, LOW);
			digitalWrite(C0, LOW);
			break;
		case 5:	
			digitalWrite(C2, HIGH);
			digitalWrite(C1, LOW);
			digitalWrite(C0, HIGH);
			break;
		case 6:
			digitalWrite(C2, HIGH);
			digitalWrite(C1, HIGH);
			digitalWrite(C0, LOW);
			break;
		default:
			printf("motor_test: Invalid motor number %d.\n", motorNum);
	}
}

int main(void) 
{
    /* Variables. */
    int i, motor, degrees, num_steps;
    char direction[MAX_SIZE];
    
    /* Setup GPIO. */
    wiringPiSetup();
    pinMode(STEP, OUTPUT); 
    pinMode(DIR, OUTPUT);   
    pinMode(ENABLE, OUTPUT); 
    pinMode(C2, OUTPUT);
    pinMode(C1, OUTPUT);   
    pinMode(C0, OUTPUT);   
    
    /* Get input from user. */
    printf("motor_test: Input control command (format - [motorNum] [deg] [CW/CCW]): ");
    scanf("%d %d %s", &motor, &degrees, direction);
    
    /* Enable stepper driver. */
    digitalWrite(ENABLE, LOW);
    
    /* Set multiplexer control. */
    setMultiplexer(motor);
    
    /* Calculate number of steps to take. */
    num_steps = (2 * degrees) / STEP_SIZE;
    printf("motor_test: Calculated %d steps.\n", num_steps);
    
    /* Respond to input. */
    if (!strcmp(direction, "CW")) digitalWrite (DIR, HIGH);
    else  digitalWrite (DIR, LOW) ;
       
    /* Spin Stepper Motor. */
   for(i = 0; i < num_steps; ++i) {
    	digitalWrite (STEP, LOW); 
    	delayMicroseconds(1000*DUTY_CYCLE/FREQ);
   	    digitalWrite (STEP, HIGH);
    	delayMicroseconds(1000*DUTY_CYCLE/FREQ);
  	}
  	
	/* Reset all GPIO motor inputs to ground. */
	digitalWrite(STEP, LOW);
	digitalWrite(DIR, LOW);
	digitalWrite(ENABLE, HIGH);
           
    return 0;
}
