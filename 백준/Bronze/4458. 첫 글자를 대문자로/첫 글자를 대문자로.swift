import Foundation

let input = Int(readLine()!)!

for i in 0..<input {
  var str = readLine()!
  var arr = Array(str)
  arr[0] = Character(arr[0].uppercased())
  print(String(arr))
}
