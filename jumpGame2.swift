https://leetcode.com/problems/jump-game-ii/

func jump(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return 0
    }
    
    var jumpsCount = 1
    var currentIndex = 1
    var reached = nums[0]
    
    while reached < nums.count-1 {
        var newReach = 0
        while currentIndex <= reached {
            newReach = max(newReach, reached + nums[currentIndex])
            currentIndex += 1
        }
        reached = newReach
        jumpsCount += 1
    }
    
    return jumpsCount
}
