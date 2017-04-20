package lyf.test.entity;

public class t6order extends t6orderKey {
    private String sdpath;

    private String geometry;

    private String ordername;

    private String cropkinds;

    public String getSdpath() {
        return sdpath;
    }

    public void setSdpath(String sdpath) {
        this.sdpath = sdpath == null ? null : sdpath.trim();
    }

    public String getGeometry() {
        return geometry;
    }

    public void setGeometry(String geometry) {
        this.geometry = geometry == null ? null : geometry.trim();
    }

    public String getOrdername() {
        return ordername;
    }

    public void setOrdername(String ordername) {
        this.ordername = ordername == null ? null : ordername.trim();
    }

    public String getCropkinds() {
        return cropkinds;
    }

    public void setCropkinds(String cropkinds) {
        this.cropkinds = cropkinds == null ? null : cropkinds.trim();
    }
}