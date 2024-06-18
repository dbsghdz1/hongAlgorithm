import Foundation

let a = readLine()
if let a = a {
    let array = a.components(separatedBy: " ")
    let result = Int(array[0])! + Int(array[1])!
    print(result)
}