func maxSubArray(_ nums: [Int]) -> Int {
    var maxi = Int.min
    var sum = 0
    var subArrayStart = -1 // storing the index of subArray start
    var subArrayEnd = -1  // storing the index of subArray end
    for i in 0..<nums.count {
        if sum == 0 {
            subArrayStart = i
        }
        sum = sum + nums[i]
        
        if sum > maxi {
            maxi = sum
            subArrayEnd = i
        }
        
        if sum < 0 {
            sum = 0
        }
    }
    
    return maxi > 0 ? maxi : 0
}

maxSubArray([-2,-3,4,-1,-2,1,5,-3])
