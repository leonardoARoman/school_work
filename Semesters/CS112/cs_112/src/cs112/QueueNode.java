package cs112;
public class QueueNode<T> {
	QueueNode<T> next;
	T data;
	static int size;
	public QueueNode(T data, QueueNode<T> next){
		this.data = data;
		this.next = next;
		size++;
	}
	public int getSize(){
		return size;
	}
	
	public String toString(){
		return data+"";
	}
	public static void main(String[] args){
		Queue<String> newQueue = new Queue<String>();
		
		System.out.println("new tail is: "+newQueue.enque("Leonardo"));
		System.out.println("new tail is: "+newQueue.enque("Juan"));
		System.out.println("new tail is: "+newQueue.enque("Marcos"));
		System.out.println("new tail is: "+newQueue.enque("Rubens"));
		System.out.println("new tail is: "+newQueue.enque("Sofia"));
		newQueue.displayQueueSize();
		System.out.println("\nDequeue first in, new head is: "+newQueue.dequeue());
		newQueue.displayQueueSize();
		System.out.println("\nDequeue first in, new head is: "+newQueue.dequeue());
		newQueue.displayQueueSize();
		System.out.println("\nDequeue first in, new head is: "+newQueue.dequeue());
		newQueue.displayQueueSize();
		System.out.println("\nDequeue first in, new head is: "+newQueue.dequeue());
		newQueue.displayQueueSize();
		try{
		System.out.println("\nDequeue first in, new head is: "+newQueue.dequeue());
		newQueue.displayQueueSize();
		}
		catch(NullPointerException e){
			System.out.println("Error! ");
		}
	}
	
}

class Queue<T>{
	QueueNode<T> head;
	QueueNode<T> tail;
	
	public QueueNode<T> enque(T data){
		if(head == null){
			head = new QueueNode<T>(data,null);
			tail = head;
		}else{
			tail.next = new QueueNode<T>(data,null);
			tail = tail.next;
		}
		return tail;
	}
	
	public QueueNode<T> dequeue(){
		if(head == null)
			return null;
		else{
		head = head.next;
		QueueNode.size--;
		}
		return head;
	}
	
	public void displayQueueSize(){
		if(head.getSize()==0)
			return;
		
		System.out.println("Size of the queue is: "+head.getSize());
	}
}



