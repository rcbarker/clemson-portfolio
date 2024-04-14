CC= gcc
CFLAGS= -Wall -g

BINS= leakcount
OBJS= memory_shim.so 
TESTS= leaktest0 leaktest1 leaktest2 leaktest3 leaktest4 leaktest5 leaktest6 leaktest7

all: $(BINS) $(OBJS) test

memory_shim.so: memory_shim.c
	$(CC) $(CFLAGS) -fPIC -shared -o memory_shim.so memory_shim.c -ldl

leakcount: leakcount.c
	$(CC) $(CFLAGS) -o leakcount leakcount.c

test: ./tests/leaktest0.c ./tests/leaktest1.c ./tests/leaktest2.c ./tests/leaktest3.c ./tests/leaktest4.c ./tests/leaktest5.c ./tests/leaktest6.c ./tests/leaktest7.c 
	$(CC) $(CFLAGS) -o leaktest0 ./tests/leaktest0.c
	$(CC) $(CFLAGS) -o leaktest1 ./tests/leaktest1.c 
	$(CC) $(CFLAGS) -o leaktest2 ./tests/leaktest2.c 
	$(CC) $(CFLAGS) -o leaktest3 ./tests/leaktest3.c 
	$(CC) $(CFLAGS) -o leaktest4 ./tests/leaktest4.c 
	$(CC) $(CFLAGS) -o leaktest5 ./tests/leaktest5.c 
	$(CC) $(CFLAGS) -o leaktest6 ./tests/leaktest6.c  
	$(CC) $(CFLAGS) -o leaktest7 ./tests/leaktest7.c

clean:
	rm -f $(BINS) $(OBJS) $(LIBS) leaks.txt $(TESTS) core
 
