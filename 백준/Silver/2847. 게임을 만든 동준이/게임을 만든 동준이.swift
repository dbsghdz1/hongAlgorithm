import Foundation


let N = Int(readLine()!)!

var arr = [Int]()
arr.reserveCapacity(N)

for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}


var index = 0
var score = 0
var count = 0

while index < arr.count {
    if score >= arr[index] && index != 0 {
        arr[index - 1] -= 1
        count += 1
        index = 0
        score = 0
    } else {
        score = arr[index]
        index += 1
    }
}

print(count)