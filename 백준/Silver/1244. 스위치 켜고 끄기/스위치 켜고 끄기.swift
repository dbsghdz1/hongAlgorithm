import Foundation

let N = Int(readLine()!)!

var switches = [0] + readLine()!.split(separator: " ").map { Int($0)! }

let M = Int(readLine()!)!

var students: [(Int, Int)] = []

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let gender = input[0]
    let number = input[1]
    students.append((gender, number))
}

for student in students {
    if student.0 == 1 {
        var index = student.1
        while index < switches.count {
            switches[index] = switches[index] == 0 ? 1 : 0
            index += student.1
        }
    } else {
        switches[student.1] = switches[student.1] == 0 ? 1 : 0
        var head = student.1 + 1
        var tail = student.1 - 1
        while head < switches.count && tail > 0 && switches[head] == switches[tail] {
            switches[head] = switches[head] == 0 ? 1 : 0
            switches[tail] = switches[tail] == 0 ? 1 : 0
            head += 1
            tail -= 1
        }
    }
}

for i in 1..<switches.count {
    print(switches[i], terminator: " ")
    if i % 20 == 0 {
        print()
    }
}