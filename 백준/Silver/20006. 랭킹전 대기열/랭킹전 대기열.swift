import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let P = first[0]
let M = first[1]

var players: [(level: Int, name: String)] = []

for _ in 0..<P {
    let input = readLine()!.split(separator: " ")
    let level = Int(input[0])!
    let name = String(input[1])
    players.append((level, name))
}

var matchingRoom: [[(level: Int, name: String)]] = []

for p in players {
    var placed = false

    for i in 0..<matchingRoom.count {
        if matchingRoom[i].count < M {
            let base = matchingRoom[i][0].level
            if base - 10 <= p.level && p.level <= base + 10 {
                matchingRoom[i].append(p)
                placed = true
                break
            }
        }
    }

    if !placed {
        matchingRoom.append([p])
    }
}

for room in matchingRoom {
    print(room.count == M ? "Started!" : "Waiting!")
    for person in room.sorted(by: { $0.name < $1.name }) {
        print(person.level, person.name)
    }
}
