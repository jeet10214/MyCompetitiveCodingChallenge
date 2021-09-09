//https://leetcode.com/problems/combination-sum/

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sorted()
    var results = [[Int]]()
    var curr = [Int]()
    var sum = 0

    func helper(_ idx: Int) {
        if sum == target {
            results.append(curr)
            return
        }

        for jdx in idx ..< candidates.count {
            guard candidates[jdx] <= target - sum else { return }
            sum += candidates[jdx]
            curr.append(candidates[jdx])
            helper(jdx)
            sum -= curr.removeLast()
        }
    }

    helper(0)
    return results
}

combinationSum([2,3,6,7], 7)
