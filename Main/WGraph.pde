/*
 * WGraph.pde
 * Author: Nicholas Kawwas
 * Completed: December, 2018
 * Purpose: Dijkstra's Shortest Path Implementation w/ Graph Visualizer
*/

import java.util.PriorityQueue;

class WGraph extends UWGraph {  
  DistPar[] sPath;
  PriorityQueue<Edge> qGraph;

  WGraph() {
    super();
    qGraph = new PriorityQueue<Edge>();
  }

  class Edge implements Comparable<Edge> {
    int originV, destin, weight;

    //Constructor
    Edge(int origin, int destination, int weighty) {
      originV = origin;
      destin = destination;
      weight = weighty;
    }

    //Uses Comparable to compare weights
    int compareTo(Edge vertex) {
      return this.weight - vertex.weight;
    }

    String toString() {
      return "O: " + originV + " D: " + destin + " W: " + weight;
    }
  }

  //Add an edge to the graph @Override
  void addEdge(int orig, int dest, int weight) {
    adjMat[orig][dest] = weight;
    adjMat[dest][orig] = weight;
  }

  //Determine the MST for this graph @Override
  void mst(int orig) {  
    for (int v = 0; v < nVerts; v++)
      if (adjMat[orig][v] != 0 && vertexList[v].visited == false)
        tryToInsert(orig, v, adjMat[orig][v]);

    while (!qGraph.isEmpty()) {
      Edge edgy = qGraph.poll();

      orig = edgy.destin;
      vertexList[edgy.destin].visited = true;
      vertexList[edgy.originV].visited = true;

      for (int v = 0; v < nVerts; v++)
        if (adjMat[orig][v] != 0 && vertexList[v].visited == false)
          tryToInsert(orig, v, adjMat[orig][v]);

      System.out.print(Character.toString(vertexList[edgy.originV].label) +  Character.toString(vertexList[orig].label) + " ");
    }
  }

  //Attempts to add this edge to the priority queue
  void tryToInsert(int orig, int dest, int weight) {
    Object[] vArr = qGraph.toArray();
    Edge newE = new Edge(orig, dest, weight);

    for (int i = 0; i < vArr.length; i++) {
      Edge curE = (Edge) vArr[i];
      if (newE.destin == curE.destin)
        if (newE.weight < curE.weight) {
          qGraph.remove(curE);
          qGraph.add(newE);
          return;
        } else
          return;
    }

    qGraph.add(newE);
  }  

  class DistPar {
    int cumD, parent;

    //Constructor
    DistPar(int cum, int par) {
      cumD = cum;
      parent = par;
    }

    String toString() {
      return "Cum Distance: " + cumD + " Parent: " + parent;
    }
  }

  //Primary shortest path method
  String path(int orig, int dest) {
    int start = orig;

    sPath = new DistPar[nVerts];
    sPath[orig] = new DistPar(0, orig);

    while (orig != dest) {
      adjustPath(orig);
      vertexList[orig].visited = true;
      orig = getMin();
    }  

    //Prints out Shortest Path
    String printed = (char)(dest + 65) + "";
    while (sPath[dest].parent !=  start) {
      printed = (char)(sPath[dest].parent + 65) + printed;
      dest = sPath[dest].parent;
    }
    printed = (char)(start + 65) + printed;
    return printed;
  }

  //Return the minimum option in sPath (Selects it as next vertex for path search)
  int getMin() {
    int cIndex = -1;
    int min = Integer.MAX_VALUE;

    for (int i = 0; i < nVerts; i++)
      if (sPath[i] != null)
        if (!vertexList[i].visited && sPath[i].cumD < min) {
          min = sPath[i].cumD; 
          cIndex = i;
        }

    return cIndex;
  }

  //Update the values in sPath by adding the distance to get from current
  //vertex to the next vertex (if a shorter path is found)
  void adjustPath(int cur) {
    int distance = sPath[cur].cumD;

    for (int i = 0; i < nVerts; i++)
      if (!vertexList[i].visited && adjMat[cur][i] != 0) {
        if (sPath[i] == null)
          sPath[i] = new DistPar(distance + adjMat[cur][i], cur);
        else if (sPath[i].cumD > distance + adjMat[cur][i])
          sPath[i] = new DistPar(distance + adjMat[cur][i], cur);
      }
  }
  
  void reset(){
    orig = -1; dest = -1;
    for(int v = 0; v < graphed.nVerts; v++){
      vertexList[v].visited = false;
      sPath[v] = new DistPar(0, 0);
    } 
  } 
}
