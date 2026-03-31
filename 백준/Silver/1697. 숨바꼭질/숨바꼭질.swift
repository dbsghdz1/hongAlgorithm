let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var dist = Array(repeating: 0, count: 100001)

var queue = [n]
dist[n] = 1
var head = 0

while head < queue.count {
    let p = queue[head]
    head += 1
    
    if p == m {
        print(dist[p] - 1)
        break
    }
    
    let p1 = p - 1
    let p2 = p + 1
    let p3 = p * 2
    
    if p1 >= 0 && p1 <= 100000 && dist[p1] == 0 {
        dist[p1] = dist[p] + 1
        queue.append(p1)
    }
    
    if p2 >= 0 && p2 <= 100000 && dist[p2] == 0 {
        dist[p2] = dist[p] + 1
        queue.append(p2)
    }
    
    if p3 >= 0 && p3 <= 100000 && dist[p3] == 0 {
        dist[p3] = dist[p] + 1
        queue.append(p3)
    }
}