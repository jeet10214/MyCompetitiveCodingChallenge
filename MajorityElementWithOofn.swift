//Find Majority Element in Array

func majorityElement(array: [Int]) -> Int {
    
    guard array.count > 1 else { return 0 }
    var majorElement = array[0]
    var count = 1
    
    for i in 1...array.count - 1 {
        if array[i] == majorElement {
            count += 1
        } else {
            if count == 0 {
                majorElement = array[i]
                count = 1
            } else {
                count -= 1
            }
        }
    }
    return majorElement
}
