1. Implement A Stack
Use case: The stack is one of the simplest data structures and almost one of the most important in programing. We use a stack to organize objects with the Last In - First Out (LIFO) principle. A user may add to the stack at any time, but may only have access to the object that was last inserted into the stack.
          In this challenge you will implement a stack data structure with the following methods.
          Push : add an object to the top of the stack
          Pop: remove the object at the top of the stack
          Peek: return the object at the top of the stack but do not remove
          Size: return the number of objects in the stack
          Is Empty: return true is the stack is empty, false if not
          Example
          stack.push(1), stack.push(2), stack.push(3) stack.push(4) ,
          stack.isEmpty() //false stack.size() // 4 stack.peek() // 4 stack.pop() // 4 stack.pop() // 3 stack.size() // 2 stack.peek() // 2 stack.pop() // 2 stack.pop() // 1 stack.size() // 0 stack.isEmpty() // true stack.pop() // null

