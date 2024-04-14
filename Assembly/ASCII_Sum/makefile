CC= gcc
CFLAGS= -m32

BINS= asciisum

all: $(BINS)

asciisum: asciisum.c asciisum.s
	$(CC) $(CFLAGS) -o asciisum asciisum.c asciisum.s

clean:
	rm -f $(BINS) core

