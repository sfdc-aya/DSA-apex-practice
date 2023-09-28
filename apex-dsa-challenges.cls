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

public static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2){
    list1.addAll(list2);
    list1.sort();
    System.debug(list1);
    return list1;
}


5. Binary Search Opportunites
Use case: Given a list of opportunities sorted by the Amount field and an Integer target, implement a solution to search the list and return the index of the opportunity with an amount that is equal to the target.
          In the list does not contain a matching value return negative 1.
          Example 1
          input: opportunities = [ {opp1, amount = 100}, {opp2, amount = 200}, {opp3, amount = 300}] target = 200;
          output: 1; this is the index of opportunity with an amount = to the target
          Example 2
          input: opportunities = [ {opp1, amount = 100}, {opp2, amount = 200}, {opp3, amount = 300}] target = 500;
          output: -1; The list does not contain a matching value
          Important constraint: A solution that uses a loop to check ALL opportunities will time out. Look for a solution faster than the linear solution.

public static Integer search(List<Opportunity> opportunities, Integer target){
    if(opportunities?.size() == 0 || target ==0)

    return -1;

      Integer left = 0;

    Integer right = opportunities.size() - 1;

    while (left <= right) {

        Integer mid = left + (right - left) / 2;

        if ((Integer)opportunities.get(mid).Amount == target) {

            return mid; // Found a matching opportunity

        } else if ((Integer)opportunities.get(mid).Amount < target) {

            left = mid + 1; // Target is in the right half

        } else {

            right = mid - 1; // Target is in the left half

        }

    }

    return -1; // No matching value found
}


6. Valid Anagram
Use case: Two words are considered valid anagrams if they are composed of the exact same letters with the exact same frequency. Implement the method isAnagram that takes as input two strings s1 and s2, and returns true if the two words are anagrams. Assume that the two strings contain only lowercase alphabets a-z.
          Examples:
          isAnagram('apex', 'peax') == true
          isAnagram('sandbox', 'sandpit') == false

public boolean isAnagram(String s1, String s2) {
    //Code here
    if(s1==null || s2==null) return false;
    else if(s1.length() != s2.length()) return false;
    map<String,Integer> map1 = new map<String,Integer>();
    
    for(Integer i=0;i<s1.length();i++){
        if(map1.containskey(s1.substring(i,i+1))){
            Integer val = map1.get(s1.substring(i,i+1));
            map1.put(s1.substring(i,i+1),val+1);
        }
        else map1.put(s1.substring(i,i+1),1);

        if(map1.containskey(s2.substring(i,i+1))){
            Integer val = map1.get(s2.substring(i,i+1));
            map1.put(s2.substring(i,i+1),val-1);
        }
        else map1.put(s2.substring(i,i+1),-1);
    }

    for(Integer i:map1.values()){
        if(i != 0) return false;
    }
    return true;
}


7. Add One
Use case: A large integer number is given as a List of Integers from 0 to 9. You have to add 1 to that number and modify the list to represent the resulting number.

          Example 1:
          Input: number = [1,2,3]
          Output: [1,2,4]
          Explanation: The array represents the integer 123.
          Incrementing by one gives 123 + 1 = 124.
          Thus, the result should be [1,2,4].
          
          Example 2:
          Input: number = [9]
          Output: [1,0]
          Explanation: The array represents the integer 9.
          Incrementing by one gives 9 + 1 = 10.
          Thus, the result should be [1,0].
          
          Example 3:
          Input: number = [1,2,9]
          Output: [1,3,0]
          Explanation: The array represents the integer 129.
          Incrementing by one gives 129 + 1 = 130.
          Thus, the result should be [1,3,0].

public void plusOne(List<Integer> numbers) {
    for (Integer i=numbers.size() - 1; i >= 0; i--) {
        numbers[i]++;

        if (numbers[i] <= 9) { 
            return;
        }
        else numbers[i] = 0;
    }
    numbers.add(0, 1);
}


8. Valid Subsequence
Use case: Given a method that takes two strings s1 and s2 return true if s1 is a subsequence of s2.
          A valid subsequence means that string s1 can be formed from string s2 by deleting some characters, but maintaining the order.
          Example 1
          Input: s1 = 'abc', s2 = 'aghlrbrrc'
          Output: true
          
          Input: s1 = 'abc', s2 = 'caaab'
          Output: false
          
          Constraints
          s1 and s2 will only consist of lowercase English letters.
          s2 will always be longer than s1

public Boolean isSubSequence(String s1, String s2){
    Integer lastIndex = -1;

    for(String s : s1.split('')){
        if(s2.indexOf(s) < lastIndex) return false;
        lastIndex = s2.indexOf(s);
    }
    return true;
}


9. Reverse Words In String
Use case: Given a string that contains a sequence of words separated by spaces, write a method that reverses the order of the characters in each word.
          You must maintain white space and the order of the words.
          
          Example 1:
          Input: lets learn apex strings
          Output: stel nrael xepa sgnirts
          
          Example 2:
          Input: DSA is fun
          Output: ASD si nuf

public static String reverseWords(String str){

List<String> listStringinInitialOrder = str.split(' ');
    List<String> listStringReversedOrder  = new list<string>();
    for(String eachString : listStringinInitialOrder){
        String sBuilder = '';
        for (integer i = eachString.length()-1 ; i>=0 ; i--){
            sBuilder =  sBuilder + eachString.substring(i,i+1);
        }
        listStringReversedOrder.add(sBuilder);
    }
    return String.join(listStringReversedOrder, ' ');
}


10. Buy Low and Sell High
Use case: You are given a list of integers that represent the daily closing price of a stock. Write a program to maximize your profit by choosing the best day to buy and the best to sell. price.get(i) represents the stock price on a given day i.
          
          Return the maximum profit. If no profit is possible return 0. You should be able to solve this in O(n) time.
          You may assume the maximum price for this problem is 10000

          Example 1
          Input: prices = [10, 2, 5, 3, 8, 4]
          Output: 6
          
          If we buy on day 2 the price is 2. If we sell on day 5 the price is 8. 8 -2 = 6; You can not buy on day 2 and sell on day 1.
          
          Example 2
          Input: prices = [7,6,4,3,1]
          Output: 0
          Explanation: In this case, no transactions are done and the max profit = 0.

public Integer maxProfit(List<Integer> prices){
    //code here
        Integer minPrice = 10000;
        Integer maxProfit = 0;
        for (Integer price : prices) {
            if (price < minPrice) {
                minPrice = price;
            } else {
                maxProfit = Math.max(maxProfit, price - minPrice);
            }
        }
        return maxProfit;
}


11.  Square a sorted list
Use case: Given a list of integers sorted in ascending order return a list of integers that contains the square of each value in the input list sorted in ascending order.

          Example 1
          Input: nums = [2, 4, 6, 8]
          Output: 1; [4, 16, 36, 64];
          
          Example 2
          Input: nums = [-10, 2, 4, 6, 8]
          Output: [4, 16, 36, 64, 100]

public static List<Integer> squareList(List<Integer> nums){
     //We have to account for negative numbers
    Integer left = 0;
    Integer right = nums.size() -1;
    Integer highestIndex = nums.size() -1;
    List<Integer> solution = new List<Integer>(nums.size());
    //basic two pointer
    
    while(left <= right ){
        Integer leftSquare = nums[left] * nums[left];
        Integer rightSquare = nums[right] * nums[right];
       if(leftSquare > rightSquare){ 
           solution[highestIndex--] = leftSquare;
           left ++;
       }else {
           solution[highestIndex--] = rightSquare;
           right--;
       }
    }   
     return solution;
}


12. Segregate Even and Odd numbers
Use case: Given a List of Integers (List<Integer>), write a function that segregates even and odd numbers. The function should put all even numbers first, and then odd numbers.

          You are required to modify the list that is passed. Try doing so without creating any extra lists, which would mean an O(1) space complexity.
          Example 1:
          Input: [5, 4, 3, 2, 1, 6]
          Output: [2, 4, 6, 1, 3, 5]
          
          The above output may vary since you are not required to order the even and odd numbers in any sequence. As long as even numbers come before odd numbers, the answer is valid. [4, 6, 2, 5, 1, 3] and [6, 4, 2, 3, 1, 5] are also valid answers.
          Example 2:
          Input: [12, 34, 45, 9, 8, 90, 3]
          Output: [8, 12, 34, 90, 3, 9, 45]

public static void segregateEvenOdd(List<Integer> numbers){
    Integer low = 0;
    Integer high = numbers.size() - 1;

    while(low < high){
        Boolean isLowEven = Math.mod(numbers[low], 2) == 0;
        Boolean isHighOdd = Math.mod(numbers[high], 2) != 0;

        if(!isLowEven && !isHighOdd){
            Integer temp = numbers[low];
            numbers[low] = numbers[high];
            numbers[high] = temp; 
        }

        if(isLowEven) low++;
        if(isHighOdd) high--;
    }
}


13. Balanced Parentheses
Use case: Given a String s containing only the six characters '(', '{', '[', ']', '}', and ')', return true only if every opening bracket has a matching closing bracket of the same type, and all brackets are closed in the correct order.
          Examples:
          
          input: '()[(())]', Output: true
          Input: '([{}]))', Output: false
          Input: '([]}', Output: false

public Boolean isValid(String s){
    //code here 
List<String> stack = new List<String>();
Set<String> validInput = new Set<String>{'(','{','[',')','}',']'};

Map<String,String> validParanthesisMap = new Map<String,String>{
    '}'=>'{',
    ')'=>'(',
    ']'=>'['
};

for(String str : s.split('')){
    if(!validInput.contains(str))
    return false;
    if(stack.isEmpty() == true)
        stack.add(str);
    else{
        if(validParanthesisMap.containsKey(str)){
        String peep = validParanthesisMap.get(str);
        if(peep == stack.get(stack.size()-1))
        stack.remove(stack.size()-1);
    }
        else
         stack.add(str);
    }
}

if(stack.isEmpty())
return true;
else
return false;
}


14. Defragging
Use case: You are given a List of Integers which represents memory with -1 representing empty space and all other Integers representing. Your task is to move all the empty spaces to the end of the list while maintaining the order of the rest of the elements.
          Note: that you must do this in-place without making a copy of the array.
          
          Examples:
          Input: [-1,1,-1,3,12]
          Output: [1,3,12,-1,-1]
          Input: [-1,1,0,15,2]
          Output: [1,0,15,2,-1]

public void defragging(Integer[] memory){
    // code here
    Integer i = 0;
    Integer j = 0;
    Integer n = memory.size();

    while (j < n) {
        if (memory[j]!= -1) {
            memory.set(i, memory[j]);
            i++;
        }
        j++;
    }

    while (i < n) {
        memory.set(i, -1);
        i++;
    }
}


15. Two Sum
Use case: You are given a list of unsorted integers and a target value. If the list contains two values that add up to target, return a list containing the indexes of the two numbers. You may not use a number more than once. Every input will have a solution.

          Tests will include lists of up to 10,000 members. Only solutions that run in linear time will pass.
          
          Example 1
          Input: nums = [2,8,11,15], target = 10 Output: [0,1] nums[0] + nums[1] = 10
          
          Example 2
          Input: nums = [6,6,3,22, 1, 11, 56], target = 4 Output: [2,4] nums[2] + nums[4] = 4


16. Maximum Sub-array
Use case: Given a list of Integers that can contain positive and negative values and an Integer target, calculate the maximum subarray of the length of the target.

          Example
          Input: nums: [2, 3, -5, 1, 8] and target = 2
          Output: 9
          The largest continuous subarray is 1 and 8.
          Constraints
          Your solution should be able to handle data sets up to 5000 members

public static Integer maxSubArraySum(List<Integer> nums, Integer target){
//code here
    Integer maxval= 0;
    for(Integer i=0;i<target;i++)
        maxval+=nums[i];
    Integer currval;
    Integer i=0;
    
    while(i<nums.size()-target){
        currval = nums[i];
        for(Integer j = i+1; j<i+target; j++){
            currval+=nums[j];
        }
        if(currval>maxval) maxval=currval;
        i++;
    }

    if(target==1 && nums[nums.size()-1]>maxval) return nums[nums.size()-1];
    return maxval;
}


17. Two Sum II
Use case: Given a list of integers that are sorted in ascending order, return the indices of the two numbers that add up to a target value.
          Constraints:
          
          Each problem will have only one solution if any. You may return null or an empty list of no solution is found.
          You should attempt to solve this in constant space and linear run-time. This means a solution using nested loops or a Map will not work.
          Inputs can contain up two 10,000 values
          Example 1
          Input: prices = [2,7,11,15], target = 9
          Output: [0, 1], because the sum of 2 and 7 is 9.
          Example 2
          Input: [4, 8, 10, 22], target = 30
          Output: [1, 3] because the sum of 8 and 22 is 30

public List<Integer> twoSum(List<Integer> nums, Integer target){
    //code here
    Integer left = 0;
    Integer right = nums.size() -1; 
    while(left < right){
        Integer sum = nums[left] + nums[right];
        if(sum == target){
            return new List<Integer>{left, right};
        }else if (sum < target){
            left++;
        }else right --;
    }
    return new List<Integer>();
}


18. Count-and-say the Sequence
Use case: Can you count and say what characters the string '11121' has?
          It has three '1' characters, followed by one '2', and finally one '1'. Or to put it another way, it has 3 1s, 1 2s and 1 1, which we could write as the string '311211'. For this problem, we define this transformation as "counting and saying". Counting and saying '11121' is '311211'.
          For this problem, you have to generate a sequence given an Integer N. We define base case for N = 1 as '1'. For N > 1, count and say the sequence generated by N - 1.
          
          Examples:
          countAndSay(1) == '1' // base case
          countAndSay(2) == '11' // previous sequence has one 1.
          countAndSay(3) == '21' // previous sequence has two 1s
          countAndSay(4) == '1211' // previous sequence has one 2, one 1
          countAndSay(5) == '111221' // ... and so on
          countAndSay(6) == '312211'
          countAndSay(7) == '13112221'
          Write a function that takes N (sequence number) as a parameter and outputs the Nth sequence. 1<= N <= 20

public string countAndSay(integer N) {
    // code here
     String res = '';
    for (Integer i = 0; i < N; i++){
        res = process(res);
    }
    return res;
}

public String process(String s){
    if (String.isEmpty(s))
        return '1';
    String res = '';
    Integer i = 0;
    Integer n = s.length();
    List<String> sp = s.split('');
    while (i < n){
        Integer j = i + 1;
        Integer count = 1;
// COUNT DUPLICATE
        while (j < n && sp.get(j - 1) == sp.get(j)){
            count++;
            j++;
        }
        if (i < n){
            res += count + '' + sp.get(i);
        }
        i = j;
    }
    return res;
}


19. Find Common Characters
Use case: Given list of strings: strs, implement a method that will return all the common characters in the list. The character should be repeated in the list according the minimum frequency that it occurs in the list. The input will only consist of lower case letters in the English alphabet.
          
          Example 1
          input: strs = ['cook', 'lock', 'cool,]
          output: ['c', 'o'];
          
          input: strs = ['bella', 'label', 'roller']
          output: ['e', 'l', 'l'];

public List<String> commonChars(List<String> strs){
    //solution here
    Integer[] listCount = new Integer[26];
    for (Integer i = 0; i < 26; i++)
        listCount[i] = 2147483647;
    for (String s : strs){
        Integer[] wordCount = new Integer[26];
        for (Integer i = 0; i < 26; i++)
            wordCount[i] = 0;
        for (Integer i = 0; i < s.length(); i++){
            wordCount[s.charAt(i) - 97] = wordCount[s.charAt(i) - 97] + 1;
        }

        System.debug(wordCount);
        for (Integer i = 0; i < 26; i++)
            listCount[i] = Math.min(listCount[i], wordCount[i]);
    }

    System.debug(listCount);
    List<String> res = new List<String>();
    for (Integer i = 0; i < 26; i++){
        Integer count = listCount[i];
        while (count > 0){
            count--;
            String myChar = String.fromCharArray(new List<integer>{ i + 97 });
            res.add(myChar);
        }
    }
    return res;
}


20. Longest Substring With Max K Distinct Characters
Use case: 

