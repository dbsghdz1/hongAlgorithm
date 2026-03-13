def solution(num):
    answer = 0
    if num == 1:
        return 0
    
    for _ in range(500):
        if num % 2 == 0:
            num //= 2
        elif num % 2 == 1:
            num = num * 3 + 1
        answer += 1
        if num == 1:
            break
    if num != 1:
        answer = -1
    return answer