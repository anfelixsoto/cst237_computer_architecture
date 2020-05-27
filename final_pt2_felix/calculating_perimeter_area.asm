# calculating_perimeter_area.asm
# Antonio Felix - CST 237 Fall 20 Online

# calculating_perimeter_area.asm--  
# ************************* Final Part 2 ************************** # 
# Allowing a user to enter a float value and option 1 - 3
# Circle - caluclates the circumference and area
# Triangle - calculates perimeter and area
# Sqaure - calculates perimeter and area
# ********************** Mars sum_of_squares ********************** # 

.data
  prompt: .asciiz "(1) Cricle | (2) Triangle | (3) Square\n"
  prompt1: .asciiz "Enter a float value: "
  prompt2: .asciiz "Enter an option: "
  float_zero: .float 0.0
  
  pi: .float 3.14159265359
  square_root_3: .float 1.73205080757
  
  c_prompt1: .asciiz "The circumference of the circle with radius = "
  c_prompt2: .asciiz " meters is "
  c_prompt3: .asciiz " meters.\n"
  c_prompt4: .asciiz "The area of the circle with radius = "
  c_prompt5: .asciiz " square meters.\n"
  
  t_prompt1: .asciiz "The perimeter of the triangle with side = "
  t_prompt2: .asciiz " meters is " 
  t_prompt3: .asciiz " meters.\n"
  t_prompt4: .asciiz "The area of the triangle with side = "
  t_prompt5: .asciiz " square meters.\n"
  
  s_prompt1: .asciiz "The perimeter of the square with side = "
  s_prompt2: .asciiz " meters is " 
  s_prompt3: .asciiz " meters.\n"
  s_prompt4: .asciiz "The area of the square with side = "
  s_prompt5: .asciiz " square meters.\n"
  
  error: .asciiz "Incorrect -- Input\nTry again \n"
  
.text
main:
  # created a '$zero' for floats to make it easier to load values into new $registers 
  lwc1 $f11, float_zero
  
  li $v0, 4
  la $a0, prompt
  syscall
  
  li $v0, 4
  la $a0, prompt1
  syscall
  
  # takes user's float value 
  li $v0, 6
  syscall
  
  # created a while loop incase a user does not press a number between 1 - 3.
  while:
  
    li $v0, 4
    la $a0, prompt2
    syscall
  
    # take's user (1 / 2 / 3)
    li $v0, 5
    syscall
    move $t0, $v0
  
    # checks what number the user inputted
    # then redirects them into the appropriate label  
    beq $t0, 1, circle
    beq $t0, 2, triangle
    beq $t0, 3, square
    
    li $v0, 4
    la $a0, error
    syscall
    
    j while
  
exit:
  li $v0, 10
  syscall  
  
circle:
  lwc1 $f1, pi

  # calculating circumference and printing
  li $t0, 2
  mtc1 $t0, $f2
  cvt.s.w $f2, $f2
  
  # circumference = 2.0 * pi
  mul.s $f3, $f2, $f1
  
  # circumference = circumference * radius
  mul.s $f3, $f3, $f0
  
  li $v0, 4
  la $a0, c_prompt1
  syscall
  
  # printing the user's floating point
  li $v0, 2
  add.s $f12, $f0, $f11
  syscall  
  
  li $v0, 4
  la $a0, c_prompt2
  syscall
  
  # printing the circumference
  li $v0, 2
  add.s $f12, $f3, $f11
  syscall  
  
  li $v0, 4
  la $a0, c_prompt3
  syscall
  
  # calculating area and printing
  
  # area = pi * radius 
  mul.s $f4, $f1, $f0
  
  # area = area * radius
  mul.s $f4, $f4, $f0
  
  li $v0, 4
  la $a0, c_prompt4
  syscall
  
  
  # printing user's floating point
  li $v0, 2
  add.s $f12, $f0, $f11
  syscall  
  
  li $v0, 4
  la $a0, c_prompt2
  syscall
  
  # printing the area
  li $v0, 2
  add.s $f12, $f4, $f11
  syscall  
  
  li $v0, 4
  la $a0, c_prompt5
  syscall
  
  j exit
  

triangle:
  lwc1 $f1, square_root_3
  
  # calculating perimeter and printing
  li $t0, 3
  mtc1 $t0, $f2
  cvt.s.w $f2, $f2
  
  # perimeter = side * 3
  mul.s $f2, $f2, $f0
  
  li $v0, 4
  la $a0, t_prompt1
  syscall
  
  # printing user's floating point
  li $v0, 2
  add.s $f12, $f0, $f11
  syscall  
  
  li $v0, 4
  la $a0, t_prompt2
  syscall
  
  # printing side
  li $v0, 2
  add.s $f12, $f2, $f11
  syscall  
  
  li $v0, 4
  la $a0, t_prompt3
  syscall
  
  # calculating area and printing
  li $t0, 4
  mtc1 $t0, $f2
  cvt.s.w $f2, $f2
  
  # area = square_root(3) / 4
  div.s $f2, $f1, $f2
  
  # temp = side * side
  mul.s $f3, $f0, $f0
  
  # area = area * temp
  mul.s $f3, $f3, $f2
  
  li $v0, 4
  la $a0, t_prompt4
  syscall
  
  # printing user's float point value 
  li $v0, 2
  add.s $f12, $f0, $f11
  syscall  
  
  li $v0, 4
  la $a0, t_prompt2
  syscall
  
  
  # printing the area
  li $v0, 2
  add.s $f12, $f3, $f11
  syscall 
  
  li $v0, 4
  la $a0, t_prompt5
  syscall
  
  j exit

square:
  # calculating perimeter and printing
  li $t0, 4
  mtc1 $t0, $f1
  cvt.s.w $f1, $f1
  
  # perimeter = side * 4
  mul.s $f2, $f1, $f0
  
  li $v0, 4
  la $a0, s_prompt1
  syscall
  
  # printing user's input
  li $v0, 2
  add.s $f12, $f0, $f11
  syscall  
  
  li $v0, 4
  la $a0, s_prompt2
  syscall
  
  # printing the perimeter
  li $v0, 2
  add.s $f12, $f2, $f11
  syscall  
  
  li $v0, 4
  la $a0, s_prompt3
  syscall
  
  
  # calculating area and printing
  
  # area = side * side 
  mul.s $f3, $f0, $f0
  
  
  li $v0, 4
  la $a0, s_prompt4
  syscall
  
  # printing user's float point 
  li $v0, 2
  add.s $f12, $f0, $f11
  syscall  
  
  li $v0, 4
  la $a0, s_prompt2
  syscall
  
  # printing the area 
  li $v0, 2
  add.s $f12, $f3, $f11
  syscall 
  
  li $v0, 4
  la $a0, s_prompt5
  syscall
  
  j exit
