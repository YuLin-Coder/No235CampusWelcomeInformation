package com.ssm.pojo;

public class AdminInfo {
    private String id;          //管理员账号
    private String password;    //管理员密码
    private String adminName;   //管理员姓名

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Override
    public String toString() {
        return "adminInfo{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", adminName='" + adminName + '\'' +
                '}';
    }
}
