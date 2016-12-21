package lyf.test.entity;

import java.util.Date;

public class t2data extends t2dataKey {
    private String dataurl;

    private String imgexd;

    private Date dateadd;

    private Date datatime;

    private String satname;

    private String sensorname;

    private Integer bandnum;

    public String getDataurl() {
        return dataurl;
    }

    public void setDataurl(String dataurl) {
        this.dataurl = dataurl == null ? null : dataurl.trim();
    }

    public String getImgexd() {
        return imgexd;
    }

    public void setImgexd(String imgexd) {
        this.imgexd = imgexd == null ? null : imgexd.trim();
    }

    public Date getDateadd() {
        return dateadd;
    }

    public void setDateadd(Date dateadd) {
        this.dateadd = dateadd;
    }

    public Date getDatatime() {
        return datatime;
    }

    public void setDatatime(Date datatime) {
        this.datatime = datatime;
    }

    public String getSatname() {
        return satname;
    }

    public void setSatname(String satname) {
        this.satname = satname == null ? null : satname.trim();
    }

    public String getSensorname() {
        return sensorname;
    }

    public void setSensorname(String sensorname) {
        this.sensorname = sensorname == null ? null : sensorname.trim();
    }

    public Integer getBandnum() {
        return bandnum;
    }

    public void setBandnum(Integer bandnum) {
        this.bandnum = bandnum;
    }
}