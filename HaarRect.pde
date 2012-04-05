class HaarRect{

  int dx,dy,dw,dh,dweight,sx,sy,sw,sh,sweight;

  HaarRect(int[] d){
    dx = d[0];
    dy = d[1];
    dw = d[2];
    dh = d[3];
    dweight = d[4];
  } 

  int getArea(){
    return sw*sw; 
  }

  void setScale(int s){
    sx = int( dx * s );
    sy = int( dy * s );
    sw = int( dw * s );
    sh = int( dh * s );
  }

  void setScaleWeight(int s){
    sweight = dweight * s;
  }

  Rectangle getRectangle(){
    return new Rectangle(dx,dy,dw,dh); 
  }


}





