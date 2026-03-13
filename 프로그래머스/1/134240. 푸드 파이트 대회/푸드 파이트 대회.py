def solution(food):
    answer = ''
    result = ''
    
    for (i, f) in enumerate(food):
        if i == 0:
            continue
        
        if f > 1:
            for _ in range(f//2):
                result += str(i)
    
    for r in result:
        answer = r + answer
    result = result + '0' + answer
    return result