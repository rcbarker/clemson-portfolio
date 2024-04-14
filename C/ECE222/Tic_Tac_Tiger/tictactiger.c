// Program's name:  tictactiger.c
// Author's Name:   Ryan Barker
// Course:          ECE 222
// Date:            01 - 16 - 2014
// Purpose:         Basic tic-tac-toe program that allows users
//                  to quit at any moment and allows re-playability. 
//                  Only supports a 3x3 board.
 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Global constant for number of rows and columns in board */
const int BOARD_SIZE = 3;

/* Function Prototypes */
void Print_board(char board[BOARD_SIZE][BOARD_SIZE]);
int P1_Turn(char board[BOARD_SIZE][BOARD_SIZE]);
int P2_Turn(char board[BOARD_SIZE][BOARD_SIZE]);
int Check_Win(char board[BOARD_SIZE][BOARD_SIZE], char symbol);
void Reset_Board(char board[BOARD_SIZE][BOARD_SIZE]);

int main(void)
{
     /* Initialize an array (board) for tracking each game */
     char board[3][3] = {{'1','2','3'},{'4','5','6'},{'7','8','9'}};
     
     /* Index for tracking move # during game */
     int movenum = 1;

     /* Boolean variables to determine if a player won (1 = Win, 0 = No Win) */
     int C_win = 0;
     int U_win = 0;

     /* Boolean variables to determine if player has quit (1 = Quit, 0 = Game
        Continues) */
     int C_quit = 0;
     int U_quit = 0;

     /* Variable for replaying game (Assume replay on first round) */
     char replay[] = "Y";

     /* Master loop for replaying the game */
     while (!strcmp(replay, "Y"))
     {
          /* Print Board */
          Print_board(board);
          
          /* Start game */
          while (movenum <= BOARD_SIZE*BOARD_SIZE && !C_win && !U_win
                 && !C_quit && !U_quit)
          {
               /* Check to determine turn */
               if (movenum % 2 == 1)
               {
                    /* Execute player 1 turn */ 
                    C_quit = P1_Turn(board);
                    
                    if (!C_quit)
                    {
                         /* Print updated board */
                         Print_board(board);
                    }
               }
               else
               {
                    /* Execute player 2 turn */
                    U_quit = P2_Turn(board);
                     
                    if (!U_quit)
                    {
                         /* Print updated board */
                         Print_board(board);
                    }
               }

               /* Check to see if either player won */
               C_win = Check_Win(board, 'C');
               U_win = Check_Win(board, 'U');

               /* Increment move number */
               movenum++;
          }

          /* Game is finished - Display end-game output if either player won
             or one quit */
          if (C_win)
          {
               printf("\n\nPlayer 'C' wins!\n\n");
          }
          else if (U_win)
          {
               printf("\n\nPlayer 'U' wins!\n\n");
          }
          else if (!U_quit && !C_quit)
          {
               printf("\n\nGame ended in a draw.\n\n");
          }

          /* Reset board, move_num, C_quit/U_quit, and C_win/U_win in case of new game */
          Reset_Board(board);
          movenum = 1;
          C_quit = 0;
          U_quit = 0;
          C_win = 0;
          U_win = 0;

          /* Check if players would like to replay */
          printf("\nDo you wish to play again? (Enter 'Y' or 'N'): ");
          scanf("%s", replay);

          /* Verify user entered 'Y' or 'N' */
          while (strcmp(replay, "Y") && strcmp(replay, "N"))
          {
               printf("\n%s is not a valid input! Enter 'Y' or 'N': ", replay);
               scanf(" %s", replay);
          }
     }

     return 0;
}

//
// Function name: Print_board
// Inputs: board, the 3x3 board array containing game data.
// Purpose: This function prints the board array in the format specified by
//          the assignment rubric.
//
void Print_board(char board[BOARD_SIZE][BOARD_SIZE])
{
     /* Counters for initialization */
     int r, c;

     /* Print board */
     printf("\n-------------\n"); // Top Boundary

     for (r = 0; r < BOARD_SIZE; r++)
     {
          printf("|");

          for (c = 0; c < BOARD_SIZE; c++)
          {
               printf(" %c |", board[r][c]);
          }

          printf("\n-------------\n");
     }
}

//
// Function name: P1_Turn
// Inputs:        board, the 3x3 board array containing game data.
// Purpose:       This function executes everything to do with Player 1's Turn.
// Returns:       quit, whether Player 1 quit or not (1 = Quit, 0 = Game Continues).
//
int P1_Turn(char board[BOARD_SIZE][BOARD_SIZE])
{
     /* Placeholder for move */
     char move[] = "1";

     /* Indexes for placing moves on board */
     int row, col; 

     /* Index for repeating process if nessecary. Assumes not valid */
     int isvalid = 0;

     /* Index for verifying entry selected was found. Assumes not found */
     int found = 0;

     /* Boolean index to determine if player quit. Assume no quit initially */
     int quit = 0;

     /* Loop that repeats process if some form of invalid input */
     while (!isvalid)
     {
          /* Prompt Player 1 and read in input */
          printf("\nPlayer 'C' enter a square: ");
          scanf("%s", move);

          /* Assume entry is good */
          isvalid = 1;


          /* Check to see if Player 1 quit and exit if so */
          if (!strcmp(move, "q"))
          {
               /* Display message that player 'C' quit */ 
               printf("\nPlayer 'C' quits!\n");

               /* Set quit index */
               quit = 1;
          }

          /* Check for invalid inputs */
          if (!quit && (atoi(move) < 1 || atoi(move) > 9))
          {
               /* Reset isvalid to 0 because of invalid entry */
               isvalid = 0;

               /* Display error and read in next input */
               printf("\n'%s' is an invalid input!", move);
               printf(" Please enter 1-9 or 'q' to quit.\n");
          }

          if(isvalid) {
              /* Nested for loop to place move on board if user did not quit */
              for (row = 0; row < BOARD_SIZE; row++)
              {
                  for (col = 0; col < BOARD_SIZE; col++)
                  { 
                      if (move[0] == board[row][col])
                      {
                          board[row][col] = 'C';
                          found = 1;
                      }
                  }
              }

              /* Loop to check if entry was found and replaced or not. If not, 
                 display that spot was taken */
              if (found == 0 && !quit)
              {
                  /* Mark isvalid to 0 because of invalid entry */
                  isvalid = 0;

                  /* Display error message */
                  printf("\nThe spot on the board you have chosen is already");
                  printf(" taken.\n\nPlease choose another spot.\n");
              }
         }
     }

     return quit;
}

//
// Function name: P1_Turn
// Inputs:        board, the 3x3 board array containing game data.
// Purpose:       This function executes everything to do with Player 2's Turn.
// Returns:       quit, whether Player 2 quit or not (1 = Quit, 0 = Game Continues).
//
int P2_Turn(char board[BOARD_SIZE][BOARD_SIZE])
{
     /* Placeholder for move */
     char move[] = "1";

     /* Indexes for placing moves on board */
     int row, col; 

     /* Index for repeating process if nessecary. Assumes not valid */
     int isvalid = 0;

     /* Index for verifying entry selected was found. Assumes not found */
     int found = 0;

     /* Boolean index to determine if player quit. Assume no quit initially */
     int quit = 0;

     /* Loop that repeats process if some form of invalid input */
     while (!isvalid)
     {
          /* Prompt Player 2 and read in input */
          printf("\nPlayer 'U' enter a square: ");
          scanf("%s", move);

          /* Assume entry is good */
          isvalid = 1;

          /* Check to see if Player 1 quit and exit if so */
          if (!strcmp(move, "q"))
          {
               /* Display message that player 'C' quit */
               printf("\nPlayer 'U' quits!\n");

               /* Set quit index */
               quit = 1;
          }

          /* Check for invalid inputs */
          if (!quit && (atoi(move) < 1 || atoi(move) > 9))
          {
               /* Reset isvalid to 0 because of invalid entry */
               isvalid = 0;

               /* Display error and read in next input */
               printf("\n'%s' is an invalid input!", move);
               printf(" Please enter 1-9 or 'q' to quit.\n");
          }

          if(isvalid) {
              /* Nested for loop to place move on board if user did not quit */
              for (row = 0; row < BOARD_SIZE; row++)
              {
                  for (col = 0; col < BOARD_SIZE; col++)
                  { 
                      if (move[0] == board[row][col])
                      {
                          board[row][col] = 'U';
                          found = 1;
                      }
                  }
              }

              /* Loop to check if entry was found and replaced or not. If not, 
                 display that spot was taken */
              if (found == 0 && !quit)
              {
                  /* Mark isvalid to 0 because of invalid entry */
                  isvalid = 0;

                  /* Display error message */
                  printf("\nThe spot on the board you have chosen is already");
                  printf(" taken.\n\nPlease choose another spot.\n");
              }
         }
     }

     return quit;
}

//
// Function name: Check_Win
// Inputs:        board, the 3x3 board array containing game data and symbol,
//                the character that the current player places on the board.
// Purpose:       This function checks for a win in the Tic Tac Tiger game with
//                the symbol specified.
// Returns:       win, whether the player won or not (1 = Win, 0 = Game Continues).
//
int Check_Win(char board[BOARD_SIZE][BOARD_SIZE], char symbol)
{
     /* Boolean variable to represent win/no win (Assume no initial win) */
     int win = 0;
  
     /* Check horizontally */
     if (board[0][0] == symbol && board[0][0] == board[0][1] 
         && board[0][1] == board[0][2])
     {
          win = 1;
     }
     else if (board[1][0] == symbol && board[1][0] == board[1][1]
              && board[1][1] == board[1][2])
     {
          win = 1;
     }
     else if (board[2][0] == symbol && board[2][0] == board[2][1]
              && board[2][1] == board[2][2])
     {
          win = 1;
     }

     /* Check vertically */
     if (board[0][0] == symbol && board[0][0] == board[1][0]
         && board[1][0] == board[2][0])
     {
          win = 1;
     }
     else if (board[0][1] == symbol && board[0][1] == board[1][1]
              && board[1][1] == board[2][1])
     {
          win = 1;
     }
     else if (board[0][2] == symbol && board[0][2] == board[1][2]
              && board[1][2] == board[2][2])
     {
          win = 1;
     }

     /* Check Diagonals */
     if (board[0][0] == symbol && board[0][0] == board[1][1]
         && board[1][1] == board[2][2])
     {
          win = 1;
     }
     else if (board[0][2] == symbol && board[0][2] == board[1][1]
              && board[1][1] == board[2][0])
     {
          win = 1;
     }
    
     return win;     
}

//
// Function name: Reset_Board
// Inputs:        board, the 3x3 board array containing game data.
// Purpose:       This function resets the board back to its original state.
// 
void Reset_Board(char board[BOARD_SIZE][BOARD_SIZE])
{
     board[0][0] = '1';
     board[0][1] = '2';
     board[0][2] = '3';
     board[1][0] = '4';
     board[1][1] = '5';
     board[1][2] = '6';
     board[2][0] = '7';
     board[2][1] = '8';
     board[2][2] = '9';
}
