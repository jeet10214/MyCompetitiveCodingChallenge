func twoSumDict(_ nums: [Int], _ target: Int) -> [Int] {
  var maps: [Int:Int] = [:]
  for i in 0..<nums.count {
    let currentValue = nums[i]
    if let firstHalfIndex = maps[currentValue] {
      return [firstHalfIndex, i]
    }
    let currentTarget = target - currentValue
    maps[currentTarget] = i
  }
  return []
}
