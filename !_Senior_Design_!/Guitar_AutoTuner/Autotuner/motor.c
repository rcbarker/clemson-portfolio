/* Team GA-5
 * File name: motor.c
 * 
 * Content Description: Contains functions used for servo motor control.
 *
 */
  
/* Import project header file. */
#include "guitarTuner.h"

/* Function Name: setMultiplexer
 * Input:         motorNum - Number of the motor to be controlled.
 * Return Value:  None.
 * Precondition:  GPIO setup has been completed and matches the 
 *                constants in guitarTuner.h.
 * Purpose:       Sends signals to the multiplexer control pins 
 *                to control which motor step, direction, 
 *                and enable are multiplexed to.
 *  
 *                Pins 1-6 are used to coorespond to physical motors
 *                1-6. Pins 0 and 7 are not used.
 */
void setMultiplexer(int motorNum)
{
	/* Switch to user-specified motor. */
	switch(motorNum)
	{
		case 1:
		    /* Motor 1. */
			digitalWrite(C2, LOW);
			digitalWrite(C1, LOW);
			digitalWrite(C0, HIGH);
			break;
		case 2:
		    /* Motor 2. */
			digitalWrite(C2, LOW);
			digitalWrite(C1, HIGH);
			digitalWrite(C0, LOW);
			break;
		case 3:
		    /* Motor 3. */
			digitalWrite(C2, LOW);
			digitalWrite(C1, HIGH);
			digitalWrite(C0, HIGH);
			break;
		case 4:
			/* Motor 4. */
			digitalWrite(C2, HIGH);
			digitalWrite(C1, LOW);
			digitalWrite(C0, LOW);
			break;
		case 5:	
		    /* Motor 5. */
			digitalWrite(C2, HIGH);
			digitalWrite(C1, LOW);
			digitalWrite(C0, HIGH);
			break;
		case 6:
		    /* Motor 6. */
			digitalWrite(C2, HIGH);
			digitalWrite(C1, HIGH);
			digitalWrite(C0, LOW);
			break;
		default:
		    /* This should never occur. */
			printf("WARNING: Invalid motor number %d.\n", motorNum);
	}
}

/* Function Name: moveMotor
 * Inputs: motorNum  - Number of the motor to be controlled.
 *         degrees   - Desired angle of the motor relative to
 *                     its starting position.
 *         direction - Specifies the direction the motor spins.
 *                     CLOCKWISE or COUNTERCLOCKWISE.
 * Return Value: None.
 * Precondition: GPIO setup has been completed and matches the constants
 * in guitarTuner.h.
 * Purpose: Sends signals to the multiplexer control pins to control
 * which motor step, direction, and enable are multiplexed to.
 */
void moveMotor(int motorNum, float degrees, int direction)
{
	/* Base case - In tune. */
	if(degrees == IN_TUNE) return;
	
    /* Variables. */
    int i, num_steps;
    
    /* Enable stepper driver. */
    digitalWrite(ENABLE, LOW);
    
    /* Set multiplexer control. */
    setMultiplexer(motorNum);
    
    /* Calculate number of steps to take. */
    num_steps = (2 * degrees) / STEP_SIZE;
    
    /* Respond to input. */
    if (!direction) digitalWrite (DIR, LOW);
    else  digitalWrite (DIR, HIGH) ;
       
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
}
