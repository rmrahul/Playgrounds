
protocol BinaryTreeNodeProtocol : AnyObject{
    associatedtype B
    var data : B {get}
    var left : Self? {get set}
    var right : Self? {get set}
    
    init(data : B)
}

final class BinaryTreeNode<BTN> : BinaryTreeNodeProtocol{
    typealias B = BTN
    
    var data: BTN
    
    var left: BinaryTreeNode<BTN>?
    
    var right: BinaryTreeNode<BTN>?
    
    init(data : BTN) {
        self.data = data
    }
}

protocol BinarySearchTreeProtocol{
    associatedtype T
    func insert(element: T)
    func inOrder()
}

final class BinarySearchTree<BST : Comparable> : BinarySearchTreeProtocol{
    typealias T = BST
    private var rootNode : BinaryTreeNode<BST>?
    
    func insert(element: BST) {
        print("inserting element")
        var newNode = BinaryTreeNode(data: element)
        if let root = rootNode{
            self.insertNode(rootNode: root, newNode: newNode)
        }
        else{
            rootNode = newNode
        }
    }
    
    func inOrder() {
        inOrder(rootNode: rootNode)
    }
    
    private func inOrder(rootNode : BinaryTreeNode<BST>?){
        guard let node = rootNode else {
            return
        }
        
        self.inOrder(rootNode: rootNode?.left)
        print("Value : \(node.data)")
        self.inOrder(rootNode: rootNode?.right)
    }
    
    private func insertNode(rootNode : BinaryTreeNode<BST>, newNode : BinaryTreeNode<BST>){
        if newNode.data < rootNode.data{
            //left side
            if let left = rootNode.left{
                insertNode(rootNode: left, newNode: newNode)
            }
            else{
                rootNode.left = newNode
            }
        }
        else{
            //right side
            if let right = rootNode.right{
                insertNode(rootNode: right, newNode: newNode)
            }
            else{
                rootNode.right = newNode
            }
        }
    }
}

var binarySearchTree = BinarySearchTree<Int>()
binarySearchTree.insert(element: 5)
binarySearchTree.insert(element: 2)
binarySearchTree.insert(element: 3)
binarySearchTree.insert(element: 1)
binarySearchTree.insert(element: 12)


binarySearchTree.inOrder()
