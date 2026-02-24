import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypads = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [-1, 0, -2]]
    var lp = (3, 0)
    var rp = (3, 2)
    var result = ""
    
    for num in numbers {
        if num == 1 {
            result += String("L")
            lp = (0, 0)
        } else if num == 4 {
            result += String("L")
            lp = (1, 0)
        } else if num == 7 {
            result += String("L")
            lp = (2, 0)
        } else if num == 3 {
            result += String("R")
            rp = (0, 2)
        } else if num == 6 {
            result += String("R")
            rp = (1, 2)
        } else if num == 9 {
            result += String("R")
            rp = (2, 2)
        } else if num == 2 {
            if dist(lp, (0, 1)) < dist(rp, (0, 1)) {
                lp = (0, 1)
                result += String("L")
            } else if dist(lp, (0, 1)) > dist(rp, (0, 1)) {
                rp = (0, 1)
                result += String("R")
            } else {
                if hand == "left" {
                    result += String("L")
                    lp = (0, 1)
                } else {
                    result += String("R")
                    rp = (0, 1)
                }
            }
        } else if num == 5 {
            if dist(lp, (1, 1)) < dist(rp, (1, 1)) {
                lp = (1, 1)
                result += String("L")
            } else if dist(lp, (1, 1)) > dist(rp, (1, 1)) {
                rp = (1, 1)
                result += String("R")
            } else {
                if hand == "left" {
                    lp = (1, 1)
                    result += String("L")
                } else {
                    rp = (1, 1)
                    result += String("R")
                }
            }
        } else if num == 8 {
            if dist(lp, (2, 1)) < dist(rp, (2, 1)) {
                lp = (2, 1)
                result += String("L")
            } else if dist(lp, (2, 1)) > dist(rp, (2, 1)) {
                rp = (2, 1)
                result += String("R")
            } else {
                if hand == "left" {
                    lp = (2, 1)
                    result += String("L")
                } else {
                    rp = (2, 1)
                    result += String("R")
                }
            }
        } else if num == 0 {
            if dist(lp, (3, 1)) < dist(rp, (3, 1)) {
                lp = (3, 1)
                result += String("L")
            } else if dist(lp, (3, 1)) > dist(rp, (3, 1)) {
                rp = (3, 1)
                result += String("R")
            } else {
                if hand == "left" {
                    lp = (3, 1)
                    result += String("L")
                } else {
                    rp = (3, 1)
                    result += String("R")
                }
            }
        }
    }
    return result
}

func dist(_ cp: (Int, Int), _ t: (Int, Int)) -> Int {
    let x = abs(cp.0 - t.0)
    let y = abs(cp.1 - t.1)
    return x + y
}