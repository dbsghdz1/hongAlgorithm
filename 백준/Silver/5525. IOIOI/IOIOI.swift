import Foundation

let N = Int(readLine()!)!
let _ = Int(readLine()!)!
let S = Array(readLine()!)

var cnt = 0
var answer = 0

if S.count >= 3 {
    var i = 1
    while i < S.count - 1 {
        if S[i-1] == "I" && S[i] == "O" && S[i+1] == "I" {
            cnt += 1
            if cnt >= N {
                answer += 1
                cnt -= 1
            }
            i += 2
        } else {
            cnt = 0
            i += 1
        }
    }
}
print(answer)