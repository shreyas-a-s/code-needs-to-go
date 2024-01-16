#!/usr/bin/env python

"""
File: encrypt.py
Encrypts an input string of lowercase letters and prints
the result. The other input is the distance value.
"""

plainText = input("Enter a one-word, lowercase message: ")
distance = int(input("Enter the distance value: "))
code = ""

for ch in plainText:
    ordvalue = ord(ch)
    cipherValue = (ordvalue - ord('a') + distance) % 26 + ord('a')
    code += chr(cipherValue)

print(code)


