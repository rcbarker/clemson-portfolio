CC= gcc
CFLAGS= -m32

BINS= factorial

all: $(BINS)

factorial: factorial.c factorial.s
	$(CC) $(CFLAGS) -o factorial factorial.c factorial.s

clean:
	rm -f $(BINS) core

