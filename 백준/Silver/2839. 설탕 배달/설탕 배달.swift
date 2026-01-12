import Foundation

var n = Int(readLine()!)!
var result = 0

while n > 1 {
  if n % 5 == 0 {
    n -= 5
    result += 1
  } else if n % 3 == 0 {
    n -= 3
    result += 1
  } else if n > 5 {
    result += 1
    n -= 5
  } else if n > 3 {
    n -= 3
  } else {
    result = -1
    break
  }
}

print(n > 0 ? -1 : result)