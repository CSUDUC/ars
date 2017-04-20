package lyf.test.entity;

import java.util.Date;

public class t1user extends t1userKey {
    private String nametiny;

    private String telphone;

    private String urlphoto;

    private String address;

    private String unit;

    private String email;

    private String wechat;

    private String realname;

    private Date age;

    private String sex;

    private String cardid;

    private String weichatphoto;

    private Date servstarttime;

    private Boolean yeildesm;

    private Integer status;

    private Date timeadd;

    private String labelids;

    private Integer opid;

    private Date servendtime;

    private String locno;

    private String producttype;

    public String getNametiny() {
        return nametiny;
    }

    public void setNametiny(String nametiny) {
        this.nametiny = nametiny == null ? null : nametiny.trim();
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    public String getUrlphoto() {
        return urlphoto;
    }

    public void setUrlphoto(String urlphoto) {
        this.urlphoto = urlphoto == null ? null : urlphoto.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat == null ? null : wechat.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public Date getAge() {
        return age;
    }

    public void setAge(Date age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid == null ? null : cardid.trim();
    }

    public String getWeichatphoto() {
        return weichatphoto;
    }

    public void setWeichatphoto(String weichatphoto) {
        this.weichatphoto = weichatphoto == null ? null : weichatphoto.trim();
    }

    public Date getServstarttime() {
        return servstarttime;
    }

    public void setServstarttime(Date servstarttime) {
        this.servstarttime = servstarttime;
    }

    public Boolean getYeildesm() {
        return yeildesm;
    }

    public void setYeildesm(Boolean yeildesm) {
        this.yeildesm = yeildesm;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getTimeadd() {
        return timeadd;
    }

    public void setTimeadd(Date timeadd) {
        this.timeadd = timeadd;
    }

    public String getLabelids() {
        return labelids;
    }

    public void setLabelids(String labelids) {
        this.labelids = labelids == null ? null : labelids.trim();
    }

    public Integer getOpid() {
        return opid;
    }

    public void setOpid(Integer opid) {
        this.opid = opid;
    }

    public Date getServendtime() {
        return servendtime;
    }

    public void setServendtime(Date servendtime) {
        this.servendtime = servendtime;
    }

    public String getLocno() {
        return locno;
    }

    public void setLocno(String locno) {
        this.locno = locno == null ? null : locno.trim();
    }

    public String getProducttype() {
        return producttype;
    }

    public void setProducttype(String producttype) {
        this.producttype = producttype == null ? null : producttype.trim();
    }
}