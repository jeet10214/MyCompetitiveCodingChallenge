//Using Sliding Window Approach 

func longestSubstring(str: String) {
    let mainStr = Array(str)
    var length = 0
    var strSet: [Character] = []
    var left = 0
    var right = 0
    
    while right < mainStr.count {
        print(right)
        if !strSet.contains(mainStr[right]) {
            strSet.append(mainStr[right])
            length = max(length, (right - left) + 1)
            right += 1
            
        } else {
            let index = strSet.firstIndex(where: {$0 == mainStr[left]}) ?? 0
            strSet.remove(at: index)
            left += 1
        }
    }
    
    print(strSet)
    print(length)
}
