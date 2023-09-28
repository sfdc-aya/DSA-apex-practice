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

public class Stack {
    private List<Integer> stackList;

    public Stack() {
        stackList = new List<Integer>();
    }

    // Push: Add an object to the top of the stack
    public void push(Integer item) {
        stackList.add(item);
    }

    // Pop: Remove and return the object at the top of the stack
    public Integer pop() {
        if (isEmpty()) {
            return null; // Stack is empty
        }
        return stackList.remove(stackList.size() - 1);
    }

    // Peek: Return the object at the top of the stack without removing it
    public Integer peek() {
        if (isEmpty()) {
            return null; // Stack is empty
        }
        return stackList.get(stackList.size() - 1);
    }

    // Size: Return the number of objects in the stack
    public Integer size() {
        return stackList.size();
    }

    // IsEmpty: Return true if the stack is empty, false if not
    public Boolean isEmpty() {
        return stackList.isEmpty();
    }
}


2. Implement A Singly Linked List
Use case: 

public class LinkedList{
    Node head;

    Node tail;

    Integer size;

    public LinkedList(){

        this.head = null;

        this.tail = null;

        this.size = 0;

    }

    public void addToFront(Integer value){

        Node node = new Node();

        node.data = value;

        if (this.head == null) {

            this.head = node;

            this.tail = this.head;

        } else {

            //do this in order

            node.next = this.head;

            head = node;

        }

        this.size++;

    }

    public Integer removeFromFront(){

        if(size == 0){

            return null;

        }

        Integer value = head.data;

        head = head.next;

        size--;

        return value;

    }

    public void addToTail(Integer value){

        Node newNode = new Node();

        newNode.data = value;

        if (head == null) {

            head = newNode;

            tail = head;

        }else {

            this.tail.next = newNode;

            this.tail = newNode;

        }

        size++;

    }

    public Integer removeFromTail(){

        if(size() == 0 ){

            return null;

        } else if(size() == 1){

            Integer data = head.data;

            head = null;

            size --;

            return data;

        } 

        Node current = head;

        Node newTail = null;

        while (current.next != null) {

            newTail = current;

            current = current.next;

        }

        Integer data = current.data;

        tail = newTail;

        tail.next = null; 

        size --;

        return data;

    }

    public Integer size(){

        return this.size;

    }

}

public class Node{

    Integer data;

    Node next;

}
