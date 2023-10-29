// Sort the array with subarrays
// add first value to final array list
// remove it from the source of arraylist
// Iterate through and check the below conditions
// - check if valueArray[0] < mergedArray[mergedArray.count - 1][1]
// - valueArray[1] >= mergedArray.last?[1] ?? 0
//   above conditions are true then increase the range of added subarray
//      mergedArray[mergedArray.count - 1][1] = valueArray[1]
// else add the iterated array in mergedArray list
// return mergedArray list


func mergeOverlappingArray(array: [[Int]]) -> [[Int]] {
    
    var mergedArray: [[Int]] = []
    var newArray = array.sorted(by: { $0[0] < $1[0] })
    debugPrint(newArray)
    
    mergedArray.append(newArray[0])
    
    newArray.removeFirst()
    for valueArray in newArray {
        
        if valueArray[0] < mergedArray[mergedArray.count - 1][1]  {
            if valueArray[1] >= mergedArray[mergedArray.count - 1][1] {
                mergedArray[mergedArray.count - 1][1] = valueArray[1]
            }
            
        } else {
            mergedArray.append(valueArray)
        }
    }
    
    return mergedArray
}

mergeOverlappingArray(array: [[1,3], [2,6], [8,9], [9,11], [8,10], [2,4], [15, 18], [16, 17]])
