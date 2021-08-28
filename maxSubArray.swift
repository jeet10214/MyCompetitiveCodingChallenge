func maxSubArray(_ nums: [Int]) -> Int {
   guard nums.count > 1 else {
     return nums[0]
   }
   var maxSoFar = 0
   var maxEndingHere = 0
   var maxNegativeNumber = -100000000
   for i in 0...nums.count - 1 {
      maxEndingHere += nums[i]
      if maxEndingHere <= 0 {
          if maxNegativeNumber < maxEndingHere {
              maxNegativeNumber = maxEndingHere
          }
          maxEndingHere = 0
      } else {
          if maxEndingHere > maxSoFar {
              maxSoFar = maxEndingHere
          }
      }
  }
    
  if maxSoFar == 0 && maxNegativeNumber < 0 {
      return maxNegativeNumber
  }

  return maxSoFar
}
