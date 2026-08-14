total = int(input())
arr = []

for i in range(total):
    a = int(input())
    arr.append(a)
    
for i in range(total):
    if(arr[i]%2 !=0):
        print("T")
    elif(arr[i] == 2):
        print("T")
    else:
        print("F")
