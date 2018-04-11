package cs112;

import java.util.*;

public class Node {

	protected Node next;
	protected Node previous;
	protected String name;
	public static Scanner stdin = new Scanner(System.in);
	public Node(String name,Node next){
		this.name = name;
		this.next = next;
	}
	public String toString(){
		return "Name: "+name;
	}

	public static void main(String[] args){
		LinkedList names = new LinkedList();
		String name;

		for(int i = 0; i<5; i++){

			System.out.print("Enter name "+(i+1)+": ");
			name = stdin.nextLine();
			names.addToList(name);
		}
		System.out.println("Linked List:");
		names.displayList();

		System.out.println("\nPrinting a string of nodes:\n"+names.nodeToString(names.head));
		System.out.println("\nPrinting backwards using recursion: ");
		names.printBackwards(names.head);
		//names.deleteEveryOther();
		System.out.println("\n\nFront Node");
		System.out.println(names.addBeforeLast(names.head,"JohnDoe")+"\n\nAdded before last.");
		names.displayList();
		System.out.println("\nNumber of occurence = "+names.numberOfOccurrences("leo"));
		//System.out.println("\nHead of names = "+names.head.name);
		System.out.println("All occurrences with leo were deleted.\nFirst node is: "+names.deleteAllOccurrences("leo").name);
		names.displayList();
		System.out.println("\n\nAdded before last.\nFirst node is: "+names.addBeforeLast(names.head,"bob").name);
		System.out.println("\n\nAdded before last.\nFirst node is: "+names.addBeforeLast(names.head,"jan").name);
		names.displayList();
		System.out.println("\nLinked List:\n"+names.nodeToString(names.head));
		System.out.println("\nLinked List backwards:\n"+names.nodeToString(names.printBackwardsII(names.head)));

		/*
		names.deleteEveryOther();
		names.deleteEveryOther();
		names.deleteEveryOther();
		 */
		//System.out.print(names.searchName("leo"));
		//names.displayReverse();
		//names.deleteNode("Leonardo");
	}
}

class LinkedList {
	Node head;
	int count = 0;
	public void addToList(String name){
		/*
		//Way I
		Node newLink = new Node(name,null);
		if(head == null)
			head = newLink;
		else{
			 newLink.next = head;
			 head = newLink;

		}*/
		//Way II
		if(head == null){
			head = new Node(name,null);
		}
		else{
			head = new Node(name,head);
		}
	}

	//Problem set 2.1 Add b4 last and return front node.
	public Node addBeforeLast(Node  front, String name){
		Node cur = front;
		Node prev = null;
		if(front==null)
			return null;
		else if(front.next==null){
			Node newNode = new Node(name,front);
			front = newNode;
		}else{
			while(cur.next!=null){
				prev = cur;
				cur = cur.next;
				if(cur.next==null){
					prev.next = new Node(name,cur);
				}
			}
		}
		return front;
	}
	//Problem set 2.2 Return number of occurrences.
	public int numberOfOccurrences(String target){
		int count = 0;
		Node curr = head;

		while(curr!=null){
			if(curr.name.equals(target))
				count++;
			curr=curr.next;
		}

		return count;
	}
	//2.3 Delete every other. Depends on the number of nodes in the list.
	public void deleteEveryOther(){
		Node cur = head;
		Node del = null;
		//if headCount is ODD Algorithm
		if(headCount()%2!=0){
			System.out.println("headCount "+headCount()+"\nDelete every other:");
			while(cur.next!=null){
				del = cur;
				cur = cur.next;
				del.next = cur.next;
				cur = cur.next;
			}
			displayList();
			return;
		}
		//if headCount is EVEN Algorithm
		System.out.println("headCount "+headCount()+"\nDelete every other:");
		while(cur!=null){
			del = cur;
			cur = cur.next;
			del.next = cur.next;
			cur = cur.next;
		}
		displayList();
		return;

	}
	//2.4 Delete all occurrences
	public Node deleteAllOccurrences(String target){
		if(head == null)
			return null;

		Node curr = head;
		Node prev = null;

		//displayList();
		while(curr!=null){

			if (curr.name.equals(target)){
				if(prev==null){
					head = head.next;
				}else{
					prev.next = curr.next;
				}
			}
			else{
				prev = curr;
			}
			curr = curr.next;
		}
		displayList();

		return head;
	}
	//add to the front of the list
	/*
	public Node addAtFront(String name){
		Node front = new Node(name);
		front.next = head;
		return front;
	}
	public boolean searchName(String n){
		Node current = head;
		while(current!=null){
			if(current.name.equals(n)){
				return true;
			}
			current = current.next;
		}
		return false;
	}
	public void displayReverse(){
		Node currentLink = head;
		if(currentLink == null)
			System.out.println("List is empty");
		else{
			while(currentLink!=null){
				System.out.println(currentLink);
				currentLink = currentLink.previous;
			}
		}
	}
	//delete target node	
	public void deleteNode(String target){
		Node currentNode = head;
		if(target == currentNode.name){
			currentNode.next = currentNode.next.next;
		}
		while(currentNode!= null){
			currentNode = currentNode.next;
			if(target == currentNode.name){
				currentNode.next = currentNode.next.next;
			}
		}
	}
	 */
	//Counts and returns current number of Nodes.
	public int headCount(){
		int count = 0;
		Node front = head;
		while(front!=null){
			front = front.next;
			count++;
		}
		return count;
	}
	//Displays linkedList
	public void displayList(){
		Node currentLink = head;
		if(head == null)
			System.out.println("List is empty");
		else{
			while(currentLink!=null){
				System.out.println(currentLink);
				currentLink = currentLink.next;
			}
		}
	}

	//Print backwards recursively
	public void printBackwards(Node front){
		if(front!=null){
			printBackwards(front.next);
			System.out.println(front.name);
		}
	}

	//print backwards recursively 2 using nodeToString function
	public Node printBackwardsII(Node front){
		if(front.next==null)
			return front;

		Node head = printBackwardsII(front.next);
		front.next.next = front;
		front.next = null;

		return head;
	}

	//Print recursive ii
	public String nodeToString(Node front){
		if(front == null)
			return "[end]";

		return ("[ "+front.name+" ]-->"+nodeToString(front.next));
	}




}