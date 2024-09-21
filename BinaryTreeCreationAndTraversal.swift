
// MARK: Binary Tree

public class BinaryNode<T> {
    public var value: T
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    init(value: T) {
        self.value = value
    }
}

extension BinaryNode {
    public func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traverseInPreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traverseInPreOrder(visit: visit)
        rightChild?.traverseInPreOrder(visit: visit)
    }
    
    public func traverseInPostOrder(visit: (T) -> Void) {
        leftChild?.traverseInPostOrder(visit: visit)
        rightChild?.traverseInPostOrder(visit: visit)
        visit(value)
    }
    
    public func heightOfBinaryTree() -> Int {
        
        if leftChild == nil && rightChild == nil {
            return 0
        }
        
        let leftHeight = leftChild?.heightOfBinaryTree() ?? -1
        let rightRight = rightChild?.heightOfBinaryTree() ?? -1
        
        return 1 + max(leftHeight, rightRight)
    }
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

binaryTreeR.traverseInOrder {
    print($0)
}

binaryTreeR.traverseInPreOrder {
    print($0)
}

binaryTreeR.traverseInPostOrder {
    print($0)
}

binaryTreeR.heightOfBinaryTree()
