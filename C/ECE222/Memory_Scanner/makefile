CC= gcc
CFLAGS= -Wall -g

BINS= memscanner

all: $(BINS)

memscanner: memscanner.c
	$(CC) $(CFLAGS) -o memscanner memscanner.c

clean:
	rm -f $(BINS) core

