s = input()

arr = [0] * 26

for c in s:
    arr[ord(c) - ord('a')] += 1

print(*arr)