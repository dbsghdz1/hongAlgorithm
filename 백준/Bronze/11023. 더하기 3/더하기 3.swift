import Foundation

var numberArray = readLine()!.components(separatedBy: " ").map { Int($0)! }

let sum = numberArray.reduce(0, +)
print(sum)