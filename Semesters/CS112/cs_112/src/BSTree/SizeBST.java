package BSTree;

/**
 * Class SizeBST represents a Binary Search Tree that can also be used, for any integer j,
 *  to answer the question "how many numbers in the tree are less than or equal to j" in worst 
 *  case time h where h is the height of the tree (not the number of nodes).
 * 
 *  The actual nodes of the tree are of class SizeBSTN.  SizeBST represents the overall tree.
 *  IF instance variable rootNode is null, the tree is empty, otherwise rootNode is the root
 *  of the tree of SizeBSTN's
 * @author lou
 *
 */
public class SizeBST {
	SizeBSTN rootNode;

	public SizeBST(SizeBSTN root){
		rootNode =  root;
	}

	public String toString(){
		if (rootNode == null)
			return "(null)";
		else {
			return "("+ SizeBSTN.nodeString(rootNode) + ")";
		}
	}

	/**
	 * @param target the number to search for
	 * @return true iff target is in this tree
	 */
	public boolean search(int target){
		//Returns true iff the target was found by comparing the node's data returned by getNode() method with target.
		return SizeBSTN.getNode(rootNode,target).data==target; 
	}

	/**
	 * insert newData into tree;  if already there, do not change tree
	 * @param newData int to insert
	 */
	public void insert(int newData){

		//Case i: empty tree, no root.
		if(rootNode == null){
			rootNode = new SizeBSTN(newData);
			return;
		}
		
		//Case ii: data already exists. Do not make any changes.
		SizeBSTN newRoot = SizeBSTN.getNode(rootNode,newData);
		if(newRoot.data==newData){
			System.out.println("\nInsert("+newData+")\n"+newData+" already exists, no change in tree.");
			return;
		}

		//Case iii: Data is eligible for insertion to left or right of the tree.
		if(newData<newRoot.data){
			newRoot.LSubtree = new SizeBSTN(newData);
			SizeBSTN.getNodeIncr(rootNode, newData);
		}
		else if(newData>newRoot.data){
			newRoot.RSubtree = new SizeBSTN(newData);	
			SizeBSTN.getNodeIncr(rootNode, newData);
		}
	}

	/**
	 * @return returns how many numbers in the tree are less than or equal to target.  Returns -1 if tree is empty
	 * @param target
	 */
	public int numLEq(int target){
		int sum = 0;		
		if(!search(target))
			return -1;
		SizeBSTN tempRoot = rootNode;
		//Add the size of the root directly to the size of the node containing the data target.
		while(true){
			if(target == tempRoot.data){
				sum+=tempRoot.size;
				return sum;
			}else if(target>tempRoot.data){
				sum+=tempRoot.size;
				tempRoot = SizeBSTN.getNode(tempRoot.RSubtree, tempRoot.RSubtree.data);
			}else if(target<tempRoot.data)
				tempRoot = SizeBSTN.getNode(tempRoot.LSubtree, tempRoot.LSubtree.data);
		}
	}

	//Main method
	public static void main(String args []){

		SizeBST tree1 = new SizeBST(null);
		System.out.println("empty: "+tree1);
		//SizeBSTN newRoot = SizeBSTN.getNode(tree1.rootNode,40);
		if( SizeBSTN.getNode(tree1.rootNode,40)==null)
			System.out.println("Empty tree");
		else{
			System.out.println("Test 1: Before calling getNodeIncr()\nnode[40].size =  "+SizeBSTN.getNode(tree1.rootNode,40).size);
		}

		//Testing insertion:
		System.out.println("Testing insertion:");
		int[] arr = {40,10,30,20,60,50,55,53};
		for(int i = 0; i < arr.length; i++){
			tree1.insert(arr[i]);
			System.out.println("\nInsert("+arr[i]+")\n"+tree1);
		}

		//Testing existing node/data:
		System.out.println("Testing existing node/data:");
		tree1.insert(10);
		System.out.println(tree1);

		//Testing boolean search method for existing data:
		System.out.println("Testing boolean search method for existing data:");
		System.out.println("\nsearching 1 in tree\n"+tree1.search(1)+": 1 was not found.");
		System.out.println("\nsearching 40 in tree\n"+tree1.search(10)+": 40 was found.\n");

		//Testing size of tree and subtrees.
		int key = 55;
		System.out.println("size of [Node: "+40+ "] = "+SizeBSTN.getNode(tree1.rootNode,40).size);
		System.out.println("size of [Node: "+key+ "] = "+SizeBSTN.getNode(tree1.rootNode,key).size);

		System.out.println("Testing size of tree and subtrees:");
		for(int i = 0; i < arr.length; i++){
			//tree1.numLEq(arr[i]);
			System.out.println("size of [Node: "+arr[i]+"] = "+SizeBSTN.getNode(tree1.rootNode,arr[i]).size);
		}

		//Testing number of nodes less than or equal to given node
		System.out.println("number of nodes <= [Node: "+key+"] = "+tree1.numLEq(key));
		
		System.out.println("Testing number of nodes less than or equal to given node:");
		for(int i = 0; i < arr.length; i++){
			System.out.println("number of nodes <= [Node: "+arr[i]+"] = "+tree1.numLEq(arr[i]));
		}

	}
}