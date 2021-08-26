func rotateLeft(d: Int, arr: [Int]) -> [Int] {
  var myArray = arr
  let size = myArray.count - 1
  for i in 0...size {
    let newloc = (i + (myArray.count - d)) % myArray.count
    myArray[newloc] = arr[i]
  }
  return myArray
}
