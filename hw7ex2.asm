# Antonio Felix -- 3/09/2020
# hw7ex2.asm--  
# ******************** Homework 7 Exercise 2 ******************** # 
# This program will collect the following user information and 
# display it back to the user in this format. Each string will allow 
# for 32 characters: 
# First Name: yourfirstname 
# Last Name: yourlastname 
# Date of Birth: 1/1/1911 #
# ******************** User Profile ******************** # 


.data   
first_name: .space 32
last_name: .space 32	
msg1: .asciiz "Enter First Name: "
msg2: .asciiz "Enter Last Name: " 
msg3: .asciiz "Enter Brith Month: "
msg4: .asciiz "Enter Birth Day: "
msg5: .asciiz "Enter Birth Year: "
backslash: .asciiz "/"
result1: .asciiz "Your first name: "
result2: .asciiz "Your last name: "
result3: .asciiz "Your birthday: "

.text   				# All instructions go in the text segment 
# ***Begin the Main Program*** 

main:
   #Collecting user's first name
    la $a0, msg1    # Load and print string asking for string
    li $v0, 4
    syscall

    li $v0, 8       # take in input

    la $a0, first_name  # load byte space into address
    li $a1, 32          # allot the byte space for string

    move $t0, $a0   # save string to t0
    syscall
    
   #Collecting user's last name
    la $a0, msg2    # Load and print string asking for string
    li $v0, 4
    syscall

    li $v0, 8       # take in input

    la $a0, last_name  # load byte space into address
    li $a1, 32         # allot the byte space for string

    move $t1, $a0   # save string to t1
    syscall
    
   #Collecting user's birth month
   li $v0, 4
   la $a0, msg3
   syscall
   
   li $v0, 5
   syscall
   move $t2, $v0
   
   #Collecting user's birth day
   li $v0, 4
   la $a0, msg4
   syscall
   
   li $v0, 5
   syscall
   move $t3, $v0
   
   #Collecting user's birth year
   li $v0, 4
   la $a0, msg5
   syscall
   
   li $v0, 5
   syscall
   move $t4, $v0
   
   #Printing user's first name
   li $v0, 4
   la $a0, result1
   syscall 
   
   li $v0, 4
   la $a0, first_name
   syscall  
   
   #Printing user's last name
   li $v0, 4
   la $a0, result2
   syscall  
   
   li $v0, 4
   la $a0, last_name
   syscall    
   
   #Printing user's birthday name
   li $v0, 4
   la $a0, result3
   syscall  
   
   li $v0, 1
   la $a0, ($t2)
   syscall
   
   li $v0, 4
   la $a0, backslash
   syscall  
   
   li $v0, 1
   la $a0, ($t3)
   syscall
   
   li $v0, 4
   la $a0, backslash
   syscall  
   
   li $v0, 1
   la $a0, ($t4)
   syscall
   
    li $v0, 10      # end program
    syscall

