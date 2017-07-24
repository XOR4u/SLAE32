import base64 
from Crypto.Cipher import DES 

def Decrypt(key): 
	des = DES.new(key, DES.MODE_ECB) 
	cipher_text = "mYnefTtZFP9KHqILSNgXVua4un/F34BDAdu1D63WKWw=" 
	decrypt = des.decrypt(base64.b64decode(cipher_text)) 

	decryption = "" 
	i = 0 
	for dec in range(len(decrypt)) : 
		decryption += '\\x' + decrypt[i].encode('hex') 
		i = i + 1 

	return decryption 

if __name__ == "__main__": 
	key = raw_input("Please enter encryption Key - 8 bytes \n") 
	while (len(key) != 8 ): 
		key = raw_input("Please enter encryption Key - 8 bytes \n") 

	print Decrypt(key)
