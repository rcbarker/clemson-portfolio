# ECE 4400
# Networked Battleship Makefile
#
# Content Desciption: Builds and destroys all software related to
#                     the Networked Battleship Game Project.
#
#

Overall = ./battleship.c ./battleship.h ./battleshipFuncs.c ./client.c ./client.h ./host.c ./HS2.c ./server.c ./server.h
F = -g -Wall

battleship.bin: $(Overall)
	gcc -o battleship.bin $(F) $(Overall)
	
clean:
	rm -f *.bin *.temp
