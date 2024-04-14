CC= gcc
CFLAGS= -Wall -g

BINS= edgedetection

all: $(BINS)

edgedetection: edgedetection.c
	$(CC) $(CFLAGS) -o edgedetection edgedetection.c

clean:
	rm -f $(BINS) core

