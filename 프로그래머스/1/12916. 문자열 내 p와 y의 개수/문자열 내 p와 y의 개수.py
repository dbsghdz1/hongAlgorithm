def solution(s):
    answer = True
    pcnt = 0
    ycnt = 0
    s = s.upper()
    for a in s:
        if a == "P":
            pcnt += 1

        if a == "Y":
            ycnt += 1
    return pcnt == ycnt