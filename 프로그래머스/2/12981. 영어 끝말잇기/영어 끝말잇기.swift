import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var answer = 0
    var count = 1
    var array:[String] = []
    
    for word in words {
        if array.isEmpty {
        	array.append(word)
        } else {
           if array.last!.last! != word.first! || array.contains(word) {
               print(count)
               if count % n == 0 {
                   answer = n
               } else {
                   answer = count % n
               }
               return [answer, (count - 1) / n + 1]
           }
            array.append(word)
        }
        count += 1
    
    }
    return [0, 0]
}