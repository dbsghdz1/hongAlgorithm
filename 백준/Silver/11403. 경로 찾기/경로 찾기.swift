import Foundation

let N = Int(readLine()!)!

var graph = [[Int]]()

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(row)
}

for index in 0..<N {
    var visited = Array(repeating: false, count: N)
    var queue = [Int]()
    var head = 0
    
    queue.append(index)
    
    while head < queue.count {
        let cur = queue[head]
        head += 1
        
        for next in 0..<N {
            if graph[cur][next] == 1 && !visited[next] {
                visited[next] = true
                queue.append(next)
            }
        }
    }
    
    for i in 0..<N {
        if visited[i] {
            graph[index][i] = 1
        }
    }
}

for i in 0..<N {
    print(graph[i].map { String($0) }.joined(separator: " "))
}