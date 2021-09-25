//Link: https://leetcode.com/problems/search-insert-position
//Uses binary search
//Requires sorted Array

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    
    if nums[0] == target {
        return 0
    }

    let index = binarySearch(nums, from: 0, to: nums.count - 1, target: target)
    return index
}

func binarySearch(_ nums: [Int], from: Int, to: Int, target: Int) -> Int {

    let middleIndex = (from + to) / 2
    let middleElement = nums[middleIndex]
    var index = 0

    if from-to == 0 {
        if middleElement != target {
            if target > nums.last! {
                return middleIndex + 1
            }
            return middleIndex
        }
    }

    if middleElement == target {
        return middleIndex
    } else if middleElement > target {
        index = binarySearch(nums, from: 0, to: middleIndex, target: target)
    } else {
        index = binarySearch(nums, from: middleIndex + 1, to: to, target: target)
    }
    return index
}
