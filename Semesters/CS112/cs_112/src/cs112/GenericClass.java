package cs112;
import java.util.Iterator;
public class GenericClass<T> {
	T data1;
	//A data2;
	GenericClass<T> next;
	public GenericClass(T data1, GenericClass<T> next){
		this.data1=data1;
		//this.data2=data2;
		this.next=next;
	}
	public String toString(){
		return data1+" ";
	}
	public String toStringNodes(GenericClass<T> front){
		if(front == null)
			return "[end]";

		return ("("+front.data1+")->"+toStringNodes(front.next));
	}
	public GenericClass<T> printBackWards(GenericClass<T> front){
		if(front == null)
			return null;
		else if(front.next == null)
			return front;
		GenericClass<T> newFront = printBackWards(front.next);
		front.next.next = front;
		front.next = null;

		return newFront;
	}
	/* It works
	public int countPos(GenericClass<T> front){
		int count = 0;
		if(front == null)
			return 0;
		else if(front.data1>0){
			count = 1+countPos(front.next);
			return count;
		}else{
			return countPos(front.next)+count;
		}
		/*else{
			count = countPos(front.next);
			if(front.data1>0){
				return 1 + count;
			}
			else
				return count;
		}
		//return count;
	}
	 */
	public static void main(String[] args){
		GenericClass<Integer> node = new GenericClass<Integer>(1,null);
		GenericClass<Integer> node1 = new GenericClass<Integer>(-1,node);
		GenericClass<Integer> node2 = new GenericClass<Integer>(2,node1);
		GenericClass<Integer> node3 = new GenericClass<Integer>(3,node2);

		System.out.println("LinkedList:\n"+node3.toStringNodes(node3));
		System.out.println("\nPrinting LinkedList backwards using recursion:\n"+node3.toStringNodes(node3.printBackWards(node3)));
		//System.out.println("pos numbers = "+node3.toStringNodes(node3));

		//Iterator list = node3.iterator();

	}
	/*
	    private Iterator iterator() {
		// TODO Auto-generated method stub
		return new GenericClass<T>(front) ;
	}
	 */
}
