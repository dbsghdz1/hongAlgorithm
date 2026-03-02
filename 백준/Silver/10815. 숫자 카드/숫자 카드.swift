import Foundation

let N = Int(readLine()!)!
var arr1 = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
let arr2 = readLine()!.split(separator: " ").map { Int($0)! }

arr1.sort()
var answer = [Int]()

for e in arr2 {
    var l = 0 
    var r = arr1.count - 1
    var flag = false
    
    while l <= r {
        var mid = (l + r) / 2
        
        if arr1[mid] == e {
            flag = true
            break
        } else if arr1[mid] > e {
            r = mid - 1
        } else if arr1[mid] < e {
            l = mid + 1
        }
    }
    
    if flag {
        answer.append(1)
    } else {
        answer.append(0)
    }
}

print(answer.map { String($0) }.joined(separator: " "))