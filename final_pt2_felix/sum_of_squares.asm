# sum_of_squares.asm
# Antonio Felix - CST 237 Fall 20 Online

# sum_of_square.asm--  
# ************************* Final Part 2 ************************** # 
# User inputs 10 numbers into an array. Then the numbers are squared
# and then added together to create a grand total
# ********************** Mars sum_of_squares ********************** # 

.data
  array: .space 40
  prompt: .asciiz "Sum of squares = "
  equal: .asciiz "="
  plus: .asciiz "+"
  test: .asciiz "Exit create_array\n"
  power: .asciiz "^2"

  
.text
main:

  # Index (offset)
  addi $t0, $zero, 0
  jal create_array
  
  
  # resets the $t0 and moves into the function
  addi $t0, $zero, 0
  move $a0, $t0
  jal sum_of_squares
  
  addi $t0, $zero, 0
  
  
  li $v0, 10     
  syscall 
 
create_array:
  # checking if $t0 is not equal to 40
  # index 
  beq $t0, 40, exit
  
  # taking the user's input and moved to $t1
  li $v0, 5
  syscall
  move $t1, $v0
  
  # saving user input to current index
  sw $t1, array($t0)
  
  # adding 4 'bits' to keep track of it 
  addi $t0, $t0, 4
  
  j create_array
  
  # exit the current function and then pushed into 'print' label
  exit:
    li $v0, 4
    la $a0, prompt
    syscall   
    
    addi $t0, $zero, 0
    j print
    
    jr $ra
  
# prints all the values in the array with '^2+' and ' = ' at the end   
print:
  beq  $t0, 40, exit_print
  
  lw $t1, array($t0)
  addi $t0, $t0, 4
  
  li $v0, 1
  move $a0, $t1
  syscall
  
  blt $t0, 40, print_plus
  beq $t0, 40, print_equal
  
  j print
  
 
  print_plus:
    li $v0, 4
    la $a0, power
    syscall 
    
    li $v0, 4
    la $a0, plus
    syscall
    
    j print
  
  print_equal:
    li $v0, 4
    la $a0, power
    syscall 
    
    li $v0, 4
    la $a0, equal
    syscall
    
    j print
    	
  exit_print:
   jr $ra
   
   
.text
sum_of_squares:
  
  # grand total of the function
  addi $t3, $zero, 0
  
  
  # created a while loop to keep track of function
  while:
    # loading the numbers into $t1
    lw $t1, array($t0)
    
    # adding 4 'bits' to the index
    addi $t0, $t0, 4
    
    # creating a temp value for the number squared
    addi $t2, $zero, 0
    mul $t2, $t1, $t1
    
    
    # adding to the grand total
    add $t3, $t3, $t2
    
    beq  $t0, 40, exit_function
    j while
  
  exit_function:
    li $v0, 1
    move $a0, $t3
    syscall 
    
    jr $ra
