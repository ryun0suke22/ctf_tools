import sys

def encrypt(text,s):
    result = ""
    # transverse the plain text
    for i in range(len(text)):
        char = text[i]
        # check alphabet
        if (not char.isalpha()):
            result += char
            continue
        # Encrypt uppercase characters in plain text
        if (char.isupper()):
            result += chr((ord(char) + int(s)-65) % 26 + 65)
        # Encrypt lowercase characters in plain text
        else:
            result += chr((ord(char) + int(s) - 97) % 26 + 97)
    return result

#check the above function
text = sys.argv[1]
s = sys.argv[2]

print ("Plain Text : " + text)
print ("Shift pattern : " + str(s))
print ("Cipher: " + encrypt(text,s))
