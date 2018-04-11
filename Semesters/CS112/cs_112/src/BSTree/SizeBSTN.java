package BSTree;

/**
 * Instances of class SizeBSTN are Nodes of the Size Binary Search Tree 
 * @author lou
 *
 */
public class SizeBSTN {

	//LEFT AND RIGHT POINTERS
	SizeBSTN LSubtree;  // left subtree of this tree (may be null)
	SizeBSTN RSubtree;  // right subtree of this tree (may be null)

	//FIELDS
	int data; // data at this node of the tree
	int size; // number of tree entries that are less than or equal to data

	/**
	 * create a new leaf of the tree with the given data
	 * @param data
	 */

	//CONSTRUCTOR.
	public SizeBSTN(int data){
		LSubtree = null;
		RSubtree = null;
		this.data = data;
		size = 1;
	}

	/* see assignment for proper format for nodeString
	 */
	public static String nodeString(SizeBSTN node){
		//To build a new string of nodes, by getting all node's data recursively 
		//String tree = "";
		if(node==null)
			return "";
		else{
			return ""+nodeString(node.LSubtree)+"->"+node.data+""+nodeString(node.RSubtree);
			//tree +=(""+nodeString(node.LSubtree)+"->"+node.data+""+nodeString(node.RSubtree));
		}
			
		/*
		String tree = "";
		if(node==null)
			return "null";

		else{
			tree +=("["+nodeString(node.LSubtree)+" "+node.data+","+node.size+" "+ nodeString(node.RSubtree)+"]");
		}
		return tree; 
		 */
	}

	/**
	 * search for the number target in the tree this node is the root of
	 * @param target number to search for
	 * @return either the node that holds target,
	 * if there is one, or the node which should point to the node that 
	 * will hold target if it is added now  
	 */
	public static SizeBSTN getNode(SizeBSTN node, int target){
		if(node == null)
			return node;

		else if(node.data==target || (node.LSubtree == null && node.RSubtree == null))
			return node;

		else if(target<node.data){
			if(node.LSubtree==null)
				return node;
			else{
				getNodeIncr(node,node.data);
				return getNode(node.LSubtree,target);
			}
		}
		else if(target>node.data){
			if(node.RSubtree==null)
				return node;
			else
				return getNode(node.RSubtree,target); 
		}
		return node;
	}

	/**
	 * like getNode but increments size fields as appropriate
	 * @param target number to search for
	 */
	public static void getNodeIncr(SizeBSTN node, int target){
		//Points a new root returned by getNode() method.
		SizeBSTN newRoot = getNode(node,target);
		if(newRoot == null)
			return;
		//If the new root's data equals target update new root's size.
		if(newRoot.data==target){
			newRoot.size = sumNodesLeq(newRoot,target);//update root's size by assigning returned value to root's size.
			//System.out.println("Node's "+newRoot.data+" size is "+newRoot.size);//For debug 
		}
	}

	/**
	 * actually calculates number of numbers <= target.  
	 * Does search for target like getNode but adds up 
	 * the size fields of all nodes whose data is <= target.
	 * @return the number of nodes with data <= target in the
	 * tree this node is the root of.
	 */
	public static int sumNodesLeq(SizeBSTN node, int target){
		int count = 0;
		if(node==null)
			return 0;
		//Count all nodes in left side of the root including the root itself.
		else if(node.data<=target){
			count +=(1+ sumNodesLeq(node.LSubtree,target)+sumNodesLeq(node.RSubtree,target));
			return count;
		}
		return count; 
	}	
}