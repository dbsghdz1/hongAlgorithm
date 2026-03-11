a, b = input().split()
a = int(a)
b = int(b)

b -= 45

if b < 0:
    if a == 0:
        a = 23
        b += 60
    else:
        a -= 1
        b += 60
print(a, b)