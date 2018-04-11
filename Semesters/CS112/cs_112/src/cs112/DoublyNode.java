package cs112;
//Doubly LinkedList Program
public class DoublyNode<T> {
	T data;
	DoublyNode<T> prev;
	DoublyNode<T> next;

	//Constructor
	public DoublyNode(DoublyNode<T> prev,T data,DoublyNode<T> next){
		this.prev = prev;
		this.data = data;
		this.next = next;
	}

	public String toString(){
		return data+" ";
	}

	public static void main(String[] args){
		DoublyLinkedList<String> list = new DoublyLinkedList<String>();

		System.out.println("Adding to the front of the list:");
		System.out.println("Head of list = "+list.addFront("Leo"));
		System.out.println("Head of list = "+list.addFront("Juan"));
		System.out.println("Head of list = "+list.addFront("Marcos"));
		System.out.println("Head of list = "+list.addFront("Rubens"));
		System.out.println("Head of list = "+list.addFront("Jose"));
		System.out.println("Head of list = "+list.addFront("Vinicio"));
		System.out.println("Head of list = "+list.addFront("Irene"));
		System.out.println("Head of list = "+list.addFront("Dario"));
		System.out.println("Head of list = "+list.addFront("Jael"));
		System.out.println("Head of list = "+list.addFront("Jeremy"));
		System.out.println("Head of list = "+list.addFront("Alma"));
		System.out.println("Head of list = "+list.addFront("Iris"));
		System.out.println("\nLinked list lenght = "+list.getLength());

		System.out.println("\nLinked list first to last:");
		list.displayListForward();
		System.out.println("\nLinked list last to first:");
		list.displayListBackward();

		System.out.println("\nAdding to the tail of the list");
		System.out.println("Tail of list = "+list.addLast("Sofia"));
		System.out.println("Tail of list = "+list.addLast("Andres"));
		System.out.println("\nLinked list lenght = "+list.getLength());

		System.out.println("\nLinked list first to last:");
		list.displayListForward();
		//System.out.println("\nLinked list last to first:");
		//list.displayListBackward();

		System.out.println("Node at index 4 is: "+list.findIndex(0));
		System.out.println("Node at index 8 is: "+list.findIndex(15));

	}
}

//DoublyLinkedList class implementation
class DoublyLinkedList<T>{

	DoublyNode<T> head;
	DoublyNode<T> tail;
	int size;

	//Add new node to the front of the list
	public DoublyNode<T> addFront(T data){
		if(head == null){
			head = new DoublyNode<T>(null,data,null);
			tail = head;
			size++;
			//return tail;
		}else{
			head.prev = new DoublyNode<T>(null,data,head);
			head = head.prev;
			size++;
		}
		return head;
	}

	//Add new node to the last of the list
	public DoublyNode<T> addLast(T data){
		if(tail == null){
			tail = new DoublyNode<T>(null,data,null);
			head = tail;
			size++;
			return tail;
		}else{
			tail.next = new DoublyNode<T>(tail,data,null);
			tail = tail.next;
			size++;
		}
		return tail;
	}

	//Add at 
	/*
	 * For sorted list only. Add before head, after tail or in between.
	 */

	//Display from front to last
	public void displayListForward(){
		if(head == null)
			System.out.println("List is empty");
		DoublyNode<T> front = head;
		while(front!=null){
			System.out.println(front);
			front = front.next;
		}
	}

	//Display last to front
	public void displayListBackward(){
		if(tail == null)
			System.out.println("List is empty");
		DoublyNode<T> last = tail;
		while(last!=null){
			System.out.println(last);
			last = last.prev;
		}
	}
	//Find Node method by targeting the index of the node.
	public DoublyNode<T> findIndex(int index){
		DoublyNode<T> front = head;
		DoublyNode<T>last = tail;
		DoublyNode<T> node = null;
		//Traverse from the front if index is less than or equal to size/2
		if(index<=size/2){
			while(index!=0){
				node = front;
				front = front.next;
				index--;
			}
			return node;
		}
		//Traverse from the tail if index is greater than size/2
		else{
			while(index!=size+1){
				node = last;
				last = last.prev;
				index++;
			}
		}
		return node;
	}
	//Get list size
	public int getLength(){
		return size;
	}
}