
import Foundation

//interface
protocol Stackable {
    associatedtype Element
    mutating func push(element : Element)
    func peek() ->Element?
    mutating func pop() -> Element?
}

//struct implement
struct Stack<T> : Stackable, CustomStringConvertible{
    typealias Element = T
    var elements : [Element] = []
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    func peek() -> T? {
        return elements.last
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    var description: String{
        return "Elements : \(elements.count)"
    }
}

var stackInt = Stack<Int>()
stackInt.push(element: 12)
stackInt.push(element: 13)
stackInt.push(element: 14)
print("Elements : \(stackInt)")
stackInt.pop()
print("Elements : \(stackInt)")

