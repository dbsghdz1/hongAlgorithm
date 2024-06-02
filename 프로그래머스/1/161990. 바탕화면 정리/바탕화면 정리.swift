import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var x = 50
    var y = 50
    var x2 = 0
    var y2 = 0
    var arr : [String] = []
    for i in wallpaper {
        x2 = 0
        for s in i {
            if s == "#" {
                if (x > x2) {
                    x = x2
                }
                if (y > y2) {
                    y = y2
                }
            }
            x2 += 1
        }
        y2 += 1
    }
    y2 = 0
    var x3 = 0
    var y3 = 0
    for i in wallpaper {
        x2 = 0
        for s in i {
            if s == "#" {
                if (x3 < x2) {
                    x3 = x2
                }
                if (y3 < y2) {
                    y3 = y2
                }
            }
            x2 += 1
        }
        y2 += 1
    }
    y3 += 1
    x3 += 1
    return [y, x, y3, x3]
}