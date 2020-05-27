# Antonio Felix - 3/9/2020
# lab4.asm--  
# ******************** Lab 4 ******************* # 
# In this lab you will create a "Mad Libs" style program. The program 
# will read in four (4) or more values from the user and insert those 
# values into a story. At least one of the values must be a string and 
# one of the values must be an integer.
# ********************************************* # 

.data   
  name_input: .space 32
  part_body: .space 32
  fluid: .space 32
  substance: .space 32
  
  namemsg: .asciiz "Enter a name: "
  bodymsg: .asciiz "Enter a body part: "
  fluidmsg: .asciiz "Enter a fluid: "
  substancemsg: .asciiz "Enter a substance: "  
  nummsg: .asciiz "Enter a number: "
  
  msg1: .asciiz " is sick with the "
  msg2: .asciiz " flu. Drink more "
  msg3: .asciiz " and take "
  msg4: .asciiz " as prescibed for "
  msg5: .asciiz " days." 

.text   				# All instructions go in the text segment 
# ***Begin the Main Program*** 

main:
    # Inputting && storing data
    # name input && saving
    la $a0, namemsg
    li $v0, 4
    syscall
    
    li $v0, 8
    la $a0, name_input
    li $a1, 32
    move $t0, $a0
    syscall
    
    # body part input && saving
    la $a0, bodymsg
    li $v0, 4
    syscall
    
    li $v0, 8
    la $a0, part_body
    li $a1, 32
    move $t1, $a0
    syscall
    
    # fluid input && saving
    la $a0, fluidmsg
    li $v0, 4
    syscall
    
    li $v0, 8
    la $a0, fluid
    li $a1, 32
    move $t2, $a0
    syscall
  
    # substance part input && saving
    la $a0, substancemsg
    li $v0, 4
    syscall
    
    li $v0, 8
    la $a0, substance
    li $a1, 32
    move $t3, $a0
    syscall
    
    # number input && saving
    la $a0, nummsg
    li $v0, 4
    syscall
    
    li $v0,5
    syscall
    move $t4,$v0
    
    # outputting madlibs
    li $v0, 4
    la $a0, name_input
    syscall
    
    la $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 4
    la $a0, part_body
    syscall
    
    la $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 4
    la $a0, fluid
    syscall
    
    la $v0, 4
    la $a0, msg3
    syscall
    
    li $v0, 4
    la $a0, substance
    syscall
    
    la $v0, 4
    la $a0, msg4
    syscall
    
    li $v0, 1
    la $a0, ($t4)
    syscall
    
    la $v0, 4
    la $a0, msg5
    syscall
                
    li $v0, 10      # end program
    syscall
