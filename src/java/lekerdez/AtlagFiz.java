package lekerdez;

public class AtlagFiz implements Comparable<Reszleg> {

  private String reszlegNev;
  private int atlagfiz;

  public AtlagFiz(String reszlegNev, int atlagFiz) {
    this.reszlegNev = reszlegNev;
    this.atlagfiz = atlagfiz;
  }

  public String getReszlegNev() {
    return reszlegNev;
  }

  public int getAtlagFiz() {
    return atlagfiz;
  }

  @Override
  public String toString() {
    return reszlegNev;
  }

  @Override
  public int compareTo(Reszleg masik) {
    return this.reszlegNev.compareTo(masik.getReszlegNev());
  }
}