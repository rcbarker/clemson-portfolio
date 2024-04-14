#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <string.h>
#include <ifaddrs.h>
#include <string.h>
#include "server.h"
#include <arpa/inet.h>
#include <signal.h>
#include <sys/wait.h>
#include <stdint.h>

#include "battleship.h"
#include "client.h"

#define SIZE_CHAR 2 

char** playerSetup(int dims, int numPlayers, player** yourPlayer, int playernum);
int playerInputLoop(int sock, char** sPos, player* thePlayer, int dims, int playerNum, int orig_players);

#define PORT "3490"

int runClient(char* host_address, int dims, int numPlayers, int playernum, int orig_players)
{
	player* yourPlayer = (player*) malloc(sizeof(player));

	int socket = -1;
	printf("%s\n",host_address);
	printf("Connecting to host...\n");
	sleep(playernum*3);
	while(socket == -1)
	{
		printf("Connecting to host...\n");
		socket = connectToHost(host_address);
		sleep(1);
	}

	printf("Connected! Player number is %d\n",playernum+1);

	char** shipPos = playerSetup(dims, numPlayers, &yourPlayer, playernum);

	int result = -1;

	while(result != 1)
		result = playerInputLoop(socket, shipPos, yourPlayer, dims, playernum, orig_players);

	return result;
}

int reconnectClient(char* host_address, int dims, int numPlayers, int playernum, char** shipPos, player* yourPlayer, int orig_players)
{
	int socket = -1;
	printf("%s\n",host_address);
	printf("Connecting to host...\n");
	sleep(playernum*3);
	while(socket == -1)
	{
		printf("Connecting to host...\n");
		socket = connectToHost(host_address);
		sleep(1);
	}
	printf("Reconnected! Player number is %d\n",playernum+1);

	int result = -1;

	while(result != 1)
		result = playerInputLoop(socket, shipPos, yourPlayer, dims, playernum, orig_players);

	return result;
}

int playerInputLoop(int sock, char** sPos, player* thePlayer, int dims, int playernum, int orig_players)
{
	int var;
	char buffo[1000];
	int len;
	char hit[1000];
	char *firingCoordinates=NULL;
	int yCoord, xCoord;
	char* new_addr;
	int new_num_players;

	if((var=recv(sock, buffo, SIZE_CHAR, 0))>0){
		switch(buffo[0])
		{
			case 'G':
				len = (dims*sizeof(char *)) + (dims*dims*sizeof(char));
				if((var=send(sock, sPos, len, 0)) <= 0){
					printf("\nHouston, we have a send error\n");
				}
				break;
			case 'T': 
				while(firingCoordinates == NULL)
  				{ 
     					firingCoordinates = getCommand(dims, dims, thePlayer->targetingGrid, playernum);
 				}
				if((var=send(sock,firingCoordinates,4*sizeof(char),0))==-1){
					printf("\nHouston, we have a send error\n");
				}
				if((var=recv(sock, hit, SIZE_CHAR, 0)) <= 0){
					printf("\nHouston, we have a recv error\n");
				}else{
					xCoord = convertX(firingCoordinates);
				        yCoord = convertY(firingCoordinates);

					/* Variables. */
					if(hit[0] == 'M'){ 
						printf("You missed!\n");
						thePlayer->targetingGrid[yCoord][xCoord] = 'M';
						sPos[yCoord][xCoord] = 'M';
					}else{ 
						printf("Hit!\n");
						thePlayer->targetingGrid[yCoord][xCoord] = 'H';
						sPos[yCoord][xCoord] = 'H';
					}
				}
				break;
			case 'W': 
				printf("\nYou have won the game!\n");
				close(sock);
				return 1;
			case 'L':
				printf("\nYou have lost the game...\n");
				close(sock);
				return 1;
		}
		return 0;
	}
	else{
		printf("We are not connected or we have sent more than one character\n");
		new_addr = reSelectHost(dims, &new_num_players, orig_players);
		reconnectClient(new_addr, dims, new_num_players, playernum, sPos, thePlayer, orig_players);		
		return 1;
	}
	
}

int connectToHost(char* host_address)
{
	int sockfd;
	struct addrinfo hints, *servinfo, *p;
	int rv;

	memset(&hints, 0, sizeof hints);
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	if ((rv = getaddrinfo(host_address, PORT, &hints, &servinfo)) != 0) {
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
		return 0;
	}

	for(p = servinfo; p != NULL; p = p->ai_next) {
		if ((sockfd = socket(p->ai_family, p->ai_socktype,
				p->ai_protocol)) == -1) {
			continue;
		}
		if (connect(sockfd, p->ai_addr, p->ai_addrlen) == -1) {
			close(sockfd);
			continue;
		}
		break;
	}

	if (p == NULL) {
		return -1;
	} else {
		return sockfd;
	}	
}

char** playerSetup(int dims, int numPlayers, player** yourPlayer, int playernum)
{
	int i,j;

	/*Allocate full block of memory for sending: Size of array in malloc below*/
	uint8_t *memory = (uint8_t*) malloc((dims*sizeof(char *)) + (dims*dims*sizeof(char)));
	char **shipPos = (char **) memory;

	memory += dims*sizeof(char *);

	for(i = 0; i < dims; i++)
	    {
	      shipPos[i] = (char *) memory;
	      memory += dims*sizeof(char);

	      for(j = 0; j < dims; j++)
	      {
		shipPos[i][j] = ' ';
	      }
	    }

	*yourPlayer = newPlayer(dims, dims);
    	placeShips((*yourPlayer)->targetingGrid, shipPos, numPlayers, playernum);

	return shipPos;
}



















