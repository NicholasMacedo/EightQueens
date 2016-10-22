!-------------------------------------!
!-           Eight Queens            -!
!- By: Nicholas Macedo (0889469)     -!
!- Program to solve eight queens     -!
!- via file.                         -!
!-------------------------------------!
program eightqueens
    implicit none

    logical, dimension(1:8) :: checkArrayOne
    logical, dimension(2:16) :: checkArrayTwo
    logical, dimension(-7:7) :: checkArrayThree
    integer, dimension(1:8) :: solutionArray
    integer :: number
    integer :: numSolutions
    integer :: i
    logical :: inquireOutput
    number = 1
    numSolutions = 1

    ! Check to see if the output file exists, if so clear the info in it.
    inquire(file = "outputFiles/queensF.txt", exist = inquireOutput)
    if (.NOT. inquireOutput) then
        open(unit = 1,file = "outputFiles/queensF.txt", status = 'new', action = 'write')
    else 
        open(unit = 1,file = "outputFiles/queensF.txt", status = 'old', action = 'write')
        write(1,*) ""
    end if
    close (1)

    ! Initialize the arrays.
    do i = 1,8
        checkArrayOne(i) = .TRUE.
    end do

    do i = 2,16
        checkArrayTwo(i) = .TRUE.
    end do

    do i = -7,7
        checkArrayThree(i) = .TRUE.
    end do

    do i = 1,8
        solutionArray(i) = 0
    end do

    ! Call the main function.
    call solve(number, checkArrayOne, checkArrayTwo, checkArrayThree, solutionArray, numSolutions)

    write(*,*) "Fortran solutions have been saved in the file """ , "queensF.txt" , """."

end

! ============================================== !
! Subroutine: printBoard                         !
! In: Array with solution, number of solutions.  !
! Out: Nothing.                                  !
! Used to print the solution to the file given.  !
! ============================================== !
subroutine printBoard(solutionArray, numSolutions)
    integer, dimension(1:8), intent(in) :: solutionArray
    integer :: i
    integer :: j

    ! Open the file to save the current solution into.
    open(unit = 1,file = "outputFiles/queensF.txt", status = 'old', position = 'append', action = 'write')

    write(1,'(A, I2, A)') "Solution Number: ",numSolutions
    do i = 1,8
        do j = 1,8
            if (solutionArray(i) .EQ. j) then
            write(1,"(A)",advance="no") "Q "
            else
                write(1,"(A)",advance="no") ". "
            end if
        end do
        write(1,*) ""
    end do
    write(1,*) ""
    close (1)
    numSolutions = numSolutions + 1

end subroutine printBoard

! =================================================== !
! Subroutine: solve                                   !
! In: Arrays for logic and number of solutions.       !
! Out: Nothing.                                       !
! Used to solve the problem and call print function.  !
! =================================================== !
recursive subroutine solve(number, checkArrayOne, checkArrayTwo, checkArrayThree, solutionArray, numSolutions)
    integer, intent(in out) :: number
    logical, dimension(1:8), intent(in out) :: checkArrayOne
    logical, dimension(2:16), intent(in out) :: checkArrayTwo
    logical, dimension(-7:7), intent(in out) :: checkArrayThree
    integer, dimension(1:8), intent(in out) :: solutionArray
    integer, intent(in out) :: numSolutions
    integer :: j
    
    do j = 1,8
        if(checkArrayOne(j) .AND. checkArrayTwo(number+j) .AND. checkArrayThree(number-j))then
            solutionArray(number) = j
            checkArrayOne(j) = .FALSE.
            checkArrayTwo(number+j) = .FALSE.
            checkArrayThree(number-j) = .FALSE.           

            if (number .LT. 8) then
            number = number + 1
                call solve(number, checkArrayOne, checkArrayTwo, checkArrayThree, solutionArray, numSolutions)
            number = number - 1
            else
                call printBoard(solutionArray, numSolutions)
            end if

            checkArrayOne(j) = .TRUE.
            checkArrayTwo(number+j) = .TRUE.
            checkArrayThree(number-j) = .TRUE.
        end if
    end do
end subroutine solve