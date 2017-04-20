package lyf.test.entity;

public class t4divisionKey {
    private Integer id;

    private String divname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDivname() {
        return divname;
    }

    public void setDivname(String divname) {
        this.divname = divname == null ? null : divname.trim();
    }
}