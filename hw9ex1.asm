.data
	name: .asciiz "Antonio Felix\n"
	msg1: .asciiz "Input an integer x: "
	msg2: .asciiz "Factorial of "
	msg3: .asciiz " = "

.text
main:

	li $v0, 4
	la $a0, name
	syscall
	
	# printf("Input an integer x: ");
	li $v0, 4
	la $a0, msg1
	syscall
	
	# number input
	li $v0, 5
	syscall
	move $t0, $v0 #storing the value into $t0
	
	# calling the function
	move $a0, $v0
	jal factorial
	move $t5, $v0
	
	# print the prompt
	li $v0, 4
	la $a0, msg2
	syscall
	
	#print the orignal #
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	j exit

exit:
	li $v0, 10
	syscall 

.text
factorial:
	addi $sp, $sp, -8
    
    	sw $s0, 4($sp)
    	sw $ra, 0($sp)
    	bne $a0, 0, else
    	addi $v0, $zero, 1    # return 1
    	j fact_return

	else:
    		move $s0, $a0
    		addi $a0, $a0, -1
    		jal  factorial
    		
    		multu  $s0, $v0 # return x*Fact(x-1)
    		mflo $v0
    		
	fact_return:
    		lw $s0, 4($sp)
   	 	lw $ra, 0($sp)
    		addi $sp, $sp, 8
    		jr $ra


