// Base Case: low == high then return
// calculate mid = (low + high) / 2
// Here we are breaking the entire array into 2 parts and we will traverse it from low to mid and mid + 1 to high
// We will break until our base case return is called 
// call recursion call with low = low and high =  mid in mergeSort func
// second call recursion with low = mid + 1 and high = high
// After both calls return merge the entire array
// For merging take an temp array and check left <= mid && right <= high until is true
// left part arr[left] <= arr[right] less than right then append left else append right
// append remaining elements from the left(left <= mid) and right(right <= high)
// make sorting in the reference array arr[i] = temp[i - low] using for loop from low to high


func mergeSort(arr: inout[Int], low: Int, high: Int) {
    if low == high {
        return
    }
    
    let mid = (low + high) / 2
    
    mergeSort(arr: &arr, low: low, high: mid)
    mergeSort(arr: &arr, low: mid + 1, high: high)
    
    merge(arr: &arr, low: low, mid: mid, high: high)
}

func merge(arr: inout[Int], low: Int, mid: Int, high: Int) {
    
    var temp: [Int] = []
    var left = low
    var right = mid + 1
    
    while left <= mid && right <= high {
        if arr[left] <= arr[right] {
            temp.append(arr[left])
            left += 1
        } else {
            temp.append(arr[right])
            right += 1
        }
    }
    
    while left <= mid {
        temp.append(arr[left])
        left += 1
    }
    
    while right <= high {
        temp.append(arr[right])
        right += 1
    }
    
    for i in low...high {
        arr[i] = temp[i - low]
    }
}

var array = [3, 4, 1, 6, 2, 5, 7]

mergeSort(arr: &array, low: 0, high: array.count - 1)

debugPrint(array)
