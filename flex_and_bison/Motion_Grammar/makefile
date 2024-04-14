# Makefile example -- scanner and parser.
# Creates "myprogram" from "scan.l", "parse.y", and "myprogram.c"
#
CC= gcc
LEX= flex
YACC= bison
CFLAGS= -lfl -Wall

%.c: %.y
%.c: %.in

BINS= motion
     
all: $(BINS)

motion: motion.y motion.in motion.c
	bison -d -v motion.y
	flex motion.in
	$(CC) motion.c $(CFLAGS) -o motion
	chmod a+x execute

clean:
	rm -f motion lex.yy.c motion.tab.c motion.tab.h motion.output
