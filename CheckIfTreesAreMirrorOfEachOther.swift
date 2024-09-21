
public class BinaryNode<T> {
    public var value: T
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    init(value: T) {
        self.value = value
    }
}

func checkIfTreesAreMirror<T: Equatable>(node1: BinaryNode<T>?, node2: BinaryNode<T>?) -> Bool {
    if node1 == nil && node2 == nil {
        return true
    }
    
    if node1 == nil || node2 == nil {
            return false
        }
    
    return (node1?.value == node2?.value) &&
               checkIfTreesAreMirror(node1: node1?.leftChild, node2: node2?.rightChild) &&
               checkIfTreesAreMirror(node1: node1?.rightChild, node2: node2?.leftChild)
    
}

var mirro1: BinaryNode<Int> = {
    let one = BinaryNode(value: 1)
    let two = BinaryNode(value: 2)
    let three = BinaryNode(value: 3)
    let four = BinaryNode(value: 4)
    
    one.leftChild = two
    one.rightChild = three
    three.leftChild = four
    
    return one
}()

var mirro2: BinaryNode<Int> = {
    let one = BinaryNode(value: 1)
    let two = BinaryNode(value: 2)
    let three = BinaryNode(value: 3)
    let four = BinaryNode(value: 4)
    
    one.leftChild = three
    one.rightChild = two
    three.rightChild = four
    
    return one
}()

checkIfTreesAreMirror(node1: mirro1, node2: mirro2)
