all:
	gcc -Wall -pedantic -std=c99 CCode/eightqueens.c -o solvequeens
	gnatmake -Wall AdaCode/eightqueensfunctions.adb AdaCode/eightqueensfunctions.ads AdaCode/eightqueens.adb
	gfortran -Wall FortranCode/eightqueens.f95 -o runqueens

c:
	gcc -Wall -pedantic -std=c99 CCode/eightqueens.c -o solvequeens

ada:
	gnatmake -Wall AdaCode/eightqueensfunctions.adb AdaCode/eightqueensfunctions.ads AdaCode/eightqueens.adb

fortran:
	gfortran -Wall FortranCode/eightqueens.f95 -o runqueens

run:
	./eightqueens
	./solvequeens
	./runqueens

cFiles:
	rm outputFiles/queensA.txt
	rm outputFiles/queensF.txt
	rm outputFiles/queensC.txt

clean:
	rm *.ali
	rm *.o
	rm eightqueens
	rm solvequeens
	rm runqueens
