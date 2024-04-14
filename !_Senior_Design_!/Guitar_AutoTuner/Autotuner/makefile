# Team GA-5
# Guitar AutoTuner Makefile
# 
# Content Desciption: Builds and destroys all software related to
#                     the guitar autotuner project.
#
#
 
S = ./FFT/hex/shader_256.hex \
    ./FFT/hex/shader_512.hex \
    ./FFT/hex/shader_1k.hex \
    ./FFT/hex/shader_2k.hex \
    ./FFT/hex/shader_4k.hex \
    ./FFT/hex/shader_8k.hex \
    ./FFT/hex/shader_16k.hex \
    ./FFT/hex/shader_32k.hex \
    ./FFT/hex/shader_64k.hex \
    ./FFT/hex/shader_128k.hex \
    ./FFT/hex/shader_256k.hex \
    ./FFT/hex/shader_512k.hex \
    ./FFT/hex/shader_1024k.hex \
    ./FFT/hex/shader_2048k.hex \
    ./FFT/hex/shader_4096k.hex

C = ./FFT/mailbox.c ./FFT/gpu_fft.c ./FFT/gpu_fft_base.c ./FFT/gpu_fft_twiddles.c ./FFT/gpu_fft_shaders.c

C1D = $(C) ./Scripts/fft_test.c
H1D = ./FFT/gpu_fft.h ./FFT/mailbox.h 
M1D = ./Scripts/motor_test.c
G1D = ./Scripts/gnuplot_test.c
D1D = ./Scripts/data_test.c

Overall = ./guitarTuner.h ./guitarTuner.c ./audio.c ./frequency.c ./motor.c ./bluetooth.c  
Calibrate = ./guitarTuner.h ./calibrate.c ./audio.c ./frequency.c ./motor.c ./bluetooth.c  
TuningTest = ./guitarTuner.h ./tuningTest.c ./audio.c ./frequency.c ./motor.c ./bluetooth.c 
BlueServer = ./guitarTuner.h ./blueServer.c ./audio.c ./frequency.c ./motor.c ./bluetooth.c  
BlueClient = ./guitarTuner.h ./blueClient.c ./audio.c ./frequency.c ./motor.c ./bluetooth.c  
F = -lrt -lm -ldl 

guitarTuner.bin: $(S) $(C) $(Overall) $(H1D);
	gcc -o guitarTuner.bin -g -Wall $(Overall) $(C) $(F) -lwiringPi -lasound -lbluetooth
	
all:	guitarTuner.bin calibrate.bin tuningTest.bin bluetooth debug;
	
calibrate:	calibrate.bin;

tuningTest:	tuningTest.bin;

bluetooth: blueServer.bin blueClient.bin;

debug:	fft_test.bin 	motor_test.bin	gnuplot_test.bin data_test.bin;

calibrate.bin: $(S) $(C) $(Calibrate) $(H1D);
	gcc -o calibrate.bin -g -Wall $(Calibrate) $(C) $(F) -lwiringPi -lasound -lbluetooth

tuningTest.bin: $(S) $(C) $(TuningTest) $(H1D);
	gcc -o tuningTest.bin -g -Wall $(TuningTest) $(C) $(F) -lwiringPi -lasound -lbluetooth

blueServer.bin: $(S) $(C) $(BlueServer) $(H1D);
	gcc -o blueServer.bin -g -Wall $(BlueServer) $(C) $(F) -lwiringPi -lasound -lbluetooth
	
blueClient.bin: $(S) $(C) $(BlueClient) $(H1D);
	gcc -o blueClient.bin -g -Wall $(BlueClient) $(C) $(F) -lwiringPi -lasound -lbluetooth

fft_test.bin:	$(S) $(C1D) $(H1D);
	gcc -o fft_test.bin $(F) $(C1D)

motor_test.bin: $(M1D);
	gcc -o motor_test.bin $(M1D) -lwiringPi

gnuplot_test.bin: $(G1D);
	gcc -o gnuplot_test.bin $(G1D)

data_test.bin: $(D1D);
	gcc -o data_test.bin $(D1D) -g -Wall -lasound

clean:
	rm -f *.bin *.temp
