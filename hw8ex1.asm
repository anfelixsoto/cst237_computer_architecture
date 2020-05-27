# Antonio Felix -- 03/23/2020
# hw8ex1.asm--  
# ******************** Homework 7 Exercise 1 ******************** # 
# User input their age, program checks if it is greater than 18
# Then prints the correct statement
# ******************** Math Operations ******************** # 

.data   
 output1: .asciiz "Enter your age: "
 output2: .asciiz "\nYou are an adult."
 output3: .ascii "\nYou are a minor."
 
.text   			# All instructions go in the text segment 
# ***Begin the Main Program*** 
main: 

#printf("Enter your age: "); 
la $a0, output1
li $v0, 4
syscall
    
#scanf("%d", &age);
li $v0,5
syscall
move $t1,$v0

# ** checks if t1 is greater or equal to 18
sge $t0, $t1, 18
beq $t0, $zero, Else
la $v0, 4
la $a0, output2
syscall
j Exit

Else:
la $v0, 4
la $a0, output3
syscall
j Exit

# ** terminate program ** 
Exit:
li $v0, 10     
syscall 
# ***End the Main Program***

