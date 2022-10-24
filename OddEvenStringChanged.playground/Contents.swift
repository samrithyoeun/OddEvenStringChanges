import UIKit

var greeting = "Hello, playground"

func encodeString(password: String) -> String {
  
  let chars: [Character] = Array(password)
  let maxCount = password.count
  
  // hashEven stores the count of even indexed character
  // for each string hashOdd stores the count of odd
  // indexed characters for each string
  
  var hashEven: [Int] = Array(repeating: 0, count: maxCount)
  var hashOdd: [Int] = Array(repeating: 0, count: maxCount)
  
  let referenceChar: Character = "a"
  
  
  for i in 0 ..< password.count {
    let index = Int((chars[i].asciiValue ?? 0) - (referenceChar.asciiValue ?? 0))
    
    if !i.isMultiple(of: 2) {
      hashOdd[index] += 1
      
    } else {
      hashEven[index] += 1
    }
  }
  
  var encoding = ""
  for i in 0 ..< maxCount {
    encoding.append("\(hashEven[i])-\(hashOdd[i])-")
  }
  return encoding
}

func findUnique(input1: Int, input2: [String]) -> Int {

  var set = Set<String>()
  for i in 0 ..< input1 {
    let encodeString = encodeString(password: input2[i])
    if !set.contains(encodeString) {
      set.insert(encodeString)
    }
  }
  return set.count
}


let someStrings = ["abcd", "acbd", "adcb", "cdba", "bcda", "badc"]
let count = findUnique(input1: someStrings.count, input2: someStrings)
print("unique count: \(count)")
