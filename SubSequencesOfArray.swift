//Print subsequence of an Array with add and remove Algorithm

func sequence(array: [Int]) {
  subSequence(index: 0, array: [], originalArray: array)
}

func subSequence(index: Int, array: [Int], originalArray: [Int]) {
  if index >= originalArray.count {
    print(array)
    return
  }
  
  var newArray = array
  newArray.append(originalArray[index])
  subSequence(index: index + 1, array: newArray, originalArray: originalArray)
  newArray.removeLast()
  subSequence(index: index + 1, array: newArray, originalArray: originalArray)
}

sequence(array: [5,7,6])
