import Foundation

struct Deque {
    private var arr: [Int] = []
    private var head: Int = 0

    mutating func pushFront(_ x: Int) {
        if head == 0 {
            arr.insert(x, at: 0) // 드물게만 발생
        } else {
            head -= 1
            arr[head] = x
        }
    }

    mutating func pushBack(_ x: Int) {
        arr.append(x)
    }

    mutating func popFront() -> Int? {
        if head >= arr.count { return nil }
        let v = arr[head]
        head += 1
        // 메모리 정리(너무 쌓이면 앞부분 삭제)
        if head > 1024 {
            arr.removeFirst(head)
            head = 0
        }
        return v
    }

    mutating func popBack() -> Int? {
        if head >= arr.count { return nil }
        return arr.removeLast()
    }

    func size() -> Int { arr.count - head }
    func empty() -> Int { size() == 0 ? 1 : 0 }
    func front() -> Int? { head < arr.count ? arr[head] : nil }
    func back() -> Int? { head < arr.count ? arr.last : nil }
}
let N = Int(readLine()!)!
var d = Deque()
for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    
    let command = input[0]
    
    if command == "push_back" {
        let value = Int(input[1])!
        d.pushBack(value)
        
    } else if command == "push_front" {
        let value = Int(input[1])!
        d.pushFront(value)
        
    } else if command == "front" {
        print(d.front() ?? -1)
        
    } else if command == "back" {
        print(d.back() ?? -1)
        
    } else if command == "size" {
        print(d.size())
        
    } else if command == "empty" {
        print(d.empty())
        
    } else if command == "pop_front" {
        print(d.popFront() ?? -1)
        
    } else if command == "pop_back" {
        print(d.popBack() ?? -1)
    }
}