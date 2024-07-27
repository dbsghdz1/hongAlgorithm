import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var p = 0
    var y = 0
    
    for i in s {
        if i == "y" || i == "Y" {
            y += 1
        } else if i == "p" || i == "P"{
            p += 1
        }
    }
    
    if p == y {
        return true
    } else {
        return false
    }
}