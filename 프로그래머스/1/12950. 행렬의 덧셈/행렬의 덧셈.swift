func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer: [[Int]] = []
    var arr:[Int] = []
    var idx = 0
    for i in arr1 {
        arr = []
        for j in 0..<i.count {
            arr.append(arr1[idx][j] + arr2[idx][j])
        }
        answer.append(arr)
        idx += 1
    }
    return answer
}