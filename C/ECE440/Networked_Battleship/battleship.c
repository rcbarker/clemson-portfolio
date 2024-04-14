//Top Level Battleship Game

#include "battleship.h"

int main(void)
{
    char buffer[3];
    int dims = 0;
    int i = 0;

	printf("Welcome to Battleship!\n");
    printf("Grid Sizes:\n");
    printf("2 Players - 18x18\n3 Players - 21x21\n4 Players - 24x24\n");

	printf("Please input the number of players\n");

    fgets(buffer, 3, stdin);

    //will be used in networked version of the game 
    int numPlayers = buffer[0] - '0';

    if(numPlayers == 2) dims = 18;
    else if(numPlayers == 3) dims = 21;
    else dims = 24;

    gameMaster *master = newMaster(dims, numPlayers);

    //Change for network version
    player **players = malloc(numPlayers*sizeof(player));

    for(i = 0; i < numPlayers; i++)
    {
        players[i] = newPlayer(dims, dims);
    	placeShips(players[i]->targetingGrid, master->shipPos, numPlayers, i);
    }

    /* Play game. */
    while(playersInGame(master))
    {
        for(i = 0; i < numPlayers; i++) 
            executeTurn(master, players, i, dims);
    }
  
    /* Get winner. */
    int winner = getWinner(master);
    if(winner != -1) printf("Player %d Wins!\n", winner);
    else printf("All other players quit.\n");

    return 0;
}
