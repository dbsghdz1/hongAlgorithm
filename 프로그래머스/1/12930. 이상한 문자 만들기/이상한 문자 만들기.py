def solution(s):
    answer = ''
    index = 0
    for ss in s:
        if index % 2 == 0:
            answer += ss.upper()
        else:
            answer += ss.lower()
            
        if ss == ' ':
            index = 0
        else:
            index += 1
        print(index)
        
    return answer