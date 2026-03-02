import Foundation

let N = Int(readLine()!)!
var U = [Int]()

for _ in 0..<N {
    U.append(Int(readLine()!)!)
}

var su = U.sorted()
var arr1 = [Int]()

for i in 0..<U.count {
    for j in 0..<U.count {
        arr1.append(su[i] + su[j])
    }
}

su.sort(by: >)
arr1.sort()
var answer = 0
for i in 0..<U.count {
    var flag = false
    for j in 0..<U.count {
//        if i == j { continue }
        let target = su[i] - su[j]
        var l = 0
        var r = arr1.count - 1
        
        while l <= r {
            var mid = (l + r) / 2
            
            if target == arr1[mid] {
                answer = su[i]
                flag = true
                break
            } else if target > arr1[mid] {
                l = mid + 1
            } else if target < arr1[mid] {
                r = mid - 1
            }
        }
    }
    
    if flag { break }
}

print(answer)