.globl __start

.data
  msg1: .asciiz "Enter a number: "
  msg2: .asciiz "\nresult = "

.text

__start:
  li a0, 4
  la a1, msg1
  ecall # Print string
  li a0, 5
  ecall # Read int
  jal factorial
  mv s0, a0
  la a1, msg2
  li a0, 4
  ecall # Print string
  mv a1, s0
  li a0, 1
  ecall # Prtint int
  li a0, 10
  ecall # Exit

factorial:
  # TODO: Implement this
