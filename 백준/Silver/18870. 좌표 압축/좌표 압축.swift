import Foundation

let N = Int(readLine()!)!
let X = readLine()!.split(separator: " ").map { Int($0)! }

var s = Set(X.sorted())
var arr = Array(s).sorted()
var answer = [Int]()

for x in X {
    var l = 0
    var r = arr.count - 1
    var i = 0
    
    while l <= r {
        i = (l + r) / 2
        
        if arr[i] == x {
            break 
        } else if arr[i] > x {
            r = i - 1
        } else if arr[i] < x {
            l = i + 1
        }
    }
    answer.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))
