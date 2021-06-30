import Cocoa

class Node<T>{
    var data : T?
    var next : Node<T>?
    
    init(data : T?) {
        self.data = data
    }
}

class LinkedList<LT>{
    var headNode : Node<LT>?
    var tempNode : Node<LT>?
    
    func isEmpty() -> Bool {
        return headNode == nil
    }
    
    func append(value : LT){
        if let headNode = headNode{
            var newNode = Node<LT>(data: value)
            newNode.next = headNode
            
            self.headNode = newNode
        }
        else{
            var newNode = Node<LT>(data: value)
            headNode = newNode
        }
    }
    
}
