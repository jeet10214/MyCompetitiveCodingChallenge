
public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode where T:Equatable {
    public func depthFirst() {
        print(self.value)
        var traversalPending: [TreeNode] = children
        while traversalPending.count != 0 {
            let firstNode = traversalPending.first
            print(firstNode?.value ?? "No value")
            traversalPending.removeFirst()
            
            let childNodes = firstNode?.children ?? []
            
            for (i, child) in childNodes.enumerated() {
                traversalPending.insert(child, at: i)
            }
        }
    }
    
    public func levelOrderTraversal(visit: (TreeNode) -> Void) {
        visit(self)
        var traversalPending: [TreeNode] = children
        while traversalPending.count != 0 {
            let firstNode = traversalPending.first
            //print(firstNode?.value ?? "No value")
            traversalPending.removeFirst()
            
            let childNodes = firstNode?.children ?? []
            
            for child in childNodes {
                traversalPending.append(child)
                visit(child)
            }
        }
    }
    
    public func search(value: T) -> TreeNode? {
        var result: TreeNode?
        levelOrderTraversal { treeNode in
            if treeNode.value == value {
                result = treeNode
            }
        }
        
        return result
    }
}

let tree = TreeNode("Beverages")
let hot = TreeNode("hot")
let cold = TreeNode("cold")
let tea = TreeNode("tea")
let coffee = TreeNode("coffee")
let chocolate = TreeNode("cocoa")
let blackTea = TreeNode("black")
let greenTea = TreeNode("green")
let chaiTea = TreeNode("chai")
let soda = TreeNode("soda")
let milk = TreeNode("milk")
let gingerAle = TreeNode("ginger ale")
let bitterLemon = TreeNode("bitter lemon")
tree.add(hot)
tree.add(cold)
hot.add(tea)
hot.add(coffee)
hot.add(chocolate)
cold.add(soda)
cold.add(milk)
tea.add(blackTea)
tea.add(greenTea)
tea.add(chaiTea)
soda.add(gingerAle)
soda.add(bitterLemon)

tree.depthFirst()
tree.levelOrderTraversal { node in
    print(node.value)
}

if let node = tree.search(value: "chai") {
    print("yayayayayay found it")
}
