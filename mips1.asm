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
  
  beq $t1, 1, print_odd
  beq $t1, $zero, print_even
  
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
  andi $t1, $a0, 0x01
  
  jr $ra



















