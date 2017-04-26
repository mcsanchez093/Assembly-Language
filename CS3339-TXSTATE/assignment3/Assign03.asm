#Maria Sanchez
#This code takes the non-negative integer elements as input and returns the maximum, 
#minimum and the average value of entered elements.
#Enter a negative number whenever you want to exit the data entering.
.data
txt1:   .asciiz   "Enter a non-negative integer: "
txt2:   .asciiz   "\nmax value is : "
txt3:   .asciiz   "\nmini value is : "
txt4:   .asciiz   "\naverage is : "

.text
.globl main
main:
    addi $s0, $zero, 0
loop:
    la $a0, txt1
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    
    bltz $v0, average
    add  $s0, $v0, 0
    add  $t0, $t0, 1
    add  $t3, $t3, $s0
    
    beq  $t0, 1, first 
    blt  $s0, $t1, min
    bgt  $s0, $t2, max
first:
     add $t1, $s0, 0
     add $t2, $s0, 0
     j   loop
min: 
    add $t1, $s0, 0
    j   loop
max:
    add $t2, $s0, 0
    j   loop    

average:
    div  $t3, $t0
    mflo $t7
    mfhi $t6
    
print:
    la $a0, txt2
    li $v0, 4
    syscall  
    
    add $a0, $t2, 0
    li  $v0, 1
    syscall
    
    la $a0, txt3
    li $v0, 4
    syscall
    
    add $a0, $t1, 0
    li $v0, 1
    syscall
    
    la $a0, txt4
    li $v0, 4
    syscall
    
    add $a0, $t7, 0
    li $v0, 1
    syscall
             
 exit:
    li $v0, 10 
    syscall
