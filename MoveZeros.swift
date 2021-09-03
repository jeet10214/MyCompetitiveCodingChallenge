//Link: https://leetcode.com/problems/move-zeroes/
func moveZeroes(_ nums: inout [Int]) {
    var preIndex = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums.swapAt(i, preIndex)
            preIndex += 1
        }
    }
}
