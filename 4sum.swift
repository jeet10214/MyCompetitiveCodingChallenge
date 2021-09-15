//https://leetcode.com/problems/4sum

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 4 else { return [[Int]]() }
    let sortedArray = nums.sorted()
    print(sortedArray)
    var result = [[Int]]()
    
    for i in 0...sortedArray.count-4 {
        // Don't allow `i` to point to same element
        if i > 0 && sortedArray[i] == sortedArray[i-1] { continue }
        for j in i+1...sortedArray.count-3 {
            if j > i+1 && sortedArray[j] == sortedArray[j-1] { continue }
            var k = j + 1
            var l = sortedArray.count - 1
            while k < l {
                let sum = sortedArray[i] + sortedArray[j] + sortedArray[k] + sortedArray[l]
                if sum == target {
                    if !result.contains([sortedArray[i], sortedArray[j], sortedArray[k], sortedArray[l]]) {
                        result.append([sortedArray[i], sortedArray[j], sortedArray[k], sortedArray[l]])
                    }
                    
                    k += 1
                    l -= 1
                    
                    while sortedArray[l] == sortedArray[l+1] && k<l {
                        l -= 1
                    }
                    while sortedArray[k] == sortedArray[k-1] && k<l {
                        k += 1
                    }
                } else if sum < target {
                    k += 1
                } else {
                    l -= 1
                }
            }
        }
    }
    return result
}
