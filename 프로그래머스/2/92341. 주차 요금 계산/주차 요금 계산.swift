import Foundation

// 먼저 시간을 파싱하고 (함수)
// 문자열을 순회하면서 차별 있었던 파악(어떻게) IN이면 차별 입차시간 기록
// 시간을 돈으로 계산(함수)
// 정렬 후 정답 제출
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var inCar: [String: Int] = [:]
    var carList: [String: Int] = [:]
    var answerArr: [Int] = []
    
    for record in records {
        var carState = record.split(separator: " ")
        let car = String(carState[1])
        if carState[2] == "IN" {
            inCar[car] = toMinutes(carState[0])
        } else {
            let parkTime = toMinutes(carState[0]) - (inCar[car] ?? 0)
            inCar[car] = nil
            carList[car, default: 0] += parkTime
        }
    }
    
    for key in inCar.keys {
        let parkTime = 23 * 60 + 59 - (inCar[key] ?? 0)
        carList[key, default: 0] += parkTime
    }
    
    for key in carList.keys.sorted() {
        answerArr.append(calFee(carList[key]!, fees))
    }
    
    return answerArr
}

func toMinutes(_ time: Substring) -> Int {
    let times = time.split(separator: ":")
    return Int(String(times[0]))! * 60 + Int(String(times[1]))!
}

func calFee(_ time: Int, _ fees: [Int]) -> Int {
    if time <= fees[0] {
        return fees[1]
    }

    let extra = time - fees[0]
    let unit = fees[2]
    return fees[1] + ((extra + unit - 1) / unit) * fees[3]
}
