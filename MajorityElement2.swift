
// Initialise element1, element2 with Int.min and count1, count2 with 0
// Run for loop
// - Check if count1 == 0 && num != element2 if true store
        //element1 = num
        //count1 = 1
// - Check if count2 == 0 && num != element1 if true store
        //element2 = num
        //count2 = 1
// - element1 == num if true increase count1 by 1
// - element2 == num if true increase count2 by 1
// If none of the above are true then count1 & count2 decrement by 1 each
// Calcute min = arr.count/3, set count1 = 0, count2 = 0
// Run for loop
// if element1 == num then count1 += 1
// if element2 == num then count2 += 1
// Create a new Arr and calculate mid = nums.count/3 + 1
// if count1 >= mid then arr.append(element1)
// if count2 >= mid then arr.append(element2)
// arr = arr.sorted(), sort the elements of array
// return arr

func majorityElement2SecondMethod(_ nums: [Int]) -> [Int] {
    var element1 = Int.min
    var element2 = Int.min
    
    var count1 = 0
    var count2 = 0
    
    for num in nums {
        if count1 == 0 && num != element2 {
            count1 = 1
            element1 = num
        } else if count2 == 0 && num != element1 {
            count2 = 1
            element2 = num
        } else if element1 == num {
            count1 += 1
        } else if element2 == num {
            count2 += 1
        } else {
            count1 -= 1
            count2 -= 1
        }
    }
    
    var arr: [Int] = []
    count1 = 0
    count2 = 0
    
    for num in nums {
        if element1 == num {
            count1 += 1
        } else if element2 == num {
            count2 += 1
        }
    }
    
    var mini = (nums.count / 3) + 1
    if count1 >= mini {
        arr.append(element1)
    }
    if count2 >= mini {
        arr.append(element2)
    }
    
    arr.sorted()
    
    return arr
}

majorityElement2SecondMethod([3,3,4])


func majorityElement2(_ nums: [Int]) -> [Int] {
    let maxCount = nums.count / 3
    var dic: [Int: Int] = [:]
    var resultArray: [Int] = []
    for num in nums {
        dic[num] = (dic[num] ?? 0) + 1
        if dic[num]! > maxCount {
            if !resultArray.contains(num) {
                resultArray.append(num)
            }
        }
    }
    
    return resultArray
}

majorityElement2([3,2,3])

