section .data
    msg db "Enter first number: ", 0
    msg2 db "Enter second number: ", 0
    add_msg db "Addition: ", 0
    sub_msg db "Subtraction: ", 0
    mul_msg db "Multiplication: ", 0
    div_msg db "Division: ", 0
    newline db 10, 0

section .bss
    num1 resb 10
    num2 resb 10
    result resb 10

section .text
    global _start
    extern printf, scanf

_start:
    ; Ask for first number
    push msg
    call printf
    add esp, 4
    push num1
    push format
    call scanf
    add esp, 8

    ; Ask for second number
    push msg2
    call printf
    add esp, 4
    push num2
    push format
    call scanf
    add esp, 8

    ; Convert input to integer
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'

    ; Addition
    add eax, ebx
    add eax, '0'
    mov [result], eax
    push add_msg
    call printf
    add esp, 4
    push result
    call printf
    add esp, 4
    push newline
    call printf
    add esp, 4

    ; Subtraction
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    sub eax, ebx
    add eax, '0'
    mov [result], eax
    push sub_msg
    call printf
    add esp, 4
    push result
    call printf
    add esp, 4
    push newline
    call printf
    add esp, 4

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
