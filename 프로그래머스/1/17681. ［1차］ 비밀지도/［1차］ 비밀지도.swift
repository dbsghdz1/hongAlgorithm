func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for i in 0..<n {
        let str1 = String(arr1[i], radix: 2)
        let str1Change = Array(String(repeating: "0", count: max(0, n - str1.count)) + str1)
        let str2 = String(arr2[i], radix: 2)
        let str2Change = Array(String(repeating: "0", count: max(0, n - str2.count)) + str2)
        var answerStr = ""
        for i in 0..<n {
            if str1Change[i] == "1" || str2Change[i] == "1" {
                answerStr += "#"
            } else {
                answerStr += " "
            }
        }
        answer.append(answerStr)
        answerStr = ""
    }
    return answer
}