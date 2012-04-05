import java.util.*;

class Node {
  HaarRect[] haarRects;
  boolean tilted;
  float leftVal, rightVal, threshold;
  int leftNode, rightNode;


  Node(HaarRect[] haarRects, boolean tilted, float threshold, float leftVal, float rightVal, int leftNode, int rightNode) {
    this.haarRects = haarRects;
    this.threshold = threshold;
    this.tilted = tilted;
    this.leftVal = leftVal;
    this.rightVal = rightVal;
    this.leftNode = leftNode;
    this.rightNode = rightNode;
  }

  Rectangle[] getRectangles() {
    Rectangle[] rects = new Rectangle[haarRects.length];
    for (int i=0;i<haarRects.length;i++) {
      rects[i] = new Rectangle(haarRects[i].dx, haarRects[i].dy, haarRects[i].dw, haarRects[i].dh);
    }
    return rects;
  }

  HaarRect[] getHaarRectangles() {
    return haarRects;
  }

  HaarRect[] getHaarRectanglesSorted() {
    HaarRect[] sorted = haarRects;
    Arrays.sort(sorted, new HaarRectSizeComparator());
    return sorted;
  }
}


