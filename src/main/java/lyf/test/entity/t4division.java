package lyf.test.entity;

public class t4division extends t4divisionKey {
    private Integer divno;

    private String divparentname;

    private String divparentno;

    public Integer getDivno() {
        return divno;
    }

    public void setDivno(Integer divno) {
        this.divno = divno;
    }

    public String getDivparentname() {
        return divparentname;
    }

    public void setDivparentname(String divparentname) {
        this.divparentname = divparentname == null ? null : divparentname.trim();
    }

    public String getDivparentno() {
        return divparentno;
    }

    public void setDivparentno(String divparentno) {
        this.divparentno = divparentno == null ? null : divparentno.trim();
    }
}