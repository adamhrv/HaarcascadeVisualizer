class Tree{

  ArrayList nodes;
  float fillAlpha = 1;
  int styleParam;
  int method = 2;

  Tree(ArrayList items){
    nodes = items;//nodes
  }

  void addItem(ArrayList node){
    nodes.add(node);
  }

  int getNumItems(){
    return nodes.size();
  }

  void setAlpha(float f){
    fillAlpha = f;
  }

  void setStyle(int styleParam){
    this.styleParam = styleParam; 
  }

  PGraphics render(int imgSize,float stageScale,int maxItems){

    PGraphics pg = createGraphics(imgSize,imgSize,P2D);

    for(int i = 0;i<nodes.size();i++){//for each node

      Node node = (Node) nodes.get(i);

      boolean invThreshold = (node.rightVal < node.leftVal) ? true : false;
      invThreshold = false;

      pg.beginDraw();
      pg.strokeWeight(2);
      pg.strokeCap(SQUARE);
      //pg.strokeJoin(MITER);

      pg.scale(stageScale);

      color fillColor = color(255);
      fillColor = color(20,200,20);
      //  HaarRect[] haarRects = node.getHaarRectangles();
      HaarRect[] haarRects = node.getHaarRectanglesSorted();

      for(int j=0;j<haarRects.length;j++){

        Rectangle r = haarRects[j].getRectangle();

        if(invThreshold == false){
          if(haarRects[j].dweight > 0){
            fillColor = color(255);
          } 
          else {
            fillColor = color(0);
          }
        } 
        else {
          if(haarRects[j].dweight > 0){
            fillColor = color(255);
          } 
          else {
            fillColor = color(0);
          }            
        }

        // Use outlines for double nodes
        if(true){
          pg.noStroke();
          pg.fill(fillColor);
        } 
        else {
          pg.stroke(fillColor);
          // pg.strokeCap(SQUARE);
          // pg.strokeJoin(MITER);
          pg.noFill();
        }
        pg.rect(r.x,r.y,r.width,r.height);

      }

      pg.endDraw();
    }
    return pg;
  }


}









































