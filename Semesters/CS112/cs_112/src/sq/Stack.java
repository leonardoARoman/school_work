package sq;

public class Stack<T>{

	private CLL<T> stack;  // the circular llinked list that
	//                        reqresents the stack

	// constructor - new Stack( ) returns a
	// reference to an empty Stack	
	public Stack( ){
		// fill in here
		stack = new CLL<T>();
	}

	public void push(T data){
		// fill in here
		stack.addAtFront(data);
	}
	
	public T pop( ){
		// fill in here
		return stack.removeFront();
	}
	
	public boolean isEmpty( ){
		// fill in here
		return stack.isEmpty();
	}
	/*
	public static void main(String[] args){
		Stack<String> newStack = new Stack<String>();
		
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		newStack.push("Leo");
		newStack.push("Juan");
		newStack.push("Marcos");
		System.out.println(newStack.stack);
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		newStack.push("Rubens");
		newStack.push("Sofia");
		newStack.push("Jael");
		System.out.println(newStack.stack);
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println(newStack.stack);
	}
	*/
}