import Foundation

func solution(_ record:[String]) -> [String] {
    var users: [String: String] = [:]
    var answer: [String] = []
    
    for rec in record {
        let info = rec.split(separator: " ")
        
        if info[0] == "Enter" {
            users[String(info[1])] = String(info[2])
        }
        
        if info[0] == "Change" {
            users[String(info[1])] = String(info[2])
            // print(info[1], info[2])
        }
    }
    
    for r in record {
        let info = r.split(separator: " ")
        let user = users[String(info[1])] ?? ""
        if info[0] == "Enter" {
            answer.append("\(user)님이 들어왔습니다.")
        }
        
        if info[0] == "Leave" {
            answer.append("\(user)님이 나갔습니다.")
        }
    }
    
    return answer
}