nums = [4, 9, 3, 0, 2]
max_1 = None
max_2 = None

for i in nums:
    if(max_1 == None):
        max_1 = i
    elif(i > max_1):
        max_2 = max_1
        max_1 = i
    elif(i > max_2):
        max_2 = i
print(nums)
print(max_2)