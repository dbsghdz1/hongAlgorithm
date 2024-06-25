
import Foundation

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
  var maxVal = 0
  
  func permutations(_ nums: [[Int]], _ arr: inout [[Int]], _ used: inout [Bool]) {
    if arr.count == nums.count {
      maxVal = max(maxVal, countDungeons(k, arr))
      return
    }
    
    for i in 0..<nums.count {
      if used[i] {
        continue
      }
      arr.append(nums[i])
      used[i] = true
      permutations(nums, &arr, &used)
      arr.removeLast()
      used[i] = false
    }
  }
  
  func countDungeons(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var blood = k
    var cnt = 0
    for dungeon in dungeons {
      let first = dungeon[0]
      let second = dungeon[1]
      if blood >= first {
        blood -= second
        cnt += 1
      } else {
        break
      }
    }
    return cnt
  }
  
  var arr: [[Int]] = [[]]
  var used: [Bool] = Array(repeating: false, count: dungeons.count)
  permutations(dungeons, &arr, &used)
  
  return maxVal
}