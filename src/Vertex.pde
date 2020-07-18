/*
 * Vertex.pde
 * Author: Nicholas Kawwas
 * Completed: December, 2018
 * Purpose: Dijkstra's Shortest Path Implementation w/ Graph Visualizer
*/

//Vertex Class
class Vertex {
  char label;
  boolean visited;
  
  //Constructor: Vertex Character and State
  Vertex(char labeled) {
    label = labeled;
    visited = false;
  }
  
  //toString: Prints out char
  String toString() {
    return "Character: " + label + "\tVisited: " + visited;
  }
}
