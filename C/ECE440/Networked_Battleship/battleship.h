/* ECE4400 Final Project
 * File name: battleship.h
 * 
 * Content Description: Header file for battleship project.
 *
 */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/wait.h>
#include <signal.h>

#define TRUE 1
#define FALSE 0
#define MAX_HEALTH 17
#define LENGTH_CARRIER 5
#define LENGTH_BATTLESHIP 4
#define LENGTH_SUBMARINE 3
#define LENGTH_DESTROYER 3
#define LENGTH_PATROL 2

//Structures for gameMaster and Player
typedef struct p {
   int numShips;
   char **targetingGrid;
} player;

typedef struct master
{
   //Have to reference player # - 1 for myTurn and playerHealth
   int *playing; 
   int numPlayers;
   int boardSize;
   char **shipPos;
   int *playerHealth;
   int *playerSocket;
} gameMaster;


/* battleshipFuncs.c Function Prototypes */
void printBoard(int rows, int cols, char **shipPos);
char *getCommand(int rows, int cols, char **shipPos, int player);
player *newPlayer(int rows, int cols);
void placeShips(char **targetingGrid, char **shipPos, int numPlayers, int player);
int checkShipStart(int lowerLimit, int upperLimit, char **shipPos, char *input, int maxY);
char *getShipEnd(int shipSize, int lowerLimit, int upperLimit, char **shipPos, int maxY, int xStart, int yStart);
void fillGrid(char **targetingGrid, char **shipPos, int xStart, int xEnd, int yStart, int yEnd, char fill);
int convertX(char *input);
int convertY(char *input);
char *reverseCoords(int x, int y);
int checkBlank(int xStart, int yStart, int xEnd, int yEnd, char **shipPos);
int checkLimits(int x, int y, int lowerLimit, int upperLimit, int maxY);

void executeTurn(gameMaster *master, player **players, int playerNum, int dims);

/* host.c Function Prototypes */
void hostGame(int dims, int numPlayers, int orig_players);
gameMaster *newMaster(int dims, int numPlayers);
void *destructMaster(gameMaster *master);
int startTCPServer(void);
void connectPlayers(gameMaster *master, int serverSocket);
void getShipPositions(gameMaster *master);
void masterLoop(gameMaster *master, int orig_players);
int playersInGame(gameMaster *master);
char hitOrMiss(char *coordinates, char **shipPos);
int getHitPlayer(gameMaster *master, int y, int orig_players);
int getWinner(gameMaster *master);
void removePlayer(gameMaster *master, int player);
void checkForHits(gameMaster *master, int orig_players);

/*Host select function*/
char* reSelectHost(int dims, int* new_num_players, int orig_players);

/* Ship          Length
   
   Carrier         5
   Battleship      4
   Submarine       3
   Destroyer       3
   Patrol Boat     2
*/
