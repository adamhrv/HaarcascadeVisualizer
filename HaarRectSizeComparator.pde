
public class HaarRectSizeComparator implements Comparator {

  public int compare(Object h1, Object h2) {

    int a1 = ((HaarRect) h1).getArea();

    int a2 = ((HaarRect) h2).getArea();

    if (a1 > a2)

      return 1;

    else if (a1 < a2)

      return -1;

    else
      return 0;

  }

}



