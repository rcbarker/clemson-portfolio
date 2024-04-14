CC= gcc
CFLAGS= -m32

BINS= atoi

all: $(BINS)

atoi: atoi.c atoi.s
	$(CC) $(CFLAGS) -o atoi atoi.c atoi.s

clean:
	rm -f $(BINS) core

