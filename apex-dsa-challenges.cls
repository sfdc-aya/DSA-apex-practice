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
Use case: Implement a Linked List
          A linked list a fundamental data structure in computer science. Linked data structures are used in heaps, graphs and trees.
          In this problem you need to implement a basic singly linked list. You are given a class and basic method signatures as well as a Node class. You will need to implement the following...
          A constructor to set the initial state of the class
          The method addToFront() it accepts an integer and puts it at the front of the list. This should be a constant time operation.
          the method removeFromFront(). This removes the element at the front of the list and returns its value. It should be a constant time operation. If the list is empty return null
          The method size(). This should return the current size of the list
          The method addToTail(). This adds an element to the end of the list. See if you can find a way to do it in constant time as a challenge
          The method removeFromTail(). Remove the last element in the list and return its value. If the list is empty return null
          Example 1
          LinkedList linkedList = new LinkedList();
          linkedList.addToFront(1);
          linkedList.addToFront(2);
          linkedList.size(); // 2
          linkedList.removeFromFront() // 2
          linkedList.size()// 1
          
          Example 2
          LinkedList LinkedList = new LinkedList();
          linkedList.addToTail(5);
          linkedList.addToTail(6);
          linkedList.addToFront(1);
          linkedList.addToFront(2);
          linkedList.size(); // 4
          linkedList.removeFromTail() // 6
          linkedList.removeFromTail() // 5
          linkedList.removeFromTail() // 1
          linkedList.removeFromFront() // 2
          linkedList.removeFromFront() // null
          linkedList.size() == 0;

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


3. Valid Palindrome 
Use case: A String is a considered a valid palindrome if it reads the same forwards and backwards. For the purpose of this problem, we consider a String to be a valid palindrome if it reads the same forwards and backwards after after converting all characters to lowercase, and removing all characters that are not a number or a letter.
          Given a String str, return true if is a valid palindrome given the definition above, and return false if it is not. Assume that the input will contain only English numbers and letters (0-9, a-z, A-Z) along with punctuation and spaces.
          Examples:
          isPalindrome('A man, a plan, a canal: Panama') returns true
          isPalindrome('Panama') returns false

public Boolean isPalindrome(String str){
//code here
    str = str.toLowerCase();
    String alpha = 'abcdefghijklmnopqrstuvwxyz';
    String num = '0123456789';
    String res = '';

    for(Integer i = 0; i < str.length(); i++){
        if(alpha.contains(str.substring(i,i+1)) || num.contains(str.substring(i,i+1))){
            res += str.substring(i,i+1);
        }
    }

    Integer l = 0;
    Integer r = res.length() - 1;
    while(l <= r){
        if(res.substring(l,l+1) != res.substring(r,r+1)){
            return false;
        }else{
            l++;
            r--;
        }
    }
    return true;
}


4. Merge Two Sorted Lists
Use case: A classic computer science problem is to merge to sorted lists. In this problem you must write a method that accepts two sorted lists of integers: list1, and list2 and returns a list sorted in ascending order containing all the values in list1 and lis2.
          Example 1
          input: list1 = [1, 3, 5, 7], list2=[2, 4, 6, 8];
          output: [1, 2, 3, 4, 5, 6, 7, 8]
          Example 2
          input: list1 = [1, 3, 5, 7], list2=[2, 4, 6, 8, 9, 10, 100];
          output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100];


