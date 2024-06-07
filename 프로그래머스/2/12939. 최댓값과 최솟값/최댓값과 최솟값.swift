import Foundation
func solution(_ s:String) -> String {
    var numArr: [Int] = s.components(separatedBy: " ").map { Int($0)!}
    return String(numArr.min()!) + " " + String(numArr.max()!)
}