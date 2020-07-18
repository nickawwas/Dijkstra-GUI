/*
 * Dijkstra_GUI.pde
 * Author: Nicholas Kawwas
 * Completed: December, 2018
 * Purpose: Dijkstra's Shortest Path Implementation w/ Graph Visualizer
*/

WGraph graphed = new WGraph();
static int orig = -1, dest = -1;

void setup(){
  //Add Background Image
  size(800, 591);
  image(loadImage("canada.jpg"), 0, 0);
   
  //Adding Vertices and Edges 
  graphed.addVertex('A'); //0
  graphed.addVertex('B'); //1
  graphed.addVertex('C'); //2
  graphed.addVertex('D'); //3
  graphed.addVertex('E'); //4
  graphed.addVertex('F'); //5
  graphed.addVertex('G'); //6
  graphed.addVertex('H'); //7
  
  graphed.addEdge(0, 1, 4); //AB
  graphed.addEdge(0, 2, 8); //AC
  graphed.addEdge(0, 3, 8); //AD
  graphed.addEdge(1, 2, 10);//BC
  graphed.addEdge(1, 3, 7); //BD
  graphed.addEdge(2, 5, 11);//CF
  graphed.addEdge(2, 3, 9); //CD
  graphed.addEdge(2, 6, 12);//CG
  graphed.addEdge(3, 4, 3); //DE
  graphed.addEdge(3, 6, 10);//DG
  graphed.addEdge(3, 7, 8); //DH
  graphed.addEdge(4, 5, 2); //EF
  graphed.addEdge(5, 6, 6); //FG
  graphed.addEdge(5, 7, 4); //FH 
  graphed.addEdge(6, 7, 7); //GH
}

void draw(){
  //Draw Vertices
  fill(182, 186, 221);
  ellipse(590, 460, 20, 20); //Quebec - A
  
  fill(255, 135, 146);
  ellipse(515, 535, 20, 20); //Ontario - B
  
  fill(184,216,151);
  ellipse(520, 255, 20, 20); //Nunavut - C
  
  fill(201, 181, 206);
  ellipse(345, 455, 20, 20); //Manitoba - D
  
  fill(227, 148, 105);
  ellipse(275, 425, 20, 20); //Sakatchewan - E
  
  fill(161, 202, 134);
  ellipse(230, 390, 20, 20); //Alberta - F
  
  fill(216,170,155);
  ellipse(180, 225, 20, 20); //Yukon & NWT - G
  
  fill(251, 179, 182);
  ellipse(115, 420, 20, 20); //British Columbia - H
  
  mouseOver();
}  

void drawE(String edges){
  //Input Dijkstra's Shortest Path and Draw Edges
  //Prints the Flight Time in Hours
  
  int cost = 0;
  for(int i = 0; i < edges.length() - 1; i++){
    if(edges.substring(i, i + 2).contains("A")){
      if(edges.substring(i, i + 2).contains("B")) {
        line(590, 460, 515, 535); //AB
        cost += graphed.adjMat[0][1];
      } else if(edges.substring(i, i + 2).contains("C")) {
        line(590, 460, 520, 255); //AC
        cost += graphed.adjMat[0][2];
      } else if(edges.substring(i, i + 2).contains("D")) {
        line(590, 460, 345, 455); //AD 
        cost += graphed.adjMat[0][3];
      } 
    } else if(edges.substring(i, i + 2).contains("B")){
       if(edges.substring(i, i + 2).contains("C")) {
        line(515, 535, 520, 255); //BC
        cost += graphed.adjMat[1][2];
      } else if(edges.substring(i, i + 2).contains("D")) {
        line(515, 535, 345, 455); //BD
        cost += graphed.adjMat[1][3];
      }  
    } else if(edges.substring(i, i + 2).contains("C")){
       if(edges.substring(i, i + 2).contains("D")) {
        line(520, 255, 345, 455); //CD
        cost += graphed.adjMat[2][3];
       } else if(edges.substring(i, i + 2).contains("F")) {
        line(520, 255, 230, 390); //CF
        cost += graphed.adjMat[2][5];
       } else if(edges.substring(i, i + 2).contains("G")) {
        line(520, 255, 180, 225); //CG
        cost += graphed.adjMat[2][6];
       } 
    } else if(edges.substring(i, i + 2).contains("D")){
       if(edges.substring(i, i + 2).contains("E")) {
        line(345, 455, 275, 425); //DE
        cost += graphed.adjMat[3][4];
       } else if(edges.substring(i, i + 2).contains("G")) {
        line(345, 455, 180, 225); //DG
        cost += graphed.adjMat[3][6];
       } else if(edges.substring(i, i + 2).contains("H")) {
        line(345, 455, 115, 420); //DH
        cost += graphed.adjMat[3][7];
       } 
    } else if(edges.substring(i, i + 2).contains("F")){
       if(edges.substring(i, i + 2).contains("E")) {
        line(275, 425, 230, 390); //FE
        cost += graphed.adjMat[5][4];
       } else if(edges.substring(i, i + 2).contains("G")) {
        line(230, 390, 180, 225); //FG
        cost += graphed.adjMat[5][6];
       } else if(edges.substring(i, i + 2).contains("H")) {
        line(230, 390, 115, 420); //FH
        cost += graphed.adjMat[5][7];
       } 
    } else {
      if(edges.substring(i, i + 2).contains("H")) {
        line(180, 225, 115, 420); //GH
        cost += graphed.adjMat[6][7];
      }  
    }    
  }
  
  fill(0, 0, 0); textSize(26);
  image(loadImage("box.png"), 223, 108);
  text(cost/2 + " HOURS", 235, 140);
}

void mouseOver(){
   fill(190, 228, 239);
   if((mouseX > 570 && mouseX < 610) && (mouseY > 440 && mouseY < 480)) {
       ellipse(590, 460, 20, 20); //Quebec - A Region
       image(loadImage("montreal.png"), 550, 50);
   } else if((mouseX > 495 && mouseX < 535) && (mouseY > 515 && mouseY < 555)) {
       ellipse(515, 535, 20, 20); //Ontario - B Region
       image(loadImage("toronto.png"), 550, 50);
   } else if((mouseX > 500 && mouseX < 540) && (mouseY > 235 && mouseY < 275)) {
       ellipse(520, 255, 20, 20); //Nunavut - C Region   
       image(loadImage("iqaluit.png"), 550, 50);
   } else if((mouseX > 325 && mouseX < 365) && (mouseY > 435 && mouseY < 475)) {
       ellipse(345, 455, 20, 20); //Manitoba - D Region
       image(loadImage("winnipeg.png"), 550, 50);
  } else if((mouseX > 255 && mouseX < 295) && (mouseY > 405 && mouseY < 445)) {
       ellipse(275, 425, 20, 20); //Sakatchewan - E Region
       image(loadImage("regina.png"), 550, 50);
  } else if((mouseX > 210 && mouseX < 250) && (mouseY > 370 && mouseY < 410)) {
       ellipse(230, 390, 20, 20); //Alberta - F Region
       image(loadImage("edmonton.png"), 550, 50);
  } else if((mouseX > 160 && mouseX < 200) && (mouseY > 205 && mouseY < 245)) {
       ellipse(180, 225, 20, 20); //Yukon & NW Territories - G Region
       image(loadImage("inuvik.png"), 550, 50);
  } else if((mouseX > 95 && mouseX < 135) && (mouseY > 400 && mouseY < 440)) {
       ellipse(115, 420, 20, 20); //British Columbia - H Region   
       image(loadImage("victoria.png"), 550, 50);
  }     
} 

void mouseClicked(){
  if((mouseX > 570 && mouseX < 610) && (mouseY > 440 && mouseY < 480)) //A
      if(orig == -1) orig = 0;
      else dest = 0;
   else if((mouseX > 495 && mouseX < 535) && (mouseY > 515 && mouseY < 555)) //B
      if(orig == -1) orig = 1; 
      else dest = 1;
   else if((mouseX > 500 && mouseX < 540) && (mouseY > 235 && mouseY < 275)) //C
      if(orig == -1) orig = 2; 
      else dest = 2;
   else if((mouseX > 325 && mouseX < 365) && (mouseY > 435 && mouseY < 475)) //D
      if(orig == -1) orig = 3; 
      else dest = 3;
   else if((mouseX > 255 && mouseX < 295) && (mouseY > 405 && mouseY < 445)) //E
      if(orig == -1) orig = 4; 
      else dest = 4;
   else if((mouseX > 210 && mouseX < 250) && (mouseY > 370 && mouseY < 410)) //F
      if(orig == -1) orig = 5; 
      else dest = 5;
   else if((mouseX > 160 && mouseX < 200) && (mouseY > 205 && mouseY < 245)) //G
      if(orig == -1) orig = 6;
      else dest = 6;
   else if((mouseX > 95 && mouseX < 135) && (mouseY > 400 && mouseY < 440)) //H
      if(orig == -1) orig = 7;
      else dest = 7;
        
   if(dest != -1) {
     clear();
     image(loadImage("canada.jpg"), 0, 0);
     image(loadImage("flighttime.png"), 30, 60);
     
     drawE(graphed.path(orig, dest));
     graphed.reset(); 
   }  
}
