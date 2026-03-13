def solution(s):
    dict = {
        'zero': '0',
        'one': '1',
        'two': '2',
        'three': '3',
        'four': '4',
        'five': '5',
        'six': '6',
        'seven': '7',
        'eight': '8',
        'nine': '9'
    }
    
    str = ''
    answer = ''
    for ss in s:
        if ss.isdecimal() == False:
            str += ss
        else:
            if str in dict:
                answer = answer + dict[str] + ss
                str = ''
            else:
                answer = answer + ss
                str = ''
        if str in dict:
            answer += dict[str]
            str = ''
    return int(answer)