// Dutch National Flag Algorithm
// start with three pointers, low = 0, mid = 0, high = n - 1
// array[mid] == 0 then swap(mid, low) and low++, mid++
// array[mid] == 1 then mid++
// array[mid] == 2 then swap(mid, high) and high--
//https://takeuforward.org/data-structure/sort-an-array-of-0s-1s-and-2s/

func sortColors(_ nums: inout [Int]) {
    var low = 0
    var mid = 0
    var high = nums.count - 1
    
    while mid <= high {
        
        if nums[mid] == 0 {
            var swap = nums[mid]
            nums[mid] = nums[low]
            nums[low] = swap
            
            low += 1
            mid += 1
        } else if nums[mid] == 1 {
            mid += 1
        } else {
            var swap = nums[mid]
            nums[mid] = nums[high]
            nums[high] = swap
            
            high -= 1
        }
    }
}
