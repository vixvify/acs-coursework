name = input().split()
name_y = ""

for i in name:
    if(ord(i[0]) >= 97 and ord(i[0]) <= 122):
        a = ord(i[0]) - 32
        b = chr(a)
        name_y += b+'.'
    else:
        name_y += i[0]+'.'
print(name_y)
