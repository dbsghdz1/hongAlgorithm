def solution(n):
    answer = 0
    num = n 
    while num > 0:
        answer += num % 10
        num //= 10
    return answer