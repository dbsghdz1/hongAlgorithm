import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
  var answer: [Int] = []
  var pro = progresses
  pro = pro.reversed()
  var cnt = 0
  var idx = 0
  var speed = speeds
  speed = speed.reversed()
  while true {
    idx = 0
    for i in speed {
      pro[idx] += i
      idx += 1
    }
    if pro[pro.count - 1] >= 100 {
      for i in pro.reversed() {
        if i >= 100 {
          pro.removeLast()
          speed.removeLast()
          cnt += 1
        } else {
          break
        }
      }
    }
    if cnt != 0 {
      answer.append(cnt)
      cnt = 0
    }
    if answer.reduce(0, +) == speeds.count {
      break
    }
  }
  return answer
}

