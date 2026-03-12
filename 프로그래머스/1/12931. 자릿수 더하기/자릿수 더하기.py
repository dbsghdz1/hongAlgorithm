def solution(n):
    if n < 10: 
        return n
    return n % 10 + solution(n // 10)

