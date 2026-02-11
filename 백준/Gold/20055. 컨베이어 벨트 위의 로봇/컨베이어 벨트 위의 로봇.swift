import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let K = first[1]

var durability = readLine()!.split(separator: " ").map { Int($0)! }
var robots = Array(repeating: false, count: N)

var step = 0

while true {
    step += 1
    
    durability.insert(durability.removeLast(), at: 0)
    robots.insert(robots.removeLast(), at: 0)
    robots[N-1] = false
    
    for i in stride(from: N-2, through: 0, by: -1) {
        if robots[i] && !robots[i+1] && durability[i+1] > 0 {
            robots[i] = false
            robots[i+1] = true
            durability[i+1] -= 1
        }
    }
    robots[N-1] = false
    
    if durability[0] > 0 {
        robots[0] = true
        durability[0] -= 1
    }
    if durability.filter ({ $0 == 0}).count >= K {
        break 
    }
}

print(step)