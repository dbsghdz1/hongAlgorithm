import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var dict: [String : [String]] = [:]
  var answer = 1
  var sum = 1
  for key in clothes {
    dict.append(element: key[0], toValueOfKey: key[1])
  }

  for i in dict.values {
    answer *= (i.count + 1)
  }
  return answer - 1
}

extension Dictionary where Value: RangeReplaceableCollection {
  public mutating func append(element: Value.Iterator.Element, toValueOfKey key: Key) -> Value? {
    var value: Value = self[key] ?? Value()
    value.append(element)
    self[key] = value
    return value
  }
}