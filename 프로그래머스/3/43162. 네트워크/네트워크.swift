import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var network = 0
    var visited = Array(repeating: false, count: n)
    
    func dfs(index: Int) {
        visited[index] = true
        
        for next in 0..<n {
            if computers[index][next] == 1 && !visited[next] {
                dfs(index: next)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            network += 1
            dfs(index: i)
        }
    }
    return network
}