
public class BinaryNode<T> {
    public var value: T
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    init(value: T) {
        self.value = value
    }
}

func checkIfTreeIdentical<T: Equatable>(node1: BinaryNode<T>?, node2: BinaryNode<T>?) -> Bool {
    
    // If both nodes are nil, they are identical
    if node1 == nil && node2 == nil {
        return true
    }
    
    // If one of the nodes is nil and the other is not, they are not identical
    if node1 == nil || node2 == nil {
        return false
    }
    
    return checkIfTreeIdentical(node1: node1?.leftChild, node2: node2?.leftChild) && checkIfTreeIdentical(node1: node1?.rightChild, node2: node2?.rightChild)
}

var binaryTreeR: BinaryNode<Int> = {
  let zero = BinaryNode(value: 0)
  let one = BinaryNode(value: 1)
  let five = BinaryNode(value: 5)
  let seven = BinaryNode(value: 7)
  let eight = BinaryNode(value: 8)
  let nine = BinaryNode(value: 9)
  seven.leftChild = one
  one.leftChild = zero
  one.rightChild = five
  seven.rightChild = nine
  nine.leftChild = eight
  return seven
}()


var binaryTreeRP: BinaryNode<Int> = {
  let zero = BinaryNode(value: 0)
  let one = BinaryNode(value: 1)
  let five = BinaryNode(value: 5)
  let seven = BinaryNode(value: 7)
  let eight = BinaryNode(value: 8)
  let nine = BinaryNode(value: 9)
    let eleven = BinaryNode(value: 11)
  seven.leftChild = one
  one.leftChild = zero
  one.rightChild = five
  seven.rightChild = nine
  nine.leftChild = eight
    nine.rightChild = eleven
  return seven
}()

checkIfTreeIdentical(node1: binaryTreeR, node2: binaryTreeRP)
