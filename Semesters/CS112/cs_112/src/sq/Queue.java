package sq;

public class Queue<T> {

	private CLL<T> queue;  // the circular linked list that
	//                        reqresents the queue

	// constructor - new Queue( ) returns a
	// reference to an empty Queue
	public Queue( ){
		// fill in here
		queue = new CLL<T>();
	}

	public void enqueue(T data){
		// fill in here
		queue.addAtRear(data);
	}
	public T dequeue( ){
		// fill in here
		return queue.removeFront();
	}
	public boolean isEmpty( ){
		// fill in here
		return queue.isEmpty();
	}	
	/*
	public static void main(String[] args){
		Queue<String> newQueue = new Queue<String>();
		System.out.println("Is the Queue empty? "+newQueue.isEmpty());
		newQueue.enqueue("Leo");
		newQueue.enqueue("Juan");
		newQueue.enqueue("Marcos");
		System.out.println(newQueue.queue);
		System.out.println("Is the Queue empty? "+newQueue.isEmpty());
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("Is the Queue empty? "+newQueue.isEmpty());
		newQueue.enqueue("Rubens");
		newQueue.enqueue("Sofia");
		newQueue.enqueue("Jael");
		System.out.println(newQueue.queue);
		System.out.println("Is the Queue empty? "+newQueue.isEmpty());
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
		System.out.println("dequeuing out of queue: "+newQueue.dequeue());
		System.out.println(newQueue.queue);
	}
	*/
}