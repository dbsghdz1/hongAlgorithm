import Foundation

func solution(_ n: Int) -> Int {
    let reversedTernary = String(n, radix: 3).reversed()
    return Int(String(reversedTernary), radix: 3)!
}