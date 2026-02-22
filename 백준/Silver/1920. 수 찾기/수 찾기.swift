import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

let M = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { Int($0)! }

for x in targets {
    var l = 0
    var r = arr.count - 1
    var flag = false
    while l <= r {
        var mid = (l + r) / 2
        
        if arr[mid] == x { 
            flag = true
            break
        } else if arr[mid] < x {
            l = mid + 1 
        } else {
            r = mid - 1
        }
    }
    print(flag ? 1 : 0)
}