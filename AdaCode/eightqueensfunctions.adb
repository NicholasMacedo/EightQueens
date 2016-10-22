---------------------------------------
--           Eight Queens            --
-- By: Nicholas Macedo               --
-- Program to solve eight queens     --
-- via file.                         --
---------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body eightqueensfunctions is

solutionNumber : integer := 1;

--------------------------------------------------------------
-- eightQueensSolve: Houses the main logic of the program.  --
-- Pre: Arrays and a number.                                --
-- Post: Returns nothing.                                   --
--------------------------------------------------------------
procedure eightQueensSolve (iterNum : in out integer ; checkArrayOne : in out Array1 ;
    checkArrayTwo : in out Array2 ; checkArrayThree : in out Array3 ; solutionArray : in out Array4 ) is

begin
    --Logic copied from the file given to us by the prof.
    for j in 1 .. 8 loop
        if checkArrayOne(j) and checkArrayTwo(iterNum + j) and checkArrayThree(iterNum - j) then
            solutionArray(iterNum) := j;
            checkArrayOne(j) := false;
            checkArrayTwo(iterNum + j) := false;
            checkArrayThree(iterNum - j) := false;            

            if iterNum < 8 then
                iterNum := iterNum + 1;
                eightQueensSolve(iterNum, checkArrayOne, checkArrayTwo, checkArrayThree, solutionArray);
                iterNum := iterNum - 1;
            else
                printBoard(solutionArray); --Prints the current solution to a file.
            end if;

            checkArrayOne(j) := true;
            checkArrayTwo(iterNum + j) := true;
            checkArrayThree(iterNum - j) := true;
        end if;
    end loop;
end eightQueensSolve;

-----------------------------------------------------------
-- printBoard: Prints the current solution to the file.  --
-- Pre: Array with the solution in it.                   --
-- Post: Returns nothing.                                --
-----------------------------------------------------------
procedure printBoard(solutionArray : in Array4) is

    outFile : file_type; --Out file name.

begin

    open(File=> outFile, Mode=> Append_File, Name => "outputFiles/queensA.txt");
    put(outFile, "Solution Number: ");
    put(outFile, solutionNumber,width=>0);
    put_line(outFile, " ");

    -- Double for loop to get the row and then the column value of where the queen goes.
    for i in 1 .. 8 loop
        for j in 1 .. 8 loop
            if solutionArray(i) = j then
                put(outFile, "Q ");
            else
                put(outFile, ". ");
            end if;
        end loop;
        put_line(outFile, " ");
    end loop;
    put_line(outFile, " ");

    close(outFile);
    -- Track the number of solutions for easy readability in the file.
    solutionNumber := solutionNumber + 1;
end printBoard;

end eightqueensfunctions;
