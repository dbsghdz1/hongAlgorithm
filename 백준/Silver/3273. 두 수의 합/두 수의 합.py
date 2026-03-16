c = int(input())
arr = list(map(int, input().split()))
target = int(input())

arr.sort()

left = 0
right = len(arr) - 1
answer = 0

while left < right:
    sum = arr[left] + arr[right]
    
    if sum == target:
        answer += 1
        right -= 1
        left += 1
        
    elif sum > target:
        right -= 1
    else:
        left += 1
        
print(answer)