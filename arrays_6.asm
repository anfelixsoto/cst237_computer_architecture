# arrays_6.asm
# Antonio Felix - CST 237 Fall 20 Online
# Gullermo Flores V - CST 237 Fall 20 Online
# David Gaeta - CST 237 Fall 20 Online
# Erik Gallardo- Cruz - CST 237 Fall 20 Online

# hw8ex1.asm--  
# ************************* Lab 5 ************************** # 
# User input their age, program checks if it is greater than 18
# Then prints the correct statement
# ******************** Math Operations ******************** # 

.data  
 # int fibonacci[7] = {1,1,2,3,5,8,13};
 fibonacci: .word 1, 1, 2, 3, 5, 8, 13
 
 # int fib_length = 7
 fib_length: .word 7
 
 #comma output
 comma: .asciiz ","
 
 
.text   			# All instructions go in the text segment 
 # ***Begin the Main Program*** 
 main: 

  #int i = 0
  li $t0, 0

  # address holder
  addi $t7, $zero, 0

  #int fib_length = 7; 
  lw $s1, fib_length
  
  while:
   # while( i != fib_length)
   beq $t0, $s1, exit
   
   # grabbing the value
   lw $t6, fibonacci($t7)
   addi $t7, $t7, 4
   
   # i++
   addi $t0, $t0, 1
   
   
   # printf("%d", fibonacci[i]);
   li $v0, 1
   move $a0, $t6
   syscall
   
   blt	$t0, $s1, comma_print
  
   # calling the while label to continue the loop 
   j while
   
  
  #comma printer
  comma_print:
   li $v0, 4
   la $a0, comma
   syscall
   
   #calls the while label again
   j while
  
  # ** terminate program ** 
  #return 0
  exit:
   li $v0, 10     
   syscall 
# ***End the Main Program***


