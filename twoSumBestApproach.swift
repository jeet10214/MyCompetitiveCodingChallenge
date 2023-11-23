func twoSum(arr: [Int], kVal: Int) -> Bool {
    var hash: [Int: Int] = [:]
    for value in 0..<arr.count {
        var difference = kVal - arr[value]
        if (hash[difference] != nil) {
            return true
        } else {
            hash[arr[value]] = value
        }
    }
    
    return false
}

twoSum(arr: [2,6,5,8,11], kVal: 20)
