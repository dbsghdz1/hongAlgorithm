import Foundation
func solution(_ s:String, _ n:Int) -> String {
    var answer = ""
    for i in s {
        let value = Int(i.asciiValue!)
        if (value >= 65 && value <= 90) {
            var alphabet = value + n
            if alphabet > 90 {
                alphabet -= 26
            }
            answer += String(UnicodeScalar(alphabet)!)
        } else if (value >= 97 && value <= 122) {
            var alphabet = value + n
            if alphabet > 122 {
                alphabet -= 26
            }
            answer += String(UnicodeScalar(alphabet)!)
        } else {
            answer += " "
        }
    }
    return answer
}