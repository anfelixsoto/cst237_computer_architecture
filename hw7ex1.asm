# Antonio Felix -- 03/9/2020
# hw7ex1.asm--  
# ******************** Homework 7 Exercise 1 ******************** # 
# Program performs the following mathematical operation: 
#  f = (g + h) - (j - 12) 
# where: g = 12, h = 3, j = 27 
# 
# --Global Variables: # * print = Print out message - "f = " 
# ******************** Math Operations ******************** # 

.data   			# GLOBAL VARIABLES go in the data segment  
 g: .word 12
 h: .word 3
 l: .word 27
 output1: .asciiz "f = "
 
.text   			# All instructions go in the text segment 
# ***Begin the Main Program*** 
main:  

#access data && setting data to temp registers
lw $t0, g
lw $t1, h
lw $t2, l

#subtracting 12 from l (a.k.a j)
sub $t3, $t2, 12

#adding g + h
add $t4, $t0, $t1

#subtracting $t4 - $t3
sub $s0, $t4, $t3

# print out "f = ($s0) "
li $v0, 4
la $a0, output1
syscall

#printing $so
li $v0, 1
la $a0, ($s0)
syscall

# ** terminate program ** 
li $v0, 10     
syscall 
# ***End the Main Program***

