import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var a = a
    var n = n
    var count = 0
    var bottles = 0
    while n >= a {
        count +=  (n / a) * b
        bottles = (n / a) * b
        n = n % a + bottles
    }
    return count
}