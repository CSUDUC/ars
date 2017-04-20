package lyf.test.entity;

public class t1userKey {
    private String username;

    private String paswd;

    private Integer id;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPaswd() {
        return paswd;
    }

    public void setPaswd(String paswd) {
        this.paswd = paswd == null ? null : paswd.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}