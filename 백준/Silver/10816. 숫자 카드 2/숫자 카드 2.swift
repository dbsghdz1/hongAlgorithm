import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

let M = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { Int($0)! }

func lowerBound(_ x: Int) -> Int {
    var l = 0
    var r = arr.count
    
    while l < r {
        let mid = (l + r) / 2
        if arr[mid] < x {
            l = mid + 1
        } else {
            r = mid
        }
    }
    return l
}


func upperBound(_ x: Int) -> Int {
    var l = 0
    var r = arr.count
    
    while l < r {
        let mid = (l + r) / 2
        if arr[mid] <= x {
            l = mid + 1
        } else {
            r = mid
        }
    }
    return l
}

var out = ""
for x in targets {
    let count = upperBound(x) - lowerBound(x)
    out += "\(count) "
}

print(out)