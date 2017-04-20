package lyf.test.entity;

public class t5citys {
    private String codeid;

    private String city1;

    private String city2;

    private String city3;

    public String getCodeid() {
        return codeid;
    }

    public void setCodeid(String codeid) {
        this.codeid = codeid == null ? null : codeid.trim();
    }

    public String getCity1() {
        return city1;
    }

    public void setCity1(String city1) {
        this.city1 = city1 == null ? null : city1.trim();
    }

    public String getCity2() {
        return city2;
    }

    public void setCity2(String city2) {
        this.city2 = city2 == null ? null : city2.trim();
    }

    public String getCity3() {
        return city3;
    }

    public void setCity3(String city3) {
        this.city3 = city3 == null ? null : city3.trim();
    }
}