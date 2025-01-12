import Foundation

let count = Int(readLine()!)!

for _ in 0..<count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    
    var sub = a % 10
    
    var pattern: [Int] = []
    var subSet = Set<Int>()
    
    while !subSet.contains(sub) {
        subSet.insert(sub)
        pattern.append(sub)
        sub = (sub * a) % 10
    }
    
    let patternLength = pattern.count
    let index = (b - 1) % patternLength
    let result = pattern[index]
    
    print(result == 0 ? 10 : result)
}