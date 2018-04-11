package sq;

public class Client<T>{

	// prints the contents of stack of Integers s, in
	// top-to-bottom order. This mthod may change s
	// temporarily, but by the time it exits, s must be
	// set back to the contens it had when printStack was
	// called.
	public static void printStack(Stack<Integer> s){
		// fill in here
		if(s.isEmpty()){
			System.out.println("Stack is empty.");
			return;
		}
		String str = "";
		int stack;
		Stack<Integer> newStack = new Stack<Integer>();
		while(!s.isEmpty()){
			stack = s.pop();
			str+=stack+"->";
			newStack.push(stack);
		}
		while(!newStack.isEmpty()){
			s.push(newStack.pop());
		}
		System.out.println(str);
	}

	// this method reverses the order of the items in the
	// stack.  What was the top Integer becomes the bottom,
	// next-to-top become next-to-bottom, etc.
	public static void flipStack(Stack<Integer> s){
		//fill in here
		if(s.isEmpty()){
			System.out.println("Stack is empty.");
			return;
		}
		Queue<Integer> newQueue = new Queue<Integer>();
		while(!s.isEmpty()){
			newQueue.enqueue(s.pop());
		}
		while(!newQueue.isEmpty()){
			s.push(newQueue.dequeue());
		}

	}
	/*
	public static void main(String[] args){
		
		Stack<Integer> newStack = new Stack<Integer>();
		
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("push 1 to stack");
		newStack.push(1);
		System.out.println("push 2 to stack");
		newStack.push(2);
		System.out.println("push 3 to stack");
		newStack.push(3);
		
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);

		System.out.println("\nIs the stack empty? "+newStack.isEmpty());
		System.out.println("Poping out of stack: "+newStack.pop());
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);

		System.out.println("\nPoping out of stack: "+newStack.pop());
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);

		System.out.println("\nPoping out of stack: "+newStack.pop());
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);

		
		System.out.println("\npush 4 to stack");
		newStack.push(4);
		System.out.println("push 5 to stack");
		newStack.push(5);
		System.out.println("push 6 to stack");
		newStack.push(6);
		System.out.println("\nIs the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);
		
		System.out.println("Flip the stack");
		flipStack(newStack);
		
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);

		System.out.println("Is the stack empty? "+newStack.isEmpty());

		System.out.println("\nPoping out of stack: "+newStack.pop());
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);

		System.out.println("\nPoping out of stack: "+newStack.pop());
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);

		System.out.println("\nPoping out of stack: "+newStack.pop());
		System.out.println("Is the stack empty? "+newStack.isEmpty());
		System.out.println("Printing the stack from top to botton:");
		printStack(newStack);
	}
	*/
}