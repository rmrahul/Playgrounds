import Foundation

var str = "Hello, playground"


class TreeNode<T>{
    var data : T
    var left : TreeNode?
    var right : TreeNode?
    
    init(data : T, left : TreeNode? = nil, right : TreeNode? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}

class BinarySearchTree<T : Comparable & CustomStringConvertible>{
    private var rootNode : TreeNode<T>?
    
    func insert(element : T){
        let node = TreeNode(data: element)
        if let rootNode = self.rootNode{
            self.insert(rootNode: rootNode, node: node)
        }
        else{
            rootNode = node
        }
    }
    
    private func insert(rootNode : TreeNode<T>, node : TreeNode<T>){
        if rootNode.data > node.data{
            //left side
            if let leftNode = rootNode.left{
                self.insert(rootNode: leftNode, node: node)
            }
            else{
                rootNode.left = node
            }
        }
        else{
            //right side
            if let rightNode = rootNode.right{
                self.insert(rootNode: rightNode, node: node)
            }
            else{
                rootNode.right = node
            }
        }
    }
    
    //NLR, LNR LRN,
    //Pre, in, post
    
    

    func inOrder(node : TreeNode<T>?){
        guard let node = node else {
            return
        }
        let s = String(describing: node.data)

        self.inOrder(node: node.left)
        print("Data : \(node.data) \(s)")
        self.inOrder(node: node.right)
    }
    
    func preOrder(node : TreeNode<T>?){
        guard let node = node else {
            return
        }
        let s = String(describing: node.data)
        print("Data : \(node.data) \(s)")
        self.inOrder(node: node.left)
        self.inOrder(node: node.right)
    }
    
    func postOrder(node : TreeNode<T>?){
        guard let node = node else {
            return
        }
        self.inOrder(node: node.left)
        self.inOrder(node: node.right)
        let s = String(describing: node.data)
        print("Data : \(node.data) \(s)")
    }
    
    func traverse() {
        self.inOrder(node: self.rootNode)
        
        print("---- Pre Order")
        self.preOrder(node: self.rootNode)
        
        print("---- Post order")
        self.postOrder(node: self.rootNode)
    }
}


let tree = BinarySearchTree<Int>()
tree.insert(element: 5)
tree.insert(element: 9)
tree.insert(element: 3)

tree.traverse()

print("Somehi")

