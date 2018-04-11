package sq;

class CLLNode<T>{
	T data;
	CLLNode<T> next;
	
	CLLNode(T data, CLLNode<T> next){
		this.data = data;
		this.next = next;
	}
}

public class CLL<T>{
	
	private CLLNode<T> tail;  // the last node in the list
	
	// constructor returns an empty CLL
	public CLL( ){
		tail = null;
	}
	// Adds a node with data at the front of 
	// the list
	public void addAtFront(T data){
		if (tail == null){
			tail = new CLLNode<T>(data, null);
			tail.next = tail;
		} else {
			tail.next = new CLLNode<T>(data, tail.next);
		}
	}
	// removes the first node in the list and returns
	// its data
	public T removeFront( ){
		if (tail == null){
			return null;
		} else if (tail.next == tail){
			T result = tail.next.data;
			tail = null;
			return result;
		} else {
			T result = tail.next.data;
			tail.next = tail.next.next;
			return result;
		}
	}
	// adds a node with data at the end of the list
	public void addAtRear(T data){
		if (tail == null){
			tail = new CLLNode<T>(data, null);
			tail.next = tail;
		} else {
			tail.next = new CLLNode<T>(data, tail.next);
			tail = tail.next;
		}
	}
	// tests if the list is empty
	public boolean isEmpty( ){
		return tail == null;
	}
	// print the list
	public String toString( ){
		if (tail == null){
			return "empty";
		} else {
			CLLNode<T> place = tail.next;
			String result = "";
			do {
				result += "--> "+ place.data + " ";
				place = place.next;
			} while (place != tail.next);
			return result;
		}
	}
	public static void main(String [ ] args){
		CLL<String> c = new CLL<String>( );
		c.addAtRear("r1");
		c.addAtRear("r2");
	        c.addAtFront("first");
		c.addAtFront("second");
		c.addAtFront("3rd");
		System.out.println(c);
		System.out.println(c.removeFront());
		System.out.println(c.removeFront());
		System.out.println(c.removeFront());
		System.out.println(c.removeFront());
		System.out.println(c.removeFront());
		System.out.println(c.removeFront());
	}
}