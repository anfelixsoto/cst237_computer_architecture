.data

.text   			# All instructions go in the text segment 
# ***Begin the Main Program*** 
main:  

add $s0, $s1, $t0

sub $s1, $t7, $t8

lw $s1, 400($s5)

# ** terminate program ** 
li $v0, 10     
syscall 
# ***End the Main Program***