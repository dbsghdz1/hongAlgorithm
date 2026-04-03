let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]

var dist = Array(repeating: -1, count: 100001)
var queue = [n]
dist[n] = 0
var head = 0

while head < queue.count {
    let cur = queue[head]
    head += 1

   let moves = [cur - 1, cur + 1, cur * 2]
    
    for (i, nx) in moves.enumerated() {
        if nx < 0 || nx > 100000 { continue }
        
        let cost = (i == 2) ? 0 : 1
        let newCost = dist[cur] + cost
        
        if dist[nx] == -1 || dist[nx] > newCost {
            dist[nx] = newCost
            
            if cost == 0 {
                queue.insert(nx, at: head)
            } else {
                queue.append(nx)
            }
        }
    }
}

print(dist[k])