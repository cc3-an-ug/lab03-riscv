# En jupiter necesitamos declarar el punto de partida (__start)
.globl __start

# Segmento de datos estaticos
.data
  msg1: .asciiz "Enter a number: "
  msg2: .asciiz "\nresult = "

# Segmento de texto
.text

__start:
  # Imprimo un string msg1 (syscall/ecall 4)
  li a0, 4
  la a1, msg1
  ecall # Print string
  # Leo un entero (syscall/ecall 5)
  li a0, 5
  ecall # Read int
  # Llamo a la funcion factorial
  jal factorial
  # Guardo el resultado en s0
  mv s0, a0
  # Imprimo un string msg2 (syscall/ecall 4)
  la a1, msg2
  li a0, 4
  ecall # Print string
  # Imprimo un entero (syscall/ecall 1)
  mv a1, s0
  li a0, 1
  ecall # Prtint int
  # Salgo del programa codigo 0 (syscall/ecall 10)
  li a0, 10
  ecall # Exit

factorial:
  # TODO implementar factorial
  li a0, 1
  jr ra
