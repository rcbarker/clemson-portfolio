CC= gcc
CFLAGS= -m32

BINS= triangle

all: $(BINS)

triangle: triangle.c triangle.s
	$(CC) $(CFLAGS) -o triangle triangle.c triangle.s

clean:
	rm -f $(BINS) core

