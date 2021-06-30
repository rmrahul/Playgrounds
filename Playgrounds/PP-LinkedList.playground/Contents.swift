

protocol Linkable : AnyObject{
    associatedtype D
    var value : D {get}
    var next : Self? {get set}
    var previous : Self? {get set}
    
    init(value : D)
}


final class Node<T> : Linkable{
    typealias D = T
    var value: T
    var next: Node<T>?
    var previous: Node<T>?
    
    required init(value: T) {
        self.value = value
    }
}


protocol LinkedListProtocol{
    associatedtype T
    func append(value : T)
    subscript(index : Int) -> T? {get}
    var first : T? {get}
    var last : T? {get}
}

class LinkedList<K> : LinkedListProtocol{
    fileprivate var head : Node<K>?
    fileprivate var tail : Node<K>?
    
    typealias T = K

    var first: K?{
        return head?.value
    }
    var last: K?{
        return tail?.value
    }

    func append(value: K) {
        let node = Node(value: value)
        
        if let last = tail{
            node.previous = last
            last.next = node
            tail = node
        }
        else{
            head = node
            tail = node
        }
    }
    
    
    subscript(index: Int) -> K? {
        get {
            let n = self.node(at: index)
            return n?.value
        }
    }
    
    private func node(at index:Int) -> Node<T>?{
        guard index >= 0,head != nil else {
            return nil
        }
        
        var node = head
        var i = 0
        
        while node != nil {
            if i == index{
                return node
            }
            i += 1
            node = node?.next
        }
        return node
    }
}

var linkedList : LinkedList<String> = LinkedList<String>()

linkedList.append(value: "rahul")
linkedList.append(value: "mane")
linkedList.append(value: "soe")

print(linkedList[1])

