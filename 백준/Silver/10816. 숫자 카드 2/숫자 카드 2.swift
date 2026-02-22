import Foundation

let N = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }

let M = Int(readLine()!)!
let queries = readLine()!.split(separator: " ").map { Int($0)! }

var freq: [Int: Int] = [:]

for x in cards {
    freq[x, default: 0] += 1
}

var out = ""
out.reserveCapacity(M * 2)

for q in queries {
    out += "\(freq[q, default: 0]) "
}

print(out.trimmingCharacters(in: .whitespaces))