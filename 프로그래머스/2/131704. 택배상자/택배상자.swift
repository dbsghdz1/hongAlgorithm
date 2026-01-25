import Foundation

func solution(_ order: [Int]) -> Int {
    var stack: [Int] = []
    var current = 1
    var i = 0
    let n = order.count

    while i < n {
        let target = order[i]

        while current <= n && current < target {
            stack.append(current)
            current += 1
        }
        
        if current == target {
            current += 1
            i += 1
            continue
        }
        if let last = stack.last, last == target {
            stack.popLast()
            i += 1
            continue
        }
        break
    }

    return i
}