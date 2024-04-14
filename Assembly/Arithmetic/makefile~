CC= gcc
CFLAGS= -m32

BINS= arithmetic

all: $(BINS)

arithmetic: arithmetic.c arithmetic.s
	$(CC) $(CFLAGS) -o arithmetic arithmetic.c arithmetic.s

clean:
	rm -f $(BINS) core

