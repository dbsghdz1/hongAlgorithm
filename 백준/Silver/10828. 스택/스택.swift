import Foundation

let n = Int(readLine()!)!

var stack = [Int]()
for _ in 0..<n {
  let input = readLine()!.split(separator: " ")
  let inputString = String(input[0])
  switch inputString {
  case "pop":
    print(stack.isEmpty ? "-1" : stack.removeLast())
  case "size":
    print(stack.count)
  case "empty":
    print(stack.isEmpty ? "1" : "0")
  case "top":
    print(stack.isEmpty ? "-1" : stack.last!)
  case "push":
    stack.append(Int(input[1])!)
  default :
    print("없음")
  }
}
