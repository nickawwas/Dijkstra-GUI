/*
 * UWGraph.pde
 * Author: Nicholas Kawwas
 * Completed: December, 2018
 * Purpose: Dijkstra's Shortest Path Implementation w/ Graph Visualizer
*/

import java.util.Stack;

 class UWGraph {
  int nVerts;
  int[][] adjMat;
  Vertex[] vertexList;
  Stack<Integer> stacked;
  final int MAX_VERTS = 10;
  
  //Constructor: Instantiates vertexList and adjMat
  UWGraph() {
    nVerts = 0;
    vertexList = new Vertex[MAX_VERTS];
    adjMat = new int[MAX_VERTS][MAX_VERTS];
  }
  
  //AddVertex: Method adds char to vertexList
  void addVertex(char lab) {
    vertexList[nVerts++] = new Vertex(lab); 
  }
  
  //AddEdge: Connects two vertices together (Using 2D Array)
  void addEdge(int start, int end) {
    adjMat[start][end] = 1;
    adjMat[end][start] = 1;
  }
  
  //Prints out the character label for that vertex
  void displayVertex(int vertex) {
    System.out.print(vertexList[vertex].label);
  }
  
  //Minimum Spanning Tree: Prints out n - 1 links (n being the number of towns)
  void mst(int start) {
    String toPrint = "";
    stacked = new Stack<Integer>();
  
    stacked.push(start);
    vertexList[start].visited = true;
    
    //While loop for DFS
    while(!stacked.isEmpty()) {
      boolean found = false;
      
      //Adds vertex to mst 
      for(int v = 0; v < nVerts; v++)
        if(adjMat[stacked.peek()][v] == 1 && vertexList[v].visited == false){
          toPrint += Character.toString(vertexList[stacked.peek()].label) + Character.toString(vertexList[v].label) + " ";
          
          found = true;  
          vertexList[v].visited = true;
          stacked.push(v);
        } 
      
      if(!found)
        stacked.pop();
    }
    
    System.out.println(toPrint);
  } 
}
