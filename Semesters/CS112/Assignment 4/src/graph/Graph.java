package graph;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;


//  represents a weighted undirected graph

public class Graph {
	Vertex[ ] adjLists;   // array of all vertices in the graph

	public Graph(String file) throws FileNotFoundException {
		Scanner sc = new Scanner(new File(file));

		// read number of vertices
		adjLists = new Vertex[sc.nextInt()];

		// read vertex names & create vertices
		//System.out.print("{ ");
		for (int v=0; v < adjLists.length; v++) {
			adjLists[v] = new Vertex(sc.next(), null);
			//System.out.print(adjLists[v].name+" ");
		}
		//System.out.println("}");

		// read edges
		while (sc.hasNext()) {
			// read vertex names and translate to vertex numbers
			int v1 = indexForName(sc.next());
			int v2 = indexForName(sc.next());
			int weight = sc.nextInt( );

			// add v2 to front of v1's adjacency list and
			// add v1 to front of v2's adjacency list
			adjLists[v1].adjList = new AdjacencyNode(v2, adjLists[v1].adjList, weight);
			adjLists[v2].adjList = new AdjacencyNode(v1, adjLists[v2].adjList, weight);
		}
		sc.close( );
	}

	int indexForName(String name) {
		for (int v=0; v < adjLists.length; v++) {
			if (adjLists[v].name.equals(name)) {
				return v;
			}
		}
		return -1;
	}	

	// returns the number of vertices in the graph 
	public int numberOfVertices( ){
		return adjLists.length;
	}

	// print a summary of the graph
	public void summarize( ){
		for(int j = 0; j<numberOfVertices( ); j++){
			Vertex vj = adjLists[j];
			System.out.print(vj.name+": ");
			for(AdjacencyNode e = vj.adjList; e != null; e = e.next){
				System.out.print(adjLists[e.vertexNum].name+" "+e.weight+",  ");
			}
			System.out.println();
		}
	}

	public int shortestPath(String nameFrom, String nameTo){
		if(indexForName(nameFrom)==-1||indexForName(nameTo)==-1){
			System.out.println("Error: source vertex or end vertex do not exist in the grapht");
			return 0;
		}
		SPRecord[] spTree = new SPRecord[numberOfVertices()];
		spTree[indexForName(nameFrom)] = new SPRecord(true, indexForName(nameFrom), 0);      
		setVertexNeighbors(spTree,indexForName(nameFrom));      

		while(!isDestinationVertexInGraph(spTree, nameTo))
		{
			setVertexNeighbors(spTree, getSmallestPath(spTree));
		}
		return spTree[indexForName(nameTo)].distance;
	}

	private void setVertexNeighbors(SPRecord [] shortestPathNeighbor, int vertexIndex){
		AdjacencyNode vertexNeighbor = adjLists[vertexIndex].adjList;
		while(vertexNeighbor!=null){
			SPRecord newSPRecord = shortestPathNeighbor[vertexNeighbor.vertexNum];
			if (newSPRecord == null)
				shortestPathNeighbor[vertexNeighbor.vertexNum]= new SPRecord(false, vertexIndex, vertexNeighbor.weight+shortestPathNeighbor[vertexIndex].distance);

			else if (!newSPRecord.inTree){
				int currDistance = vertexNeighbor.weight + shortestPathNeighbor[vertexIndex].distance;
				if (currDistance < newSPRecord.distance){
					shortestPathNeighbor[vertexNeighbor.vertexNum].link = vertexIndex;
					shortestPathNeighbor[vertexNeighbor.vertexNum].distance = currDistance;
				}
			}
			vertexNeighbor = vertexNeighbor.next;
		}
	}

	private int getSmallestPath(SPRecord[] treePath){
		int SmalletsPath = Integer.MAX_VALUE;
		for(int i = 0; i < adjLists.length; i++)
		{
			if(treePath[i] == null)
				continue;
		
			else if(treePath[i].inTree == false)
			{
				if(SmalletsPath == Integer.MAX_VALUE && treePath[i].distance != 0)
					SmalletsPath = i;
			
				else if(treePath[SmalletsPath].distance > treePath[i].distance && treePath[i].distance != 0)
				{
					SmalletsPath = i;
				}
			}
		}
		treePath[SmalletsPath].inTree = true;
		return SmalletsPath;
	}

	private boolean isDestinationVertexInGraph(SPRecord[] spRecord, String endVertex)
	{
		if(spRecord[indexForName(endVertex)] == null)
			return false;

		return spRecord[indexForName(endVertex)].inTree;
	}

	public static void main(String[] args) throws FileNotFoundException {		
		Graph g =  new Graph("graph.txt");
		g.summarize( );
		System.out.println(g.shortestPath("Alex", "Sid"));
	}
}