import Foundation

func solution(_ my_str:String, _ n:Int) -> [String] {
    var answer: [String] = []
    var answerString = ""
    let arr = Array(my_str)
    for i in 0..<my_str.count {
        if i % n == 0 && i != 0 {
            answer.append(answerString)
            answerString = ""
        }
        answerString += String(arr[i])
    }
    answer.append(answerString)
    return answer
}