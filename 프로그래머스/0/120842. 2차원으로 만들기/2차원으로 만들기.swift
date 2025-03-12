import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    var answer: [[Int]] = []
    var answerArr:[Int] = []
    for num in num_list {
        answerArr.append(num)
        if (answerArr.count == n) {
            answer.append(answerArr)
            answerArr = []
        }
    }
    return answer
}