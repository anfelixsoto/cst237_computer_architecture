# temperature_6.asm
# Antonio Felix - CST 237 Fall 20 Online

# is_even.asm--  
# ************************* Final Part 2 ************************** # 
# User input a number in and the program checks if it is an even
# or odd number
# ************************* Mars Is_Even ************************* # 
.data
  prompt: .asciiz "Enter an integer: "
  even_msg: .asciiz "The number is even.\n"
  odd_msg: .asciiz "The number is odd.\n"
  
.text
main:

  li $v0, 4
  la $a0, prompt
  syscall
  
  #read in the value
  li $v0, 5
  syscall
  move $t0, $v0
  
  move $a0, $t0
  jal is_even
  
  # checks the value returned is a 1 or 0
  beq $t2, 1, print_even
  beq $t2, $zero, print_odd
  
  # printint the correct output
  print_even:
    li $v0, 4
    la $a0, even_msg
    syscall
    
    j exit
  
  print_odd:
    li $v0, 4
    la $a0, odd_msg
    syscall
    
    j exit
  
  exit:
    li $v0, 10
    syscall 


.text
is_even:
  # calculates the mod of the user input
  andi $t1, $a0, 0x01
  
  # checks if the number is 0 or 1
  # if 0 goes into true label or if 1 goes into the false label
  beq $t1, $zero, true
  beq $t1, 1, false
  
  # updates the value to a 1
  true:
    addi $t2, $zero, 1
    jr $ra
  
  # updates the value to a 0
  false:
   addi $t2, $zero, 0
   jr $ra
