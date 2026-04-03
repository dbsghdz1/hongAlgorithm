let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = Array(repeating: [(Int, Int)](), count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    let w = input[2]
    
    graph[a].append((b, w))
}

let last = readLine()!.split(separator: " ").map { Int($0)! }
let start = last[0]
let end = last[1]

struct minHeap {
    var queue = [(Int, Int)]()
    
    mutating func push(_ x: (Int, Int)) {
        queue.append(x)
        var i = queue.count - 1
        
        while i > 0 {
            let p = (i - 1) / 2
            
            if queue[i].0 >= queue[p].0 { break }
            
            queue.swapAt(i, p)
            i = p
        }
        
        
    }
    
    mutating func pop() -> (Int, Int)? {
        if queue.isEmpty { return nil }
        if queue.count == 1 { return queue.removeLast() }
        
        let min = queue[0]
        queue[0] = queue.removeLast()
        
        var i = 0
        
        while true {
            let l = i * 2 + 1
            let r = i * 2 + 2
            var c = i
            
            if l < queue.count && queue[l].0 < queue[c].0 {
                c = l
            }
            
            if r < queue.count && queue[r].0 < queue[c].0 {
                c = r 
            }
            
            if c == i { break }
            
            queue.swapAt(i, c)
            i = c
        }
        
        return min
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}

var mh = minHeap()

var dist = Array(repeating: Int.max, count: n + 1)
mh.push((0, start))
dist[start] = 0

while !mh.isEmpty() {
    guard let (w, cur) = mh.pop() else { break }
    if dist[cur] < w { continue }
    
    for (nx, weight) in graph[cur] {
        if w + weight < dist[nx] {
            dist[nx] = w + weight
            mh.push((weight + w, nx))
        }
    }
}

print(dist[end])