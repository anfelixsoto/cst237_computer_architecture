.data

.text   			# All instructions go in the text segment 
# ***Begin the Main Program*** 
main:  

beq $a0, $s0, sixteen 

sll $v0, $t3, 10

andi $s0, $s3, 255

sixteen:

# ** terminate program ** 
Exit:
li $v0, 10     
syscall 
# ***End the Main Program***
