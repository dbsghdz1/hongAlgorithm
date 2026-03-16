n = int(input())
arr1 = list(map(int, input().split()))
arr1.sort()

m = int(input())
arr2 = list(map(int, input().split()))

for x in arr2:
    left = 0
    right = len(arr1) - 1
    flag = False
    
    while left <= right:
        mid = (left + right) // 2
        
        if x == arr1[mid]:
            flag = True
            break
        elif x > arr1[mid]:
            left = mid + 1
        else:
            right = mid - 1
    
    if flag:
        print(1)
    else:
        print(0)
        