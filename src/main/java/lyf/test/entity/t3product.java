package lyf.test.entity;

import java.util.Date;

public class t3product extends t3productKey {
    private String producturl;

    private String imgexd;

    private String productclass;

    private Date dateadd;

    private Date producttime;

    private Date datatime;

    private String dataname;

    private String dataurl;

    public String getProducturl() {
        return producturl;
    }

    public void setProducturl(String producturl) {
        this.producturl = producturl == null ? null : producturl.trim();
    }

    public String getImgexd() {
        return imgexd;
    }

    public void setImgexd(String imgexd) {
        this.imgexd = imgexd == null ? null : imgexd.trim();
    }

    public String getProductclass() {
        return productclass;
    }

    public void setProductclass(String productclass) {
        this.productclass = productclass == null ? null : productclass.trim();
    }

    public Date getDateadd() {
        return dateadd;
    }

    public void setDateadd(Date dateadd) {
        this.dateadd = dateadd;
    }

    public Date getProducttime() {
        return producttime;
    }

    public void setProducttime(Date producttime) {
        this.producttime = producttime;
    }

    public Date getDatatime() {
        return datatime;
    }

    public void setDatatime(Date datatime) {
        this.datatime = datatime;
    }

    public String getDataname() {
        return dataname;
    }

    public void setDataname(String dataname) {
        this.dataname = dataname == null ? null : dataname.trim();
    }

    public String getDataurl() {
        return dataurl;
    }

    public void setDataurl(String dataurl) {
        this.dataurl = dataurl == null ? null : dataurl.trim();
    }
}