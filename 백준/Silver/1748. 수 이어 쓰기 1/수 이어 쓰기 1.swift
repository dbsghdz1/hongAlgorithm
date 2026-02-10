import Foundation

let N = Int(readLine()!)!
var length = 1
var count = 9
var start = 1
var result = 0
var num = N

while num > 0 {
    if num >= count {
        result += count * length
        num -= count
    } else {
        result += num * length
        break
    }
    length += 1
    count *= 10
}

print(result)