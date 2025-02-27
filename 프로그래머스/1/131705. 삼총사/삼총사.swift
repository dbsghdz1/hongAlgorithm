import Foundation

func solution(_ number:[Int]) -> Int {
    var answer = 0
    let length = number.count
    var isSamChongSa = 0
    
    for i in 0..<length - 2 {
        for j in i + 1..<length - 1 {
            for k in j + 1..<length {
                isSamChongSa += number[i]
                isSamChongSa += number[j]
                isSamChongSa += number[k]
                print(number[i], number[j], number[k])
                if isSamChongSa == 0 {
                    answer += 1
                } else {
                    isSamChongSa = 0
                }
            }
        }
    }
    return answer
}