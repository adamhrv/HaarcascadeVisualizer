class Stage{
  ArrayList items;

  Stage(ArrayList items){
    this.items = items;
  }

  void addItem(Tree tree){
    items.add(tree);
  }
  
  int getNumItems(){
    return items.size();
  }
 
  Tree getTree(int id){
    Tree t = (Tree) items.get(id);
    return t;
  }
  
}


