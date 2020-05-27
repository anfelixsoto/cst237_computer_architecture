# temperature_6.asm
# Antonio Felix - CST 237 Fall 20 Online
# Gullermo Flores V - CST 237 Fall 20 Online
# David Gaeta - CST 237 Fall 20 Online
# Erik Gallardo- Cruz - CST 237 Fall 20 Online

# temperature_6.asm--  
# ************************* Lab 6 ************************** # 
# User input a number in Fahrenheit and then is converted to Celsius
# Then prints out the answer
# ******************** Mars Temperature ******************** # 

.data
	msg: .asciiz "Exit with 1000"
	msg1: .asciiz "Enter F: "
	msg2: .asciiz "In celsius that is "
	break: .asciiz "\n"
	float_zero: .float 0.0
	break_value: .word 1000
.text
main:

  li $v0, 4
  la $a0, msg
  syscall
  
  li $v0, 4
  la $a0, break
  syscall
  
  # Display the msg1
  
  while: 
  
  li $v0, 4
  la $a0, msg1
  syscall
  
  # Read user input
  li $v0, 5
  syscall
  move $t0, $v0
  
  beq $t0, 1000, exit
  
  move $a0, $t0
  jal FtoC
  
  j while
 

  
 exit:
  li $v0, 10
  syscall 
  
.text
FtoC:
  
  add $t0, $zero, $a0
  mtc1 $t0, $f0
  cvt.s.w $f0, $f0
  
  li $t0, 32
  mtc1 $t0, $f2
  cvt.s.w $f2, $f2
  
  # float mul = 5; $f2
  li $t0, 5
  mtc1 $t0, $f3
  cvt.s.w $f3, $f3

  # mul = mul/9;
  li $t0, 9
  mtc1 $t0, $f4
  cvt.s.w $f4, $f4
  div.s $f3, $f3, $f4

  sub.s $f2, $f0, $f2
  
  mul.s $f5, $f2, $f3
  
  li $v0, 4
  la $a0, msg2
  syscall
  
  li $v0, 2
  mov.s $f12, $f5
  syscall
  
  li $v0, 4
  la $a0, break
  syscall

  jr $ra
  

