//https://leetcode.com/problems/maximum-number-of-jumps-to-reach-the-last-index/description/

func maxJumps(jumpArray: [Int], k: Int) -> Int {
    var dp: [Int] = Array(repeating: -1, count: jumpArray.count)
    dp[0] = 0

    for i in 1..<jumpArray.count {
        for j in 0..<i {
            if abs(jumpArray[j] - jumpArray[i]) <= k && dp[j] != -1 {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }

    return dp[jumpArray.count - 1]
}

maxJumps(jumpArray: [1,3,6,4,1,2], k: 2)
