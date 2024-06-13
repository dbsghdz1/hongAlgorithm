func solution(_ arr:[Int]) -> Int {
    var arr1 = arr
    var cnt = 2
    var idx = 0
    var answer: [Int] = []
    var ans = 1
    for k in 2...50 {
        var flag = false
        for i in arr1 {
            if i % cnt == 0 {
                arr1[idx] = i / cnt
                flag = true
            }
            idx += 1
        }
        if flag {
            answer.append(cnt)
        } else {
            cnt += 1
        }
        idx = 0
    }
    for i in answer {
        ans *= i
    }
    for i in arr1 {
        ans *= i
    }
    return ans
}