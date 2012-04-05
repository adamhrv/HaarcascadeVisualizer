// XML Loading Routine
ArrayList doLoadXML(String file){ 
  ArrayList returnList = new ArrayList();

  XMLElement xml = new XMLElement(this,file);
  xml = xml.getChild(0);

  String sampleSizeStr = (xml.getChild(0).getContent().trim());//size
  sampleSize = int(split(sampleSizeStr," "));

  XMLElement returnListNode = xml.getChild(1);//returnList
  int numReturnList = returnListNode.getChildCount();
  

  for(int i=0;i<numReturnList;i++){//20 returnList in this file

    XMLElement treesNode = returnListNode.getChild(i).getChild(0);
    int numTrees = treesNode.getChildCount();

    ArrayList trees = new ArrayList();// holder of nodes

    for(int j=0;j<numTrees;j++){
      int numNodes = treesNode.getChild(j).getChildCount();      

      ArrayList nodes = new ArrayList();
      for(int n=0;n<numNodes;n++){
        XMLElement node = treesNode.getChild(j).getChild(n);
        XMLElement feature = node.getChild(0);

        XMLElement rectsNode = feature.getChild(0);
        int numRects = rectsNode.getChildCount();

        HaarRect[] haarRects = new HaarRect[numRects];
        int[] weights = new int[numRects];

        for(int k=0;k<numRects;k++){
          XMLElement kid = rectsNode.getChild(k);

          String[] rStr = split(kid.getContent().trim()," ");

          int[] coords = new int[5];

          for(int l = 0;l<coords.length;l++){
            coords[l] = int(rStr[l]); 
          }

          HaarRect hr = new HaarRect(coords);
          haarRects[k] = hr;

        }

        boolean tilted = boolean(feature.getChild(1).getContent());
        float leftVal = 0;
        float rightVal = 0;
        int rightNode = 0;
        int leftNode = 0;
        float threshold = float(node.getChild(2).getContent().trim());

        for(int l=3;l<node.getChildCount();l++){
          String nName = node.getChild(l).getName();
          XMLElement kid = node.getChild(l);

          if(node.getName().equals("left_val")){
            leftVal = float(kid.getContent().trim());
          } 
          else if (nName.equals("left_node")){
            leftNode = int(kid.getContent().trim());
          } 
          else if(nName.equals("right_val")){
            rightVal = float(kid.getContent().trim());
          } 
          else if(nName.equals("right_node")){
            rightNode = int(kid.getContent().trim());
          }
        }//end for rest of inside the node
        nodes.add(new Node(haarRects,tilted,threshold,leftVal,rightVal,leftNode,rightNode));
      }// end nodes loop

      trees.add(new Tree(nodes));

    }//end trees loop
    returnList.add(new Stage(trees));
  }//end returnList loop


  println("");
  println("[cascadeLoader] Total stages: "+returnList.size());
  println("[cascadeLoader] Sample size: "+sampleSize[0] + ", "+sampleSize[1]);
  println("[cascadeLoader] Rows: "+rows+", Columns: "+cols);

  return returnList;
}



