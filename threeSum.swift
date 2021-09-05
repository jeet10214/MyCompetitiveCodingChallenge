//https://leetcode.com/problems/3sum/

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else { return [[Int]]() }
    let sortedArray = nums.sorted()
    var result = [[Int]]()
    for i in 0..<sortedArray.count {
        // Don't allow `i` to point to same element
        if i != 0, sortedArray[i] == sortedArray[i-1] { continue }
        var j = i + 1
        var k = sortedArray.count-1
        while j < k {
            let sum = sortedArray[i] + sortedArray[j] + sortedArray[k]
            if sum == 0 {
                result.append([sortedArray[i], sortedArray[j], sortedArray[k]])
                j += 1
                // Don't allow `j` to point to same element
                while j < k, sortedArray[j] == sortedArray[j-1] {
                    j += 1
                }
            } else if sum < 0 {
                j += 1
            } else {
                k -= 1
            }
        }
    }
    return result
}
