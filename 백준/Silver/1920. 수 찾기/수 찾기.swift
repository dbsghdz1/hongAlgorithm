import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

let M = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { Int($0)! }

func exists(_ x: Int) -> Bool {
    var l = 0
    var r = arr.count - 1
    
    while l <= r {
        let mid = (l + r) / 2
        if arr[mid] == x { return true }
        if arr[mid] < x {
            l = mid + 1
        } else {
            r = mid - 1
        }
    }
    return false
}

for t in targets {
    print(exists(t) ? 1 : 0)
}