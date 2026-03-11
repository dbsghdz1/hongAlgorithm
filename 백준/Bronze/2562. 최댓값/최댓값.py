arr = []

for _ in range(9):
    arr.append(int(input()))

max = 0
index = 0
for i in range(9):
    if arr[i] > max:
        max = arr[i]
        index = i
print(max)
print(index + 1)
        