import Foundation

while true {
    let numberArray = readLine()!.components(separatedBy: " ").map { Int($0) }
    
    guard let first = numberArray[0], let second = numberArray[1] else {
        continue
    }

    if first == 0 && second == 0 {
        break
    }
    
    print(first > second ? "Yes" : "No")
}

