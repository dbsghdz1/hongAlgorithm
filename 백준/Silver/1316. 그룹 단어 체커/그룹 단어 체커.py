n = int(input())

answer = 0

for _ in range(n):
    word = input()
    seen = set()
    prev = ""

    flag = True

    for w in word:
        if w != prev:
            if w in seen:
                flag = False
                break
            seen.add(w)
        prev = w

    if flag:
        answer += 1

print(answer)
        
    