
def multiplication_table(range_x,range_y):
    for i in range(1,range_x+1):
        for j in range(1,range_y+1):
            result = i*j
            if(j == range_y):
                print(f"{result:4}")
            else:
                print(f"{result:4}",end=" ")

multiplication_table(25,12)