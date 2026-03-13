def solution(a, b, n):
    answer = 0
    
    total = n
    
    while total >= a:
        answer += b*(total // a)
        total =  b*(total // a) + total % a
    return answer