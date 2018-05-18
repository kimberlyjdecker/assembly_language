;
; 64-bit system call example
; Syscall #       param 1     2     3      4      5      6
;   rax            rdi       rsi   rdx    r10    r8     r9
; return value
;rax
;
; from /usr/include/x86_64-linux-gnu/asm/unistd_64.h
;
WRITE equ 1
EXIT equ 60
STDOUT equ 1

section .text      ;section declaration

global _start   

_start:  
   mov rax, $WRITE      ; write syscall
   mov rdi, $STDOUT     ; write to stdout
   mov rsi, msg1        ; use string msg1
   mov rdx, len1        ; write len chars
   syscall              ; make syscall

   mov rax, $WRITE      ; write syscall
   mov rdi, $STDOUT     ; write to stdout
   mov rsi, msg2        ; use string msg2
   mov rdx, len2        ; write len chars
   syscall              ; make syscall

   mov rdi, rax         ; error code 0
   mov rax, $EXIT       ; exit syscall
   ;mov rdi, 2 
   syscall              ; make syscall

section .data      ;section declaration
   msg1: db "64-bit write sys call",0xa
   len1: equ $-msg1
   msg2: db "Hello colorado",0xa
   len2: equ $-msg2   ;length of the output string         
