price = [25, 30, 35]
name = []
total = []
isPrice = False 
count = 0
summ = 0

while(True):
    a = int(input())
    if(a==0):
        break
    elif(isPrice == False):
        name.append(a)
        isPrice = True
        count+=1
    else:
        total.append(a)
        isPrice = False
for i in range(count):
    cal = price[name[i]-1]*total[i]
    summ += cal
    
if(sum(total) >= 10):
    summ -= (summ*0.1)
if(summ >= 300):
    summ -= (summ*0.05)
    
print(f"{summ:.2f}")