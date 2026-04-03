let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = Array(repeating: [(Int, Int)](), count: n + 1)

struct MinHeap {
    var heap: [(Int, Int)] = []
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    mutating func push(_ value: (Int, Int)) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }
    
    mutating func pop() -> (Int, Int)? {
        if heap.isEmpty { return nil }
        
        if heap.count == 1 {
            return heap.removeLast()
        }
        
        let root = heap[0]
        heap[0] = heap.removeLast()
        siftDown(from: 0)
        
        return root
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && heap[child].0 < heap[parent].0 {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = parent * 2 + 1
            let right = parent * 2 + 2
            var smallest = parent
            
            if left < heap.count && heap[left].0 < heap[smallest].0 {
                smallest = left
            }
            
            if right < heap.count && heap[right].0 < heap[smallest].0 {
                smallest = right
            }
            
            if smallest == parent { break }
            
            heap.swapAt(parent, smallest)
            parent = smallest
        }
    }
}

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

var dist = Array(repeating: Int.max, count: n + 1)
dist[start] = 0

var pq = MinHeap()
pq.push((0, start))

while !pq.isEmpty {
    let (cost, cur) = pq.pop()!
    
    if dist[cur] < cost { continue }
    
    for (next, weight) in graph[cur] {
        let newCost = cost + weight
        
        if newCost < dist[next] {
            dist[next] = newCost
            pq.push((newCost, next))
        }
    }
}

print(dist[end])