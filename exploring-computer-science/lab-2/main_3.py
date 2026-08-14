total = int(input())
num = input().split()
num_cal = list(map(int,num))

if(total % 2 == 0):
    ind_one = (total // 2)-1
    ind_two = total // 2
    result = float((num_cal[ind_one] + num_cal[ind_two]) / 2)
    print('{:.2f}'.format(result))
else:
    ind = (total // 2)
    result = float(num_cal[ind])
    print('{:.2f}'.format(result))
