//Link : https://leetcode.com/problems/majority-element/

func majorityElement(_ nums: [Int]) -> Int {
  let maxCount = nums.count/2
  var counts: [Int: Int] = [:]
  for num in nums {
    counts[num] = (counts[num] ?? 0) + 1
    if counts[num]! > maxCount {
      return num
    }
  }
  return 0
}
majorityElement([2,3,3])
majorityElement([2,3,3,4,4,7,7,7,4,4,4,4,4,4])
