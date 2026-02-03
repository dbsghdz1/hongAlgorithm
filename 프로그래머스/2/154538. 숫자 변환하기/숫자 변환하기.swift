import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    if x == y {
        return 0
    }
    
    var visited = Array(repeating: false, count: y + 1)
    visited[x] = true
    
    var current = Set([x])
    var answer = 0
    
    while !current.isEmpty {
        answer += 1
        var next = Set<Int>()
        
        for v in current {
            let c = [v + n, v * 2, v * 3]
            
            for nv in c {
                if nv == y { return answer }
                if nv < y && !visited[nv] {
                    visited[nv] = true
                    next.insert(nv)
                }
            }
        }
        current = next
    }
    return -1
}