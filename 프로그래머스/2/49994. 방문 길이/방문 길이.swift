struct Point: Hashable {
    let x: Int
    let y: Int
}

struct Edge: Hashable {
    let from: Point
    let to: Point

    init(_ a: Point, _ b: Point) {
        if a.x < b.x || (a.x == b.x && a.y <= b.y) {
            self.from = a
            self.to = b
        } else {
            self.from = b
            self.to = a
        }
    }
}


func solution(_ dirs: String) -> Int {
    var x = 0, y = 0
    var visited = Set<Edge>()
    var distance = 0

    for ch in dirs {
        var nx = x, ny = y

        switch ch {
        case "U": ny += 1
        case "D": ny -= 1
        case "R": nx += 1
        case "L": nx -= 1
        default: continue
        }

        if nx < -5 || nx > 5 || ny < -5 || ny > 5 {
            continue
        }

        let edge = Edge(Point(x: x, y: y), Point(x: nx, y: ny))
        if visited.insert(edge).inserted {
            distance += 1
        }

        x = nx
        y = ny
    }

    return distance
}