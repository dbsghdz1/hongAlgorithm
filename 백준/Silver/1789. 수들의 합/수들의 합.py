t = int(input())

arr = []
i = 1

while t > 0:
    if t < i:
        break
    
    t -= i
    arr.append(i)    
    i += 1
print(len(arr))