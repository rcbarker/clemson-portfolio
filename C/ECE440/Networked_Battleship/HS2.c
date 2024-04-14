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
#include "battleship.h"
#include "client.h"

typedef void (*fptr)();


#define BACKLOG 10	 // how many pending connections queue will hold
#define PORT "3491" 

#define MAXDATASIZE 100 

char* addresses[4] = {"192.168.0.4","192.168.0.28","192.168.0.33","192.168.0.2"};
int active_systems[] = {0,0,0,0};
int self[] = {0,0,0,0};

void selectHost();
void verifyActiveSystems();
int systemActive(int index);
int checkIfLowest(int* low_index);
void identifyIP();

int main(int argc, char *argv[])
{
	selectHost();
	return 0;
}

void selectHost()
{
	int low_index;

	identifyIP();

	verifyActiveSystems();
	
	int lowest = checkIfLowest(&low_index);
	int numPlayers = 0;
	int dims;

	int playernum;
	int i;
	for(i=0; i<4; i++)
	{
		if(self[i]) playernum = i-low_index;
		if(active_systems[i]) numPlayers++;
	}

	if(numPlayers == 2) dims = 18;
    	else if(numPlayers == 3) dims = 21;
    	else dims = 24;

	if(lowest == 1 && fork() == 0)
	{
		printf("I am the host, PID: %d\n",getpid());
		hostGame(dims, numPlayers, numPlayers);
	}	
	else {
		printf("I am a client\n");
		runClient(addresses[low_index], dims, numPlayers, playernum, numPlayers);
	}

}

char* reSelectHost(int dims, int* new_num_players, int orig_players)
{
	int i;
	int low_index;

	identifyIP();
	for(i=0; i<4; i++)
	{
		active_systems[i] = 0;
	}

	verifyActiveSystems();
	
	int lowest = checkIfLowest(&low_index);
	*new_num_players = 0;

	for(i=0; i<4; i++)
	{
		if(active_systems[i]) (*new_num_players)++;
	}

	printf("Number of players: %d\n",(*new_num_players));

	if(lowest == 1 && fork() == 0)
	{
		printf("I am the host, PID: %d\n",getpid());
		hostGame(dims, *new_num_players, orig_players);
	}
	return addresses[low_index];
}

void alarmHandle()
{
	exit(0);
}

void verifyActiveSystems()
{
	int i;
	signal(SIGALRM,(fptr) alarmHandle);
	if(fork()==0)
	{
		alarm(60);
		runServer();
	}
	sleep(10);
	for(i=0; i<4; i++)
	{
		if(!self[i])
		{
			active_systems[i] = systemActive(i);
		}
		else
		{
			active_systems[i] = 1;
		}
	}
}

int systemActive(int index)
{
	int sockfd;
	struct addrinfo hints, *servinfo, *p;
	int rv;

	memset(&hints, 0, sizeof hints);
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	if ((rv = getaddrinfo(addresses[index], PORT, &hints, &servinfo)) != 0) {
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
		return 0;
	} else {
		printf("%d active\n",index);
		close(sockfd);
		return 1;
	}	
}

void identifyIP()
{
	struct ifaddrs *addrs, *tmp;
	int i;
	getifaddrs(&addrs);
	tmp = addrs;

	while (tmp) 
	{
	    if (tmp->ifa_addr && tmp->ifa_addr->sa_family == AF_INET)
	    {
		struct sockaddr_in *pAddr = (struct sockaddr_in *)tmp->ifa_addr;
		for(i=0; i<4; i++)
			if(strcmp(addresses[i],inet_ntoa(pAddr->sin_addr)) == 0)
				self[i] = 1;
	    }

	    tmp = tmp->ifa_next;
	}

	freeifaddrs(addrs);
}

int checkIfLowest(int* low_index)
{
	int lowest = 0;
	int i;

	for(i=0; i<4; i++)
	{
		if(self[i] == 1 && active_systems[i] == 1)
		{
			lowest = 1;
			*low_index = i;
			break;
		}
		else if(self[i] == 0 && active_systems[i] == 1)
		{			
			*low_index = i;
			break;
		}
	}


	return lowest;
}






