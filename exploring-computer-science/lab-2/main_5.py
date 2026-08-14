word_all = input()
count = int(len(word_all))
prev = ""
arr = []
total = 0

for i in range(count):
    if(word_all[i] != " "):
        if(ord(word_all[i])<=90):
            first = ord(word_all[i])
            first += 32
            prev += chr(first)
        else:
            prev += word_all[i]
    elif(word_all[i] == " "):
        total += 1
        arr.append(prev)
        prev = ""
        
if(prev):
    total += 1
    arr.append(prev)
    
print(arr)
print(total)