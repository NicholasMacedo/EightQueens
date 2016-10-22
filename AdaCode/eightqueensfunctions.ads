---------------------------------------
--           Eight Queens            --
-- By: Nicholas Macedo               --
-- Program to solve eight queens     --
-- via file.                         --
---------------------------------------

package eightQueensFunctions is

    type Array1 is array(1..8) of boolean;
    type Array2 is array(2..16) of boolean;
    type Array3 is array(-7..7) of boolean;
    type Array4 is array(1..8) of integer;

    -- Used to do the logic behind the program.
    procedure eightQueensSolve (iterNum : in out integer ; checkArrayOne : in out Array1 ;
        checkArrayTwo : in out Array2 ; checkArrayThree : in out Array3 ; solutionArray : in out Array4 );

    -- Used to print the current solution to the file. 
    procedure printBoard(solutionArray : in Array4);


end eightQueensFunctions;
