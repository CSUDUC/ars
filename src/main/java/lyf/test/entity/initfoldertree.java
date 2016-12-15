package lyf.test.entity;

import java.util.Date;

public class initfoldertree extends initfoldertreeKey {
    private String nameeng;

    private String namechi;

    private Integer level;

    private String parentkeys;

    private String childkeys;

    private String fkeyinitmodule;

    private String extend1;

    private Integer status;

    private Date timeadd;

    private Date timeupdate;

    private String labelids;

    public String getNameeng() {
        return nameeng;
    }

    public void setNameeng(String nameeng) {
        this.nameeng = nameeng == null ? null : nameeng.trim();
    }

    public String getNamechi() {
        return namechi;
    }

    public void setNamechi(String namechi) {
        this.namechi = namechi == null ? null : namechi.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getParentkeys() {
        return parentkeys;
    }

    public void setParentkeys(String parentkeys) {
        this.parentkeys = parentkeys == null ? null : parentkeys.trim();
    }

    public String getChildkeys() {
        return childkeys;
    }

    public void setChildkeys(String childkeys) {
        this.childkeys = childkeys == null ? null : childkeys.trim();
    }

    public String getFkeyinitmodule() {
        return fkeyinitmodule;
    }

    public void setFkeyinitmodule(String fkeyinitmodule) {
        this.fkeyinitmodule = fkeyinitmodule == null ? null : fkeyinitmodule.trim();
    }

    public String getExtend1() {
        return extend1;
    }

    public void setExtend1(String extend1) {
        this.extend1 = extend1 == null ? null : extend1.trim();
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

    public Date getTimeupdate() {
        return timeupdate;
    }

    public void setTimeupdate(Date timeupdate) {
        this.timeupdate = timeupdate;
    }

    public String getLabelids() {
        return labelids;
    }

    public void setLabelids(String labelids) {
        this.labelids = labelids == null ? null : labelids.trim();
    }
}