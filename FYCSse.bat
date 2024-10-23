#Ceaser Cipher

import string

def encrypt(plaintext: str, key=3):
    plaintext = plaintext.replace(" ", "")
    pool = (
        list(string.ascii_lowercase) + list(string.ascii_uppercase)
        + list(str(i) for i in range(0, 10))
    )
    ciphertext = ""
    for char in plaintext:
        c = (pool.index(char) + 3) % len(pool)
        ciphertext += pool[c]
    return ciphertext

def decrypt(ciphertext: str, key=3):
    pool = (
        list(string.ascii_lowercase) + list(string.ascii_uppercase)
        + list(str(i) for i in range(0, 10))
    )
    plaintext = ""
    for char in ciphertext:
        c = (pool.index(char) - 3) % len(pool)
        plaintext += pool[c]
    return plaintext

ciphertext = encrypt("Hello World 123")
print(f"Cipher text: {ciphertext}")
print(f"Plain text: {decrypt(ciphertext)}")
===================================================================================================================



#MonoAlphabetic

import string
import random

def generate_key():
    pool = list(string.ascii_lowercase) + list(string.ascii_uppercase) + list(str(i) for i in range(0, 10))
    permutated_pool = (list(string.ascii_lowercase) + list(string.ascii_uppercase) +
                       list(str(i) for i in range(0, 10)))
    random.shuffle(permutated_pool)
    return dict(zip(pool, permutated_pool))

def encrypt(plaintext: str, key: dict):
    plaintext = plaintext.replace(" ", "")
    ciphertext = ""
    for char in plaintext:
        ciphertext += key[char]
    return ciphertext

def decrypt(ciphertext: str, key: dict):
    plaintext = ""
    for char in ciphertext:
        for k, v in key.items():
            if char == v:
                plaintext += k
    return plaintext

key = generate_key()
ciphertext = encrypt("Helloworld", key)
print(f"Ciphertext: {ciphertext}")
print(f'Plaintext: {decrypt(ciphertext, key)}')
===================================================================================================================


#Vernam 


import string
def encrypt(plaintext, key):
    pool = (
        list(string.ascii_lowercase) + list(map(str, range(0, 10)))
        + list(string.ascii_uppercase)
        + list(" ")
    )
    cipher = ""
    for i in range(len(plaintext)):
        p = pool.index(plaintext[i])
        k = pool.index(key[i])
        c = p ^ k
        if (c >= 26):
            c = c - 26
        cipher += pool[c]
    return cipher

plaintext = input("Enter your message: ")
key = input("Enter your key: ")

if len(plaintext) != len(key):
    print("Plaintext and key should be of equal length!!")
else:
    print(encrypt(plaintext, key))
============================================================================================================================

#Playfair


import string

def matrix(key):
    keymat = []
    keys = []
    pool = [char for char in string.ascii_lowercase if char != 'j']
    for i in keys:
        if i not in keys:
            keys.append(i)
    for j in pool:
        if j not in keys:
            keys.append(j)
    for i in range(0, len(keys), 5):
        keymat.append(keys[i:i+5])
    return keymat

def digraph(pt):
    for s in range(0, len(pt)+1, 2):
        if s < len(pt) - 1:
            if pt[s] == pt[s+1]:
                pt = pt[0:s+1] + 'x' + pt[s+1:]
    if len(pt) % 2 != 0:
        pt = pt[:] + 'x'
    return pt

def getloc(char, keymatrix):
    for i in range(5):
        for j in range(5):
            if keymatrix[i][j] == char:
                return [i, j]

def encrypt(pt, keystream):
    keymat = matrix(keystream.lower())
    plain = digraph(pt.lower().replace(" ", ""))
    plain = plain.replace("j", "i")
    cipher = ""
    print(plain)
    i = 0
    while i < len(plain):
        c1 = getloc(plain[i], keymat)
        c2 = getloc(plain[i + 1], keymat)
        if c1[0] == c2[0]:
            row1 = c1[0]
            col1 = (c1[1] + 1) % 5
            row2 = c2[0]
            col2 = (c2[1] + 1) % 5
        elif c1[1] == c2[1]:
            row1 = (c1[0] + 1) % 5
            col1 = c1[1]
            row2 = (c2[0] + 1) % 5
            col2 = c2[1]
        else:
            row1 = c1[0]
            col1 = c2[1]
            row2 = c2[0]
            col2 = c1[1]
        cipher += keymat[row1][col1] + keymat[row2][col2]
        i += 2
    return cipher

print(encrypt("Hello joy jojo", "Playfair"))

=================================================================================================================

#Railfence


def encrypt(pt, rails):
    mat = [["" for i in range(len(pt))] for j in range(rails)]
    cipher = ""
    check, row = 0, 0
    for i in range(len(pt)):
        if check == 0:
            mat[row][i] = pt[i]
            row += 1
            if row == rails:
                check = 1
                row -= 1
        else:
            mat[row][i] = pt[i]
            if row == 0:
                check = 0
                row += 1
            else:
                row -= 1
    cipher = "".join("".join(row) for row in mat)
    return cipher

print(encrypt("hello", 3))

================================================================================================================

#Simple Columnar


import math

def gen_matrix(plaintext, col):
    row = math.ceil(len(plaintext) / col)
    emptycells = (row * col) - len(plaintext)
    plaintext.extend("x" * emptycells)
    matrix = []
    for i in range(0, len(plaintext), col):
        matrix.append(plaintext[i : i + col])
    return matrix

def encrypt(msg, key):
    col = len(key)
    plaintext = list(msg.replace(" ", ""))
    matrix = gen_matrix(plaintext, col)
    sortkeys = sorted(list(key))
    cipher = ""
    kin = 0
    for i in range(col):
        current_col_indx = key.index(sortkeys[kin])
        for row in matrix:
            cipher += row[current_col_indx]
        kin += 1
    return cipher

ciphertext = encrypt("Hello friend", "TestUser")
print(f"ciphertext: {ciphertext}")

=================================================================================================================
#Des 

import pyDes

data = b"Encrypt this data"
k = pyDes.des(b"Decrypts", pyDes.CBC, b"\0\0\0\0\0\0\0\0", pad=None, padmode=pyDes.PAD_PKCS5)
ciphertext = k.encrypt(data)

print(f"plaintext: {data}")
print(f"Encrypted data: {ciphertext}")
print(f"Decrypted data: {k.decrypt(ciphertext)}")

assert k.decrypt(ciphertext) == data


========================================================================================================================================
#Aes

import pyaes

KEY = b"this_key_for_demo_purposes_only!"
plaintext = "encrypt this string"
print(f"Plain text: {plaintext}")

aes = pyaes.AESModeOfOperationCTR(KEY)
ciphertext = aes.encrypt(plaintext)
print(f"Cipher text: {ciphertext}")

# The ctr mode maintains state, but as decryption requires new state to be created, a new
# instance needs to be made
aes = pyaes.AESModeOfOperationCTR(KEY)
plaintext = aes.decrypt(ciphertext)
print(f"Decrypted plain text: {plaintext}")

===============================================================================================================================================
#RSA

import math
import random

def key_gen():
    p = random.choice(gen_prime(100, 501))
    q = random.choice(gen_prime(501, 1000))
    n = p * q
    phin = (p - 1) * (q - 1)
    e = 2
    while(e < phin):
        temp = math.gcd(e, phin)
        if (temp == 1):
            break
        e += 1
    i = 1
    while True:
        d = ((phin * i) + 1) / e
        if (int(d) == d):
            d = int(d)
            break
        i += 1
    return([n, e, d])

def encrypt(m, e, n):
    asc = [ord(i) for i in m]
    c = [(i ** e) % n for i in asc]
    cipher = ''.join(chr(i) for i in c)
    print(cipher)
    return(cipher)

def decrypt(c, d, n):
    numb = [ord(i) for i in c]
    p = [(i ** d) % n for i in numb]
    plaintext = "".join(chr(i) for i in p)
    return(plaintext)

def gen_prime(p, q):
    prime = []
    for i in range(p, q):
        for j in range(2, i):
            if i % j == 0:
                break
        else:
            prime.append(i)
    return prime

keys = key_gen()
cipher = encrypt("Hello", keys[1], keys[0])
print(decrypt(cipher, keys[2], keys[0]))

=================================================================================================================================
#Diffie Hellman


import random

def diffie_hellman_key_exchange():
    # Publicly known prime number (P) and base (G)
    P = 23  # Prime number
    G = 9   # Primitive root modulo P
    
    # Manish's secret key (a)
    a = random.randint(1, P - 1)
    A = pow(G, a, P)
    
    # Manisha's secret key (b)
    b = random.randint(1, P - 1)
    B = pow(G, b, P)
    
    # Exchange public keys A and B
    # Manish computes the shared key using Manisha's public key B
    manish_shared_key = pow(B, a, P)
    
    # Manisha computes the shared key using Manish's public key A
    manisha_shared_key = pow(A, b, P)
    
    return manish_shared_key, manisha_shared_key

# Generate the symmetric keys for both Manish and Manisha
manish_key, manisha_key = diffie_hellman_key_exchange()

print("Manish's Key:", manish_key)
print("Manisha's Key:", manisha_key)

# Check if both keys are identical (which they should be)
if manish_key == manisha_key:
    print("Key Agreement Successful!\nShared Key:", manish_key)
else:
    print("Key Agreement Failed!")
===================================================================================================================================

#MD5


import hashlib

data = input("Enter message: ")
result = data.encode()
b_msg = hashlib.md5(result)

print("Byte format digest:", b_msg.digest())
print("Hex format digest:", b_msg.hexdigest())

======================================================================================================================================

#HMAC


import hmac
import hashlib
import base64

def gen_signature(key, msg):
    k = key.encode('utf-8')
    plaintext = msg.encode('utf-8')
    hmacsha1 = hmac.new(k, plaintext, hashlib.sha1)
    digest = hmacsha1.digest()
    sign = base64.b64encode(digest)
    print(f"Digest:\t\t\t {digest}")
    print(f"Signature(byte format):\t {sign}")
    print(f"Signature(string format): {sign.decode('utf-8')}")

gen_signature("secret", "Hello World!")


==================================================================================================================
#SSL


import ssl
import socket

def create_ssl_socket():
    hostname = 'animepahe.ru'
    context = ssl.create_default_context()
    with socket.create_connection((hostname, 443)) as sock:
        with context.wrap_socket(sock, server_hostname=hostname) as ssock:
            print("SSL Connection Established")
            print("SSL Version:", ssock.version())

create_ssl_socket()

=========================================================================================================================================================================