import Foundation

struct MinHeap {
    var heap = [Int]()
    
    mutating func push(_ x: Int) {
        heap.append(x)
        var i = heap.count - 1
        
        while i > 0 {
            let p = (i - 1) / 2
            if heap[p] <= heap[i] { break }
            heap.swapAt(p, i)
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
    
    var count: Int {
        heap.count
    }
}

let N = Int(readLine()!)!
var h = MinHeap()

for _ in 0..<N {
    h.push(Int(readLine()!)!)
}

var answer = 0
while h.count > 1 {
    let a = h.pop() ?? 0
    let b = h.pop() ?? 0
    let sum = a + b
    answer += sum
    h.push(sum)
}

print(answer)

