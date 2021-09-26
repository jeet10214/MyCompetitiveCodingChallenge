//Link: https://leetcode.com/problems/first-bad-version/

//Below Function is for reference 
// func isBadVersion(_ version: Int) -> Bool{
//     if version >= 2 {
//         return true
//     }
//     return false
// }

func firstBadVersion(_ n: Int) -> Int {
    var firstRelease = 1
    var lastRelease = n

    while firstRelease <= lastRelease {
        let middle = firstRelease + (lastRelease - firstRelease) / 2
        if isBadVersion(middle) {
            lastRelease = middle - 1
        } else {
            firstRelease = middle + 1
        }
    }

    return firstRelease
}
