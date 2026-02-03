import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {

    var answer = 0
    let skills = skill.reversed()
    
    for skillTree in skill_trees {
        var skillArray = Array(skills)
        
        for (i, sk) in skillTree.enumerated() {
            if skillArray.contains(sk) && skillArray.popLast() != sk {
                break
            }
            
            if i == skillTree.count - 1 {
                answer += 1
            }
        }
    }
    return answer
}