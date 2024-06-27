
import Foundation

func solution(_ s:String) -> Int {
  var text = ""
  var answer = ""
  let numDict = ["zero" : "0", "one" : "1", "two" : "2",
                 "three" : "3", "four": "4", "five" : "5",
                 "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9"]
  for i in s {
    if !i.isNumber {
      text += String(i)
    } else {
      answer += String(i)
    }
    if numDict.contains(where: { $0.key == text }) {
      answer += String(numDict[text]!)
      text = ""
    }
  }
  
  return Int(answer)!
}
