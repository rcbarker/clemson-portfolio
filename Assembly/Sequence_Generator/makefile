CC= gcc
CFLAGS= -m32

BINS= fibonacci

all: $(BINS)

fibonacci: fibonacci.c fibonacci.s
	$(CC) $(CFLAGS) -o fibonacci fibonacci.c fibonacci.s

clean:
	rm -f $(BINS) core

