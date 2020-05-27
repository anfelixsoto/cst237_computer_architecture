.globl main

.data
prompt: .asciiz "Please input a Celsius temperature: "
num: .word 32



.text
main:

li $v0, 4 
la $a0, prompt	# Display Prompt
syscall		

li $v0, 5	# Gets input value
syscall	

move $a0, $v0	# Sets up argumument moves input value in $a0	
lw $s0, num	# Loads 32 in $s0

li $t0, 9	# Sets up 9/5
li $t1, 5

mtc1 $t0, $f2	# Converts into float point numbers
mtc1 $t1, $f30

div.d $f12, $f2, $f30	# Division 9/5
     mfc1 $t3, $f12          # Should place contents of $f12 (1.8) into $t3
  # li $v0, 3	don't need I don't think	

move $a1, $t3		

move $a2, $s0	# Sets up argument ----- 32
jal calculateTemp # Jumps to function

move $s4, $v0
li $v0, 1
move $a0, $s4
syscall

li $v0, 10
syscall



calculateTemp:
div $t0, $a1, $a0	# 9/5 * userInput Should equal 180

sub $t1, $t0, $a2	# Answer above + 32

move $v0, $t1		# Places in return register
jr $ra		# Jumps to line after function call