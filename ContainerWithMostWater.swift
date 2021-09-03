//https://leetcode.com/problems/container-with-most-water/
func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var leftSide = 0
    var rightSide = height.count - 1

    while leftSide < rightSide {
       if height[leftSide] < height[rightSide]{
            maxArea = max(maxArea, height[leftSide] * (rightSide - leftSide))
            leftSide += 1
        } else {
            maxArea = max(maxArea, height[rightSide] * (rightSide - leftSide))
            rightSide -= 1
        }
    }

    return maxArea
}
