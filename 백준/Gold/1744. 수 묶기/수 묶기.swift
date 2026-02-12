import Foundation

let N = Int(readLine()!)!

var positives = [Int]()   // > 1
var negatives = [Int]()   // < 0
var ones = 0
var zeros = 0

for _ in 0..<N {
    let x = Int(readLine()!)!
    if x > 1 { positives.append(x) }
    else if x == 1 { ones += 1 }
    else if x == 0 { zeros += 1 }
    else { negatives.append(x) }
}

positives.sort(by: >)
negatives.sort() // 오름차순 (더 음수부터)

var answer = 0
answer += ones

// 양수 >1 페어 곱
var i = 0
while i + 1 < positives.count {
    answer += positives[i] * positives[i+1]
    i += 2
}
if i < positives.count { answer += positives[i] }

// 음수 페어 곱
var j = 0
while j + 1 < negatives.count {
    answer += negatives[j] * negatives[j+1]
    j += 2
}
if j < negatives.count {
    if zeros == 0 { answer += negatives[j] } // 0 있으면 버림
}

print(answer)