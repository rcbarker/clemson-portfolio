Team GA-5
readme.txt

Notes:
1. The .pcb file included was generated with expressPCB.
2. blueClient.c and blueServer.c 

Makefile Commmands:
1. "make": Makes the main AutoTuner logic. This is the only thing used to run the design.
2. "calibrate": Generates a version of the AutoTuner logic that is enter key delimited per sample. Used to calibrate the
                constants in guitarTuner.h.
3. "tuningTest": Generates a version of the AutTuner logic that pipes sine waves from the Pi into the tuner logic. Used to
                 test the main tuning logic without the system input working.
4. "debug": Generates test scripts from the design phase.
5. "blueServer": Generates a version of the AutoTuner logic that runs the logic with a Bluetooth Server.
6. "blueClient": Generates a version of the AutoTuner logic that runs the logic as a Bluetooth Client targeting Ryan 
                 Barker's Samsung Galaxy S5 as the Bluetooth Server.