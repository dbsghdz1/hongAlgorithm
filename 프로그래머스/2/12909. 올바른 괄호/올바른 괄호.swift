struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}


func solution(_ s:String) -> Bool {
    if s.prefix(1) == ")"{
        return false
    }
    var stack = Stack<Character>()
    for i in s {
        if i == "(" {
            stack.push(i)
        } else {
            stack.pop()
        }
    }
    if stack.isEmpty {
        return true
    }
    return false
}