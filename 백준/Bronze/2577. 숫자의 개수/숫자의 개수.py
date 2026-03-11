a = int(input())
b = int(input())
c = int(input())

sum = a * b * c

arr = [0] * 10

while sum > 0:
    r = sum % 10
    sum //= 10
    arr[r] += 1

for i in range(10):
    print(f"{arr[i]}")