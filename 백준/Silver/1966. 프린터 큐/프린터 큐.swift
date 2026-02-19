import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let N = nm[0]
    let M = nm[1]

    var priorities = readLine()!.split(separator: " ").map { Int($0)! }
    var idx = M
    var count = 0
    var arr = priorities
    var i = 0
    while true {
        if i == priorities.count {
            i = 0
        }
        let maxValue = arr.max()!
        if idx == i && priorities[i] == maxValue {
            count += 1
            break
        } else if maxValue == priorities[i] {
            let index = arr.firstIndex(of: maxValue)!
            arr.remove(at: index)
            count += 1
        }
        i += 1
    }
    print(count)
}