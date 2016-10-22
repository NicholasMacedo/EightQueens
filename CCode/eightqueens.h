/*************************eightqueens.h*************************************
Student Name: Nicholas Macedo                Student Number: 
Date: April 8th 2016                         Course Name: CIS 3190
****************************************************************************/  

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Used to count the number of solutions found.
int solutionNum;

/*
eightQueens: Holds the main logic for the program.
Pre: Array with current solution, column and file pointer for printing.
Post: Returns nothing.
*/
void eightQueens(int queenRow[8], int column, FILE * filePointer);

/*
spotValid: Checks to see if the spot the queen in is valid or not. 
Pre: Array, row and column to check.
Post: Returns 0 if unvalud and 1 if valid. 
*/
bool spotValid(int queenRow[8], int row, int column);

/*
printBoard: Prints the given array to the file given. 
Pre: Array to print, current number of solutions and the file to print into.
Post: Returns nothing. 
*/
void printBoard(int queenRow[8], int solutionNum, FILE * filePointer);
