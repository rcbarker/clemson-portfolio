/* ECE4400 Final Project
 * File name: host.c
 * 
 * Content Description: Contains all game host code.
 *
 * NOTE/DISCLAIMER: 
 *       The functions in this file are MINIMALLY TESTED because 
 *       Ryan only had one machine to develop with and does not yet
 *       have access to the player loop code.
 *
 */

#include "battleship.h"

/* Sockets constants. */
#define PORT "3490"       // The port users will be connecting to.
#define BACKLOG 10	  // How many pending connections the queue will hold.
#define SIZE_CHAR 2      
#define SIZE_COORDINATE 3

/* Function Name: hostGame
 * Input:         dims       - Dimensions of square Battleship game board.
 *                numPlayers - Number of players in the Battleship game.
 * Return Value:  None.
 * Precondition:  This function is only called after a hit.
 * Purpose:       Creates a new battleship game host, connects it
 *                to each player in the game, and 
 */
void hostGame(int dims, int numPlayers, int orig_players)
{
    /* Inform users this machine is the host. */
    printf("This machine has been chosen to host the game.\n");

    /* Get a new gameMaster structure. */
    gameMaster *master = newMaster(dims, numPlayers);

    /* Get player's ship positions. */
    getShipPositions(master);

    /* Analyze initial board state to get each player's health. */
    checkForHits(master, orig_players);

    /* Start playing the Battleship game - Execute main loop. */
    masterLoop(master, orig_players);

    /* Game is over- Retrieve winner from Battleship game. */
    int winner = getWinner(master);
    if(winner == -1) 
    {
        /* Only one player left -> Print error. */
        fprintf(stderr,"FATAL GAME ERROR: No players left in the game.\n");
        fprintf(stderr,"The current machine is the winner by default.\n");
    }
    else 
    {
        /* Tell player they won. */
        send(master->playerSocket[winner], "W", SIZE_CHAR, 0);
    }

    /* Clean up gameMaster structure. */
    master = destructMaster(master);
}


/* Function Name: newMaster
 * Input:         dims       - Integer number of rows and columns on game board.
 *                numPlayers - Integer number of players in the game.
 * Return Value:  newMaster  - Initialized gameMaster structure.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Constructor function for the data structure used to 
 *                keep track of the game (Used by the game host).
 */ 
gameMaster *newMaster(int dims, int numPlayers)
{   
    /* Variables. */
    int i, j, serverSocket = -1;
    char **shipPos = (char **) malloc(dims*sizeof(char *));
    int *playerHealth = (int *) malloc(numPlayers * sizeof(int));
    int *playing = (int *) malloc(numPlayers * sizeof(int));
    int *playerSocket = (int *) malloc(numPlayers * sizeof(int));

    /* Initialize arrays. */
    for(i = 0; i < dims; i++)
    {
      shipPos[i] = (char *) malloc(dims*sizeof(char));

      for(j = 0; j < dims; j++)
      {
        shipPos[i][j] = ' ';
      }
    }

    for(i = 0; i < numPlayers; i++)
    {
      playerHealth[i] = MAX_HEALTH;
      playing[i] = TRUE;
    }

    /* Allocate and initialize new gameMaster. */
    gameMaster *newMaster = (gameMaster *) malloc(sizeof(gameMaster));
    newMaster->playing = playing;
    newMaster->boardSize = dims;
    newMaster->shipPos = shipPos;
    newMaster->numPlayers = numPlayers;
    newMaster->playerHealth = playerHealth;
    newMaster->playerSocket = playerSocket; 

    /* Start TCP/IP Server to connect players. */
    serverSocket = startTCPServer();

    /* Take connections for each player. */
    connectPlayers(newMaster, serverSocket); 
    close(serverSocket);

    return newMaster;
}

/* Function Name: destructMaster
 * Input:         master - The host's gameMaster structure.
 * Return Value:  NULL;
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Destructor function for the data structure used to 
 *                keep track of the game (Used by the game host).
 */ 
void *destructMaster(gameMaster *master)
{
    /* Variables. */
    int i;
 
    /* Free relevant variables. */
    free(master->playing);
    free(master->playerHealth);

    for(i=0; i<master->numPlayers; i++)
	close(master->playerSocket[i]);

    free(master->playerSocket);
 
    /* Free shipPos array. */
    for(i = 0; i < master->boardSize; ++i)
        free(master->shipPos[i]);
    free(master->shipPos);

    /* Free overall data structure. */
    free(master);

    return NULL;
}

/* Function Name: startTCPServer
 * Input:         None.
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Starts the TCP Socket Server used to connect the players
 *                to the game and returns the server's socket ID.
 */
int startTCPServer(void)
{
    /* Variables. */
    int serverSoc;
    struct addrinfo hints, *servinfo, *p;
    int yes = TRUE;
    int rv;

    /* Set up for socket */
    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE; // use the host's native IP.
	
    if ((rv = getaddrinfo(NULL, PORT, &hints, &servinfo)) != 0)
    {
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
		return 1;
    }

    /* Bind a new socket to the first IP device available. */
    for(p = servinfo; p != NULL; p = p->ai_next) 
    {
        if ((serverSoc = socket(p->ai_family, p->ai_socktype,
  			        p->ai_protocol)) == -1) 
        {
            perror("server: socket");
            continue;
        }
 
        if (setsockopt(serverSoc, SOL_SOCKET, SO_REUSEADDR, &yes,
	               sizeof(int)) == -1) 
        {
            perror("setsockopt");
            fprintf(stderr, "FATAL ERROR: Host server failed to start. The game is unplayable.\n");
	    exit(1);
        }

        if (bind(serverSoc, p->ai_addr, p->ai_addrlen) == -1) 
        {
	    close(serverSoc);
            perror("server: bind");
            continue;
        }

	break;
    }

    /* Release metadata. */
    freeaddrinfo(servinfo); 
 
    /* Error check. */
    if (p == NULL) 
    {
        fprintf(stderr, "FATAL ERROR: Host server failed to start. The game is unplayable.\n");
	exit(1);
    }

    /* Set server to listening mode. */
    if (listen(serverSoc, BACKLOG) == -1) 
    {
        perror("listen");
        fprintf(stderr, "FATAL ERROR: Host server failed to start. The game is unplayable.\n");
	exit(1);
    }

    return serverSoc;
}

/* Function Name: connectPlayers
 * Input:         master       - The host's gameMaster structure.
 *                serverSocket - The socket ID of the host's TCP/IP
 *                               connection socket server.
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Used to connect each player to the TCP/IP socket.
 */
void connectPlayers(gameMaster *master, int serverSocket)
{
    /* Variables. */
    int i, new_connection;
    struct sockaddr_storage their_addr; 
    socklen_t sin_size;
 
    for(i = 0; i < master->numPlayers; i++) 
    {
        /* Tell users what host is doing. */
        printf("Host is waiting for a connection from player %d...\n", i + 1);

        /* Wait for player connections. */
        sin_size = sizeof their_addr;
	new_connection = accept(serverSocket, (struct sockaddr *)&their_addr, &sin_size);
	
        /* Check if connection was successful. */
        if(new_connection >= 0)
        {
	    printf("Player %d connected!\n",i+1);													
            master->playerSocket[i] = new_connection;
            /* master->playing[i] already initialized to true. */
        } 
        else
        {
            /* Unsuccessful connection. */
	    printf("Player %d not connected\n",i+1);
            master->playerSocket[i] = -1;
            master->playing[i] = FALSE;
        }
    }
}

/* Function Name: getShipPositions 
 * Input:         master - The host's gameMaster structure.
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Used to get ship position information from each
 *                player once connections have been established.
 */
void getShipPositions(gameMaster *master)
{
    /* Variables. */
    int i, j, k, l, status = -1;

    /* Set up shipPos buffer. */
    //int size = master->boardSize*master->boardSize*sizeof(char);
    int buff_size = (master->boardSize*sizeof(char *)) + 
				(master->boardSize*master->boardSize*sizeof(char));
    uint8_t *memory = (uint8_t*) malloc(buff_size);
    char **shipPos = NULL;
    //uint8_t *origmem = memory;
    
    /* Ship initialization loop. */ 
    for(i = 0 ; i < master->numPlayers; ++i)
    {
        /* Tell player to send their ships to the host. */
        status = send(master->playerSocket[i], "G", SIZE_CHAR, 0);
        if(status < 0) removePlayer(master, i);
        else 
        {
            /* Get ship array from player. */
            status = recv(master->playerSocket[i], memory, buff_size, 0);

            shipPos = (char **) memory; //(char **) malloc(master->boardSize*sizeof(char *));
	    memory += master->boardSize*sizeof(char *);

	    for(l = 0; l < master->boardSize; ++l) 
	    {
		shipPos[l] = (char *) memory; //(char *) malloc(master->boardSize*sizeof(char));
		memory += master->boardSize * sizeof(char);
	    }

            if(status < 0) removePlayer(master, i);
            else 
            {
                /* Copy ships into master's record. */
                for(j = 0; j < master->boardSize; ++j) 
                {
                    for(k = 0; k < master->boardSize; ++k) 
                    {
                         /* If cell != ' ', a ship exists in this cell. */
                         if(shipPos[j][k] != ' ') 
                         master->shipPos[j][k] = shipPos[j][k];
                    }
                }
            }
        }
    }
}

/* Function Name: checkForHits 
 * Input:         master - The host's gameMaster structure.
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Used to determine each player's health before
 *                the game starts. If a player has no health,
 *                they are removed from the game without being
 *                told (since another host must have told them
 *                they lost already).
 */
void checkForHits(gameMaster *master, int orig_players)
{
    int x, y;
    int hitPlayer = -1;

    /* Index board. */
    for(y = 0; y < master->boardSize; ++y) 
    {
        for(x = 0; x < master->boardSize; ++x)
        {
            if(master->shipPos[y][x] == 'H')
            {
                /* Found a hit on the board. */
                /* Find hit player. */
                hitPlayer = getHitPlayer(master, x, orig_players);

                /* Update health. */
                master->playerHealth[hitPlayer]--;

                /* Check if player is out of game. */
                if(master->playerHealth[hitPlayer] == 0) 
                    master->playing[hitPlayer] = FALSE;

                /* Note no 'L' is sent here because the hit player.
                   Lost while someone else was hosting. */
            }
        }
    }
}
 
/* Function Name: masterLoop
 * Input:         master - The host's gameMaster structure.
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Main game master loop.
 *      
 *                Basic Idea:
 *                1. Loop though each player while game is ongoing. 
 *                   For each player that is still in the game:
 *                   a. Send them a "T" to indicate it is their turn.
 *                   b. Listen for their fire command. 
 *                   c. Send hit or miss back to firing player.
 *                   d. If firing player hit, update fired at player's 
 *                      health and check if they are still in the game.
 *                      If health == 0, kick fired player and send them
 *                      an "L" to indicate they lost.
 *                2. If any form of communication fails, the gameMaster
 *                   removes the player it is communicating with from the 
 *                   game and goes on to the next player's turn.
 */
void masterLoop(gameMaster *master, int orig_players)
{
    /* Variables. */
    int status = -1;
    int i, x, y, health, hitPlayer;
    char hit;
    char firingCoordinates[SIZE_COORDINATE];

    /* 3... 2... 1... Welcome to Battleship! */
    while(playersInGame(master)) 
    { 
        for(i = 0; i < master->numPlayers; ++i)
        {
            if(master->playing[i]) 
            {
                /* Inform player it is thier turn. */
                status = send(master->playerSocket[i], "T", SIZE_CHAR, 0);
	        if(status < 0) 
                { 
                    removePlayer(master, i);     
	            continue;
                }
                
                /* Listen for the player's move. */
	        status = recv(master->playerSocket[i], firingCoordinates, 4*sizeof(char), 0);
	        if(status < 0) 
                { 
                    removePlayer(master, i);     
	            continue;
                }
                
                /* Fire. Find out if player hit or miss. */
		hit = hitOrMiss(firingCoordinates, master->shipPos);
                /* Tell player what happened. */
                status = send(master->playerSocket[i], &hit, SIZE_CHAR, 0);
	        if(status < 0)
                { 
                    removePlayer(master, i);     
	            continue;
                }

                /* Hit or miss? */
	        if(hit != 'M') 
                {
                    /* Get coordinates. */
                    x = convertX(firingCoordinates);
                    y = convertY(firingCoordinates);

                    /* Figure out who was hit. */
	            hitPlayer = getHitPlayer(master, x, orig_players);

                    /* Update statistics. */
		    if(master->shipPos[y][x] != 'H') 
                        master->playerHealth[hitPlayer]--;
                    master->shipPos[y][x] = hit;
                    health = master->playerHealth[hitPlayer];

                    /* Check if hit player is still in the game. */
                    if(!health) 
                    {
                        /* Player lost. */
                        master->playing[hitPlayer] = FALSE;
                        send(master->playerSocket[hitPlayer], "L", SIZE_CHAR, 0);
                        removePlayer(master, hitPlayer);
                    }  
                }
            }
        }
    }
}  

/* Function Name: playersInGame
 * Input:         master - Game master structure.
 * Return Value:  TRUE if player with health in game.
 *                FALSE if everyone is dead (0 health).
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Checks if 2+ players are still in the game.
 */
int playersInGame(gameMaster *master)
{
    /* Variables. */
    int i, one_player = FALSE;

    for(i = 0; i < master->numPlayers; i++)
    {
        if(master->playing[i]) 
        {
            /* If one player flag set, one player has health.
             * So, if the flag is set, and this point is reached,
             * at least two players have health and the game must
             * go on.
             */
            if(one_player) return TRUE;
            else one_player = TRUE;
        }
    }

    /* Either one or no players at this point. */
    return FALSE;
}

/* Function Name: hitOrMiss
 * Input:         coordinates - The coordinates entered by the player's 'fire' command.
 *                shipPos     - The gameMaster's grid of player ships.
 * Return Value:  A space character on a miss or the letter representing the ship hit
 *                (B,C,D,S,P) on a miss.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Checks the gameMaster's structure to determine if the current player's
 *                fire command hit or missed.
 */
char hitOrMiss(char *coordinates, char **shipPos)
{
    /* Variables. */
    int xCoord = convertX(coordinates);
    int yCoord = convertY(coordinates);

    if(shipPos[yCoord][xCoord] == ' ' || shipPos[yCoord][xCoord] == 'H') return 'M';
    else return shipPos[yCoord][xCoord];
}

/* Function Name: getHitPlayer
 * Input:         master - gameMaster structure.
                  x      - x coordinate of hit.
 * Return Value:  None.
 * Precondition:  This function is only called after a hit.
 * Purpose:       Returns index for hit player.
 */
int getHitPlayer(gameMaster *master, int x, int orig_players)
{
    int i = 0;

    int windowsize = (master->boardSize) / orig_players;
    int upper, lower;

    for(i=1; i <= orig_players; i++)
    {
	upper = i*(windowsize);
	lower = upper-windowsize;

	if(lower <= x && x <= upper)
		break;
    }

    return i-1;
}

/* Function Name: getWinner
 * Input:         master - gameMaster structure.
 * Return Value:  None.
 * Precondition:  This function is only called after the game ends.
 * Purpose:       Checks for a winner in the game. Returns -1 if no winner.
 */
int getWinner(gameMaster *master) 
{
    /* Variables. */
    int i;

    for(i = 0; i < master->numPlayers; i++)
        if(master->playerHealth[i] != 0) return i;

    /* No one won - Everyone else quit. */
    return -1;
}

/* Function Name: removePlayer
 * Input:         master  - Game master structure.
 *                sockets - Array containing all communication sockets.
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Deletes a player from the game.
 */
void removePlayer(gameMaster *master, int player)
{
    /* Mark not playing. */
    master->playing[player] = FALSE;

    /* Close socket. */
    close(master->playerSocket[player]);    
}  
