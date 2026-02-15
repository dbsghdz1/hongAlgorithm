import Foundation

struct MinHeap {
    var heap = [Int]()
    
    mutating func push(_ x: Int) {
        heap.append(x)
        var i = heap.count - 1
        
        while i > 0 {
            let p = (i - 1) / 2
            
            if heap[p] <= heap[i] { break }
            heap.swapAt(i, p)
            i = p
        }
    }
    
    mutating func pop() -> Int? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeLast() }
        
        let min = heap[0]
        heap[0] = heap.removeLast()
        var i = 0
        
        while true {
            let l = i * 2 + 1
            let r = i * 2 + 2
            var s = i
            
            if l < heap.count && heap[l] < heap[s] { s = l }
            if r < heap.count && heap[r] < heap[s] { s = r }
            if s == i { break }
            
            heap.swapAt(s, i)
            i = s
        }
        return min
    }
    
    mutating func count() -> Int {
        return heap.count
    }
    
    mutating func min() -> Int? {
        if heap.isEmpty { return nil }
        return heap[0]
    }
}

let N = Int(readLine()!)!
var h = MinHeap()

var lectures: [(s: Int, t: Int)] = []

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    lectures.append((s: line[0], t: line[1]))
}

lectures.sort {
    if $0.s != $1.s {
        return $0.s < $1.s
    }
    return $0.t < $1.t
}

for lect in lectures {
    if h.count() == 0 {
        h.push(lect.t)
        continue
    }
    
    if let minTime = h.min() {
        if lect.s >= minTime {
            h.pop()
        }
        h.push(lect.t)
    }
}

print(h.count())