
var str = "Hello, playground"

class StackElement<SE>{
    var data : SE?
}

class Stack<StackElement>{
    var array : [StackElement]?
    
    init() {
        array = [];
    }
    
    func push(element : StackElement?){
        guard let element = element else {
            return
        }
        array?.append(element)
    }
    
    
    func pop() -> StackElement?{
        return array?.popLast()
    }
}

var stackOfInteger = Stack<Int>()
stackOfInteger.push(element: 11)
stackOfInteger.push(element: 12)
stackOfInteger.push(element: 13)

print("Stack element : ", stackOfInteger.pop())
print("Stack element : ", stackOfInteger.pop())

