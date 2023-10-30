// Given we have 2 arrays
// Brute for is to use 2 pointer approach with ind1 = 0 & ind2 = 0 and individually comparing and then moving them ahead with storing the results in 3rd array.
// Optimised solution is to start ind1 = arr1.count - 1 & ind2 = 0
// swap variables with these indexes untill arr1[arr1Ind] > arr2[arr2Ind] is false and decrement ind1 by 1 and increment ind2 by 1
// sort the individual arrays


func mergeTwoSortedArraysWithoutExtraSpace(arr1: inout [Int], arr2: inout [Int]) {
    var arr1Ind = arr1.count - 1
    var arr2Ind = 0
    
    while arr1[arr1Ind] > arr2[arr2Ind] {
        let temp = arr1[arr1Ind]
        arr1[arr1Ind] = arr2[arr2Ind]
        arr2[arr2Ind] = temp
        
        arr1Ind -= 1
        arr2Ind += 1
    }
    
    arr1 = arr1.sorted()
    arr2 = arr2.sorted()
}

var arr1 = [1,8,8]
var arr2 = [2,3,4,5]

mergeTwoSortedArraysWithoutExtraSpace(arr1: &arr1, arr2: &arr2)
