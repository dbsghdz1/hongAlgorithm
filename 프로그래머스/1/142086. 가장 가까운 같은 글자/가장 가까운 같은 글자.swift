import Foundation

func solution(_ s:String) -> [Int] {
    var answer: [Int] = []
    var text = ""
    for i in s {
        if text.contains(i) {
            var arr = Array(text)
            var cnt = 0
            for j in arr.reversed() {
                cnt += 1
                if i == j {
                    answer.append(cnt)
                    break
                } 
            }
        } else {
            answer.append(-1)
        }
        text += String(i)
    }
    return answer
}