import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    
    return String(zip(str1, str2).flatMap { [$0, $1] })
}