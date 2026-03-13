def solution(arr):
    answer = arr
    min = arr[0]
    for a in arr:
        if min > a:
            min = a
    answer.remove(min)
    if len(answer) == 0:
        answer = [-1]
    return answer