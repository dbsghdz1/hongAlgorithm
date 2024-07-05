
func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
  var cards1 = cards1
  var cards2 = cards2
  var goal = goal
  
  for i in goal {
    if !cards1.isEmpty && cards1[0] == i {
      cards1.removeFirst()
      goal.removeFirst()
    } else if !cards2.isEmpty && cards2[0] == i {
      cards2.removeFirst()
      goal.removeFirst()
    } else {
      return "No"
    }
  }
  if goal.isEmpty {
    return "Yes"
  }
  return "No"
}