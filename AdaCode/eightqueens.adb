---------------------------------------
--           Eight Queens            --
-- By: Nicholas Macedo               --
-- Program to solve eight queens     --
-- via file.                         --
---------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with eightQueensFunctions; use eightQueensFunctions;

procedure eightqueens is

    iterNum : integer := 1; --Value set to 1 to begin eightQueensSolve.
    checkArrayOne : Array1;
    checkArrayTwo : Array2;
    checkArrayThree : Array3;
    solutionArray : Array4;
    outFile : file_type;

begin

    --Incase the file doesnt exist, create one.
    create(File=> outFile, Mode=> Append_File, Name => "outputFiles/queensA.txt");
    close(outFile);

    for i in 1 .. 8 loop
        checkArrayOne(i) := true;
    end loop;

    for i in 2 .. 16 loop
        checkArrayTwo(i) := true;
    end loop;

    for i in -7 .. 7 loop
        checkArrayThree(i) := true;
    end loop;

    for i in 1 .. 8 loop
        solutionArray(i) := 0;
    end loop;

    eightQueensSolve(iterNum, checkArrayOne, checkArrayTwo, checkArrayThree, solutionArray);

    put_line("Ada solutions have been saved in the file """ & "queensA.txt" & """.");
    
end eightqueens;
