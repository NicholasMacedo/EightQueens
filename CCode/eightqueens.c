/*
eightqueens.c: Houses the code to solve the eight queens problem.
Student Name: Nicholas Macedo
Student ID: nmacedov
Student Number: 0889469
*/ 
#include "eightqueens.h"

int main(int argc, char const *argv[]) {
    int queenRow[8];
    // Open the file to print the solution into.
    FILE * filePointer = fopen("outputFiles/queensC.txt", "w");
    if (filePointer == NULL) {
        printf("Critical Program Error: Failed to create/open file.\n");
        exit(0);
    } else {
        // Call the main function and pass it the pointer to the solution file.
        solutionNum = 0;
        eightQueens(queenRow,0,filePointer);
        printf("C Solutions have been saved in the file called \"queensC.txt\".\n");
    }
    return(0);
}

void eightQueens(int queenRow[8], int column, FILE * filePointer) {

    // Loop through every row of the board until all solutions are found.
    for (int row = 0; row < 8; ++ row) {
        if (spotValid(queenRow, row, column) != false) {
            queenRow[column] = row;
            if (column == 7) {  // Found a solution.
                solutionNum ++;
                printBoard(queenRow, solutionNum,filePointer);
            } else {
                eightQueens(queenRow, column+1,filePointer);
            }
        }
    }
}

bool spotValid(int queenRow[8], int row , int column) {
    // Check to see if the queen is placed in a valid locations by checking for other queens.
    for (int i = 0; i < column; ++i) {
        if ((queenRow[i] == row) || (queenRow[i] == (row - column + i)) || (queenRow[i] == (row + column - i))) {
            return(false);
        }
    }
    return(true);
}

void printBoard(int queenRow[8], int solutionNum, FILE * filePointer) {

    fprintf(filePointer, "Solution Number: %d\n", solutionNum);
    // Loop through the solution array
    for (int i = 0; i < 8; ++i) {
        // Loop through one to eight to print each dot until a queen is met.
        for (int j = 0; j < 8; ++j) {
            if (queenRow[i] == j) {
                fprintf(filePointer, "Q ");
            } else {
                fprintf(filePointer, ". ");
            }
        }
        fprintf(filePointer, "\n");
    }
    fprintf(filePointer, "\n");
}
