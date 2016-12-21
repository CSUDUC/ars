package lyf.test.entity;

public class t2dataKey {
    private Integer id;

    private String dataname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDataname() {
        return dataname;
    }

    public void setDataname(String dataname) {
        this.dataname = dataname == null ? null : dataname.trim();
    }
}