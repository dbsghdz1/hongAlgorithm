import Foundation

func solution(_ s:String) -> Int{
  var newArr = [Character]()
  for i in s {
    newArr.append(i)
    if newArr.count > 1 {
      if newArr[newArr.count - 1] == newArr[newArr.count - 2] {
        newArr.removeLast()
        newArr.removeLast()
      }
    }
  }
  if newArr.isEmpty {
    return 1
  }
  return 0
}