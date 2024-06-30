import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    let count = String(n, radix: 2).filter { $0 == "1" }.count
    
    while true {
        n += 1
        if count == String(n, radix: 2).filter { $0 == "1" }.count {
            return n
        }
    }   
    return 0
}