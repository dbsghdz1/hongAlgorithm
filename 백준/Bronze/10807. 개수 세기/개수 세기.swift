import Foundation
var number = Int(readLine()!)!
let numberArray = readLine()!.components(separatedBy:" ")
let foundNumber = readLine()!

print(numberArray.filter {$0 == foundNumber}.count )
