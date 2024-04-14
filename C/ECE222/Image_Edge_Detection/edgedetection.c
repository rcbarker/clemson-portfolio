// Program's name:  edgedetection.c (Image Pixel Modifier - Magic Message Finder)
// Author's Name:   Ryan Barker
// Course:          ECE 222
// Date:            04-09-2014
// Purpose:         Program that takes an input image and performs edge detection to display
//                  a hidden message in the file.

// Libraries:
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char *argv[]) 
{    /* Declare local structures */
     struct HEADER
     {    unsigned short int Type; // Magic identifier
          unsigned int Size;       // File size in bytes
          unsigned short int Reserved1, Reserved2;
          unsigned int Offset;     // Offset to data (in B)
     } Header;                     // Total Size = 14 Bytes

     struct INFOHEADER
     {    unsigned int Size;             // Header size in bytes
          int Width, Height;             // Width / Height of image
          unsigned short int Planes;     // Number of colour planes
          unsigned short int Bits;       // Bits per pixel
          unsigned int Compression;      // Compression type
          unsigned int ImageSize;        // Image size in bytes
          int xResolution, yResolution;  // Pixels per meter
          unsigned int Colors;           // Number of colors
          unsigned int ImportantColors;  // Important colors
     } InfoHeader;                       // Total Size = 40 Bytes           

     struct PIXEL
     { unsigned char Red, Green, Blue;
     };

     /* Declare variables */
     FILE *INFILE, *OUTFILE;
     struct PIXEL **Pixels_In;
     struct PIXEL **Pixels_Out;
     int pix_row, pix_col;
     int index1, index2;
     char Matrix[3][3] =
     { { 0, -1, 0 },
       { -1, 4, -1 },
       { 0, -1, 0 }
     };

     /* Verify program was executed correctly */
     if (argc != 3)
     {    /* Check number of arguments */
          printf("\nError: Please execute program with an input and output file name in the ");
          printf("format:\n./edgedetection [input].bmp [output].bmp\n\n");

          exit(0);
     }
     else if (strcmp(argv[1], argv[2]) == 0)
     {    /* Verify input and output file names are different */
          printf("\nError: Input and Output file names are the same. Please specify ");
          printf("different file names.\n\n");

          exit(0);
     }
     else if (strstr(argv[1], ".bmp") == 0)
     {    /* Verify input file is a .bmp file */
          printf("\nError: Input file is not a .bmp file... Please input a .bmp file.\n\n");

          exit(0);
     }

     /* Open input file for reading and output file for eventual writing */
     INFILE = fopen(argv[1], "r"); 
     OUTFILE = fopen(argv[2], "w");

     /* Validate file opened correctly */
     if (INFILE == NULL)
     {    printf("\nError opening input file. Please be sure it is saved in the same directory ");
          printf(" as this program.\n\n");

          exit(0);
     }

     if (OUTFILE == NULL)
     {    printf("Error creating output file. Please ensure sufficient space ");
          printf("on this machine.\n\n");

          exit(0);
     }

     /* Read in header data */
     fread(&Header.Type, 2, 1, INFILE);
     fread(&Header.Size, 4, 1, INFILE);
     fread(&Header.Reserved1, 2, 1, INFILE);
     fread(&Header.Reserved2, 2, 1, INFILE);
     fread(&Header.Offset, 4, 1, INFILE);

     /* Read in infoheader data */
     fread(&InfoHeader.Size, 4, 1, INFILE);
     fread(&InfoHeader.Width, 4, 1, INFILE);
     fread(&InfoHeader.Height, 4, 1, INFILE);
     fread(&InfoHeader.Planes, 2, 1 , INFILE);
     fread(&InfoHeader.Bits, 2, 1, INFILE);
     fread(&InfoHeader.Compression, 4, 1, INFILE);
     fread(&InfoHeader.ImageSize, 4, 1, INFILE);
     fread(&InfoHeader.xResolution, 4, 1, INFILE);
     fread(&InfoHeader.yResolution, 4, 1, INFILE);
     fread(&InfoHeader.Colors, 4, 1, INFILE);
     fread(&InfoHeader.ImportantColors, 4, 1, INFILE);

     /* Malloc space for pixel input */
     Pixels_In = (struct PIXEL **) malloc((InfoHeader.Height * sizeof(struct PIXEL *)));

     for (pix_row = 0; pix_row < InfoHeader.Height; pix_row++)
     {    Pixels_In[pix_row] = (struct PIXEL *) malloc((InfoHeader.Width * sizeof(struct PIXEL)));
     }

     /* Store pixel data into input array */
     for (pix_row = 0; pix_row < InfoHeader.Height; pix_row++)
     {    for (pix_col = 0; pix_col < InfoHeader.Width; pix_col++)
          {    fread(&Pixels_In[pix_row][pix_col], 3, 1, INFILE);
          }
     }

     /* Malloc space for output pixel array */
     Pixels_Out = (struct PIXEL **) malloc((InfoHeader.Height * sizeof(struct PIXEL *)));

     /* Note - Calloc is used below for later edge detection calculations */
     for (pix_row = 0; pix_row < InfoHeader.Height; pix_row++)
     {    Pixels_Out[pix_row] = (struct PIXEL *) calloc(InfoHeader.Width, sizeof(struct PIXEL));
     }

     /* Initiate Edge Detection */
     for (pix_row = 0; pix_row < InfoHeader.Height; pix_row++)
     {    for (pix_col = 0; pix_col < InfoHeader.Width; pix_col++)
          {    /* Note - The below loops are included to simplify indexing through 
                  the conversion matrix */
               for (index1 = -1; index1 < 2; index1++)
               {    for (index2 = -1; index2 < 2; index2++)
                    {    if (&(*(*(Pixels_In + pix_row + index1) + pix_col + index2))
                              >= &Pixels_In[0][0] && &(*(*(Pixels_In + pix_row + index1) 
                              + pix_col + index2)) <= 
                              &Pixels_In[InfoHeader.Height - 1][InfoHeader.Width - 1])
                         {
                              ((*(Pixels_Out + pix_row) + pix_col)->Red) += 
                                   (((*(Pixels_In + pix_row + index1) + pix_col + index2)->Red) 
                                        * (Matrix[index1+1][index2+1]));
                              ((*(Pixels_Out + pix_row) + pix_col)->Green) += 
                                   (((*(Pixels_In + pix_row + index1) + pix_col + index2)->Green) 
                                        * (Matrix[index1+1][index2+1]));
                              ((*(Pixels_Out + pix_row) + pix_col)->Blue) += 
                                   (((*(Pixels_In + pix_row + index1) + pix_col + index2)->Blue) 
                                        * (Matrix[index1+1][index2+1]));
                         }
                    }
               }
          }
     }

     /* Write header to output file */
     fwrite(&Header.Type, 2, 1, OUTFILE);
     fwrite(&Header.Size, 4, 1, OUTFILE);
     fwrite(&Header.Reserved1, 2, 1, OUTFILE);
     fwrite(&Header.Reserved2, 2, 1, OUTFILE);
     fwrite(&Header.Offset, 4, 1, OUTFILE);

     /* Write infoheader to output file */
     fwrite(&InfoHeader.Size, 4, 1, OUTFILE);
     fwrite(&InfoHeader.Width, 4, 1, OUTFILE);
     fwrite(&InfoHeader.Height, 4, 1, OUTFILE);
     fwrite(&InfoHeader.Planes, 2, 1, OUTFILE);
     fwrite(&InfoHeader.Bits, 2, 1, OUTFILE);
     fwrite(&InfoHeader.Compression, 4, 1, OUTFILE);
     fwrite(&InfoHeader.ImageSize, 4, 1, OUTFILE);
     fwrite(&InfoHeader.xResolution, 4, 1, OUTFILE);
     fwrite(&InfoHeader.yResolution, 4, 1, OUTFILE);
     fwrite(&InfoHeader.Colors, 4, 1, OUTFILE);
     fwrite(&InfoHeader.ImportantColors, 4, 1, OUTFILE);  

     /* Write pixel data to output file */
     for (pix_row = 0; pix_row < InfoHeader.Height; pix_row++)
     {    for (pix_col = 0; pix_col < InfoHeader.Width; pix_col++)
          {    fwrite(&Pixels_Out[pix_row][pix_col], 3, 1, OUTFILE);
          }
     }

     /* Free all dynamically allocated memory */
     for (pix_row = 0; pix_row < InfoHeader.Height; pix_row++)
     {
         free(Pixels_In[pix_row]);
         free(Pixels_Out[pix_row]);
     }

     free(Pixels_In);
     free(Pixels_Out);

     /* Close input and output files */
     fclose(INFILE); 
     fclose(OUTFILE);

     return 0;
}
