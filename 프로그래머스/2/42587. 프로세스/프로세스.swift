import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
  var p = priorities
  var index = location
  var answer = 0
  var result: [Int] = []
  while !p.isEmpty {
    var max = p.max()!
    if max == p[0] {
      var a = p.removeFirst()
      answer += 1
      result.append(a)
      if index == 0 {
        break
      }
    } else {
      var a = p.removeFirst()
      p.append(a)
    }
    if index != 0 {
      index -= 1
    } else {
      index = p.count - 1
    }
  }
  return answer
}

