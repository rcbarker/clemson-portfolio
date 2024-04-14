/* ECE4400 Final Project
 * File name: battleshipFuncs.c
 * 
 * Content Description: Contains all functions used by battleship.c.
 *
 */

#include "battleship.h"

/* Function Name: getCommand
 * Input:         rows - Integer number of rows on game board.
 *                cols - Integer number of columns on game board.
 * Return Value:  coordinates - If command is fire, returns a string
 *                              containing the board coordinate fired
 *								at. Otherwise, this return value is 
 *								NULL.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Prompts the user for a command, error checks their input,
 *                and executes the appropriate auxiliary function for each
 *                command where applicable.
 *
 *                List of commands (Case Sensitive):
 *                - 'fire [X][Y]': Fires a round at board position XY. This command ends a player's turn. 
 *                - 'grid':        Prints the player's current record of hits/misses.
 *                - 'quit':        Causes the player to leave the game.
 */
char *getCommand(int rows, int cols, char **shipPos, int player)
{
    char input[20];

    printf("Player %d please input your command(input \"help\" for a list of valid commands):\n", player+1);
    fgets(input, 20, stdin);

    int stringSize = strlen(input);
    input[stringSize-1] = '\0';

    char *command = strtok(input, " ");
    char *tempCoordinates = strtok(NULL, " ");

    char *coordinates = NULL; 

    if(tempCoordinates != NULL)
    {
        coordinates = (char *)malloc(4 * sizeof(char));
        strcpy(coordinates, tempCoordinates);
    }
    else if(strcmp("grid", command) == 0)
    {
        printBoard(rows, cols, shipPos);
    }
    else if(strcmp("quit", command) == 0)
    {
        printf("Quitting game\n");
    }
    else if(strcmp("help", command) == 0)
    {
      coordinates = NULL;
      printf("Valid Commands:\n");
      printf("1) \"fire XY\" where X = the letter of the column and Y = the number of the row you would like to fire on\n");
      printf("2) \"grid\" - prints a grid showing your ship positions and results of fire commands\n");
      printf("3) \"quit\" - quit the game\n\n");
    }
    else 
    {
        printf("Command not recognized\n");
    }

    return coordinates;
}






/* Function Name: printBoard
 * Input:         rows    - Integer amount of rows on board.
 *                cols    - Integer amount of columns on board.
 *                shipPos - Pointer to 2x2 data structure array
 *                          containing player's ship positions. 
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Takes the information in shipPos and uses it to 
 *                pretty-print the player's current game board.
 */
void printBoard(int rows, int cols, char **shipPos)
{

  int i = 0, k = 0;
  char alphabet[26] = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};

  /* Print the row of letters for indexing the columns during the game. */
  printf("      %c", alphabet[0]);

  for(k = 1; k < cols; k++)
  {
       printf("    %c", alphabet[k]);
  }

  printf("\n");

  /* Begin printing the grid. */
  for(i = 0; i < rows; i++)
  {
  	 /* Only execute this the first time through the loop to */
     /* event double +~ row printing. */
     if(i == 0)
     {
        printf("    +");
        for(k = 0; k < cols; k++)
        {
           printf("~~~~+");
        }
     }
       
     /* Use different spacing for rows indexes with less than two digits. */  
     if(i < 9) printf("\n %d  |", i+1);
     else printf("\n%d  |", i+1);

     for(k = 0; k < rows; k++)
     {
           printf(" %c  |", shipPos[i][k]);
     }
       
     printf("\n    +");
     for(k = 0; k < cols; k++)
     {
        printf("~~~~+");
     }
  }

  printf("\n");

  return;
}




/* Function Name: newPlayer
 * Input:         rows       - Integer number of rows on game board.
 *                cols       - Integer number of columns on game board.
 * Return Value:  newPlayer  - Initialized new player structure.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Constructor function for the data structure used by
 *                each player to keep track of data that is local to
 *                them.
 */
player *newPlayer(int rows, int cols)
{
  int i, j;

  char **targetingGrid = (char **) malloc(rows*sizeof(char *));

  for(i = 0; i < rows; i++)
  {
      targetingGrid[i] = (char *) malloc(cols*sizeof(char));

      for(j = 0; j < cols; j++)
      {
        targetingGrid[i][j] = ' ';
      }
  }

  player *newPlayer = (player *) malloc(sizeof(player));
  newPlayer->targetingGrid = targetingGrid;
  newPlayer->numShips = 5;

  return newPlayer;
}




/* Function Name: placeShips
 * Input:         targetingGrid - Targeting Grid for player that is placing ships 
                  shipPos       - Game master's ship position data structure.
 *                numPlayers    - Integer number of players.
 *                player        - Integer representing current player placing ships.
 * Return Value:  None.
 * Precondition:  Places ships and error checks for valid positions for player 'player'.
 */
void placeShips(char **targetingGrid, char **shipPos, int numPlayers, int player)
{
  char buffer[5];
  int windowSize = 0;
  int maxY = 0;

  
  player++;

  if(numPlayers == 2)
  {
      windowSize = 9;
      maxY = 18;
  } 
  else if(numPlayers == 3)
  {
      windowSize = 7;
      maxY = 21;
  }
  else 
  {
      windowSize = 6;
      maxY = 24;
  }



  int upperLimit = player * windowSize;
  int lowerLimit = upperLimit - windowSize;
  char *columnStart = reverseCoords(lowerLimit, 1);
  char *columnEnd = reverseCoords(upperLimit-1, 1);

  int xStart = -1, yStart = -1, xEnd = -1, yEnd = -1;

  printBoard(maxY, maxY, targetingGrid);
  printf("Your section of the sea is from %c to %c\n", columnStart[0], columnEnd[0]);
  //Place Carrier
  do
  {
      printf("Player %d please input the starting coordinate for your carrier\n", player);
      fgets(buffer, 5, stdin);
  }while(checkShipStart(lowerLimit, upperLimit, shipPos, buffer, maxY) != 1);

  xStart = convertX(buffer);
  yStart = convertY(buffer);
    
  char *end = getShipEnd(LENGTH_CARRIER, lowerLimit, upperLimit, shipPos, maxY, xStart, yStart);

  xEnd = convertX(end);
  yEnd = convertY(end);
  fillGrid(targetingGrid, shipPos, xStart, xEnd, yStart, yEnd, 'C');
  printBoard(maxY, maxY, targetingGrid);


  //Place Battleship
  do
  {
      printf("Player %d please input the starting coordinate for your battleship\n", player);
      fgets(buffer, 5, stdin);
  }while(checkShipStart(lowerLimit, upperLimit, shipPos, buffer, maxY) != 1);

  xStart = convertX(buffer);
  yStart = convertY(buffer);
    
  end = getShipEnd(LENGTH_BATTLESHIP, lowerLimit, upperLimit, shipPos, maxY, xStart, yStart);

  xEnd = convertX(end);
  yEnd = convertY(end);
  fillGrid(targetingGrid, shipPos, xStart, xEnd, yStart, yEnd, 'B');
  printBoard(maxY, maxY, targetingGrid);


  //Place Submarine
  do
  {
      printf("Player %d please input the starting coordinate for your submarine\n", player);
      fgets(buffer, 5, stdin);
  }while(checkShipStart(lowerLimit, upperLimit, shipPos, buffer, maxY) != 1);

  xStart = convertX(buffer);
  yStart = convertY(buffer);
    
  end = getShipEnd(LENGTH_SUBMARINE, lowerLimit, upperLimit, shipPos, maxY, xStart, yStart);

  xEnd = convertX(end);
  yEnd = convertY(end);
  fillGrid(targetingGrid, shipPos, xStart, xEnd, yStart, yEnd, 'S');
  printBoard(maxY, maxY, targetingGrid);


  //Place Destroyer
  do
  {
      printf("Player %d please input the starting coordinate for your destroyer\n", player);
      fgets(buffer, 5, stdin);
  }while(checkShipStart(lowerLimit, upperLimit, shipPos, buffer, maxY) != 1);

  xStart = convertX(buffer);
  yStart = convertY(buffer);
    
  end = getShipEnd(LENGTH_DESTROYER, lowerLimit, upperLimit, shipPos, maxY, xStart, yStart);

  xEnd = convertX(end);
  yEnd = convertY(end);
  fillGrid(targetingGrid, shipPos, xStart, xEnd, yStart, yEnd, 'D');
  printBoard(maxY, maxY, targetingGrid);


  //Place Patrol Boat
  do
  {
      printf("Player %d please input the starting coordinate for your patrol boat\n", player);
      fgets(buffer, 5, stdin);
  }while(checkShipStart(lowerLimit, upperLimit, shipPos, buffer, maxY) != 1);

  xStart = convertX(buffer);
  yStart = convertY(buffer);
    
  end = getShipEnd(LENGTH_PATROL, lowerLimit, upperLimit, shipPos, maxY, xStart, yStart);

  xEnd = convertX(end);
  yEnd = convertY(end);
  fillGrid(targetingGrid, shipPos, xStart, xEnd, yStart, yEnd, 'P');
  printBoard(maxY, maxY, targetingGrid);

  return;
}




/* Function Name: checkShipStart
 * Input:         lowerLimit - Lower limit of player's placement area.
 *                upperLimit - Upper limit of player's placement area.
 *                shipPos    - GameMaster's record of ship placements.
 *                input      - Desired start position.
 *                maxY       - Largest Y position of game board.
 * Return Value:  TRUE if valid position. FALSE if invalid.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Error checks a ship's start position.
 */
int checkShipStart(int lowerLimit, int upperLimit, char **shipPos, char *input, int maxY)
{
  int x = convertX(input);
  int y = convertY(input);

    //x and y must be within the part of the grid designated for the player
  if(x >= lowerLimit && x < upperLimit && y >= 0 && y < maxY && shipPos[y][x] == ' ') return TRUE;
  else
  {
    printf("Invalid Coordinate!\n");
      return FALSE;
  }
}




/* Function Name: checkShipEnd
 * Input:         shipSize   - Length of current ship.
 *                lowerLimit - Lower limit of player's placement area.
 *                upperLimit - Upper limit of player's placement area.
 *                shipPos    - GameMaster's record of ship placements.
 *                input      - Desired start position.
 *                maxY       - Largest Y position of game board.
 *                xStart     - Starting X position of player's board area.
 *                yStart     - Starting Y position of player's board area.
 * Return Value:  TRUE if valid position. FALSE if invalid.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Error checks a ship's end position.
 */
char *getShipEnd(int shipSize, int lowerLimit, int upperLimit, char **shipPos, int maxY, int xStart, int yStart)
{
    int x = -1;
    int y = -1;

    char *input = (char *) malloc(5*sizeof(char));

    //Calculate all valid end points for given start coordinate
    int EndX1 = xStart + shipSize - 1;
    int EndX2 = xStart - shipSize + 1;
    int EndY1 = yStart + shipSize - 1;
    int EndY2 = yStart - shipSize + 1;

    int possibles[] = {EndX1, EndX2, EndY1, EndY2};
    int i;


    for(i = 0; i < 4; i++)
    {
        if(i < 2)
        {
            if(!checkLimits(possibles[i], yStart, lowerLimit, upperLimit, maxY) || !checkBlank(xStart, yStart, possibles[i], yStart, shipPos))
            {
                possibles[i] = -1;
            }
        }
        else
        {
            if(!checkLimits(xStart, possibles[i], lowerLimit, upperLimit, maxY) || !checkBlank(xStart, yStart, xStart, possibles[i], shipPos))
            {
                possibles[i] = -1;
            }
        }
    }
    
    printf("Select an end coordinate from the list below:\n");

    for(i = 0; i < 4; i++)
    {
        if(possibles[i] != -1)
        {
            if(i < 2) printf("%s ", reverseCoords(possibles[i], yStart));
            else printf("%s ", reverseCoords(xStart, possibles[i]));
        }
    }
    printf("\n");

    fgets(input, 5, stdin);
    x = convertX(input);
    y = convertY(input);

    while(!((x == xStart && (y == possibles[2] || y == possibles[3])) || (y == yStart && (x == possibles[0] || x == possibles[1])))) 
    {
        printf("Invalid! Please choose a coordinate from the list\n");
        fgets(input, 5, stdin);
        x = convertX(input);
        y = convertY(input);
    }

    return input;
}




/* Function Name: fillGrid
 * Input:         shipPos    - GameMaster's record of ship placements.
 *                xStart     - Starting X position of player's board area.
 *                xEnd       - Ending X position of player's board area.
 *                yStart     - Starting Y position of player's board area.
 *                yEnd       - Ending Y position of player's board area.
 *                fill       - Character to place on board.
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Populates GameMaster's board.
 */
void fillGrid(char **targetingGrid, char **shipPos, int xStart, int xEnd, int yStart, int yEnd, char fill)
{
  int i = 0;
  if(xEnd == xStart)
    {
      if(yEnd > yStart)
      {
        for(i = yStart; i <= yEnd; i++)
        {
          shipPos[i][xStart] = fill;
          targetingGrid[i][xStart] = fill;
        }
      }
        else
        {
          for(i = yStart; i >= yEnd; i--)
          {
            shipPos[i][xStart] = fill;
            targetingGrid[i][xStart] = fill;
          }
        }
    }
    else
    {
      if(xEnd > xStart)
      {
        for(i = xStart; i <= xEnd; i++)
        {
          shipPos[yStart][i] = fill;
          targetingGrid[yStart][i] = fill;
        }
      }
        else
        {
          for(i = xStart; i >= xEnd; i--)
          {
            shipPos[yStart][i] = fill;
            targetingGrid[yStart][i] = fill;
          }
        }
    }
}




/* Function Name: convertX
 * Input:         input - X coordinate of 'fire' command.
 * Return Value:  Integer equivalent of X coordinate.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Converts user input to integer index of game board.
 */
int convertX(char *input)
{
  return input[0] - 'A';
}




/* Function Name: convertY
 * Input:         input - Y coordinate of 'fire' command.
 * Return Value:  Integer equivalent of Y coordinate.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Converts user input to integer index of game board.
 */
int convertY(char *input)
{
  int firstDigit = input[1] - '0';
  int secondDigit = input[2] - '0';
    
  if(secondDigit < 0 || secondDigit > 9) return firstDigit - 1;
  else if(firstDigit == 1) return 9 + secondDigit;
  else return 19 + secondDigit;
}




/* Function Name: reverseCoords
 * Input:         x - X coordinate of 'fire' command.
                  y - Y coordinate of 'fire' command.
 * Return Value:  String equivalent of the integer X and Y coordinates.
 * Precondition:  This function is used with battleshipFuncs.c.
 * Purpose:       Converts integer indexes of game board back to string form.
 */
char *reverseCoords(int x, int y)
{
   char X = x + 'A';
   char *string = NULL;

   if(y < 10)
   {
       string = (char *) malloc(3*sizeof(char));
       string[1] = y + '0' + 1;
       string[2] = '\0';
   }
   else if(y < 20)
   {
       string = (char *) malloc(4*sizeof(char));
       string[1] = '1';
       string[2] = (y-10) + '0' + 1;
       string[3] = '\0';
   }
   else
   {
       string = (char *) malloc(4*sizeof(char));
       string[1] = '2';
       string[2] = (y-20) + '0' + 1;
       string[3] = '\0';
   }

   string[0] = X;

   return string;
}




/* Function Name: executeTurn
 * Input:         master     - gameMaster structure.
 *                players    - Array of all players in the game.
 *                player_num - Player whose turn it is. 
 *                dims       - Dimension of square game board.                  
 * Return Value:  None.
 * Precondition:  This function is used with battleship.c.
 * Purpose:       Executes a player's turn.
 * 
 *                Use as a basis for the player loop, but it will require heavy
 *                modification and complete removal of the gameMaster structure.
 *   
 *                See commands.txt and host.c to aid in player loop development.

void executeTurn(gameMaster *master, player **players, int playerNum, int dims)
{
  int x, y;
  int hitPlayer = -1;
  char *firingCoordinates = NULL;
 */
  /* Base case - If a player has no health, they don't get a turn. 
  if(!master->playerHealth[playerNum]) return;

  while(firingCoordinates == NULL)
  { 
     firingCoordinates = getCommand(dims, dims, players[playerNum]->targetingGrid, playerNum);
  }
            
  x = convertX(firingCoordinates);
  y = convertY(firingCoordinates);

  if(hitOrMiss(firingCoordinates, master->shipPos) != ' ')
  {
    printf("Hit!\n");
    hitPlayer = getHitPlayer(master, x);
    master->playerHealth[hitPlayer]--;
    players[playerNum]->targetingGrid[y][x] = 'H';
  }
  else
  {
    printf("Miss!\n");
    players[playerNum]->targetingGrid[y][x] = 'm';
  }
} */

int checkBlank(int xStart, int yStart, int xEnd, int yEnd, char **shipPos)
{
    int i;

    if(xEnd == xStart)
    {
      if(yEnd > yStart)
      {
        for(i = yStart; i <= yEnd; i++)
        {
          if(shipPos[i][xEnd] != ' ') return FALSE;
        }
      }
      else
      {
        for(i = yStart; i >= yEnd; i--)
        {
          if(shipPos[i][xEnd] != ' ') return FALSE;
        }
      }
    }
    else
    {
      if(xEnd > xStart)
      {
        for(i = xStart; i <= xEnd; i++)
        {
          if(shipPos[yEnd][i] != ' ') return FALSE;
        }
      }
      else
      {
        for(i = xStart; i >= xEnd; i--)
        {
          if(shipPos[yEnd][i] != ' ') return FALSE;
        }
      }
    }

    return TRUE;
}

int checkLimits(int x, int y, int lowerLimit, int upperLimit, int maxY)
{
   if(x < lowerLimit || x >= upperLimit || y < 0 || y >= maxY) return FALSE;
   else return TRUE;
}
