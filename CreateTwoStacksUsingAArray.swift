//Create two stacks using an Array

final class TwoStacksUsingArray: NSObject {
    
    override init() {}
    
    private var array: Array<Int> = Array(repeating: 0, count: 1000)
    private var count1 = 0
    private var count2 = 0
    
    public func puspInStack1(element: Int) {
        array.insert(element, at: count1)
        count1 += 1
    }
    
    public func pushInStack2(element: Int) {
        array.insert(element, at: array.count - count2)
        count2 += 1
    }
    
    public func popInStack1() {
        count1 -= 1
    }
    
    public func popInStack2() {
        count2 -= 1
    }
    
    public func printStack1() {
        for i in 0...count1-1 {
            print(array[i])
        }
    }
    
    public func printStack2() {
        for i in 1...count2 {
            print(array[array.count - i])
        }
    }
}
