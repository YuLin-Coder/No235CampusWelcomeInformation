package com.ssm.pojo;


public class StudentInfo {
    private String sno;         //学号
    private String sname;       //姓名
    private String password;    //密码
    private String sex;         //性别
    private String phone;       //电话
    private String email;       //邮箱
    private String address;     //住址
    private String acquireStatus;//是否领取物品
    private String checkStatus; //是否报到
    private String checkTime;   //报到时间
//    String dorm_id;     //宿舍分配编号(外键)
   private DormInfo dormInfo;
    private String idcard;      //身份证号
//    int dep_id;         //院系编号(外键)
    private DepartmentInfo departmentInfo;

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAcquireStatus() {
        return acquireStatus;
    }

    public void setAcquireStatus(String acquireStatus) {
        this.acquireStatus = acquireStatus;
    }

    public String getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(String checkStatus) {
        this.checkStatus = checkStatus;
    }

    public String getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(String checkTime) {
        this.checkTime = checkTime;
    }

    public DormInfo getDormInfo() {
        return dormInfo;
    }

    public void setDormInfo(DormInfo dormInfo) {
        this.dormInfo = dormInfo;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public DepartmentInfo getDepartmentInfo() {
        return departmentInfo;
    }

    public void setDepartmentInfo(DepartmentInfo departmentInfo) {
        this.departmentInfo = departmentInfo;
    }

    @Override
    public String toString() {
        return "StudentInfo{" +
                "sno='" + sno + '\'' +
                ", sname='" + sname + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", acquireStatus='" + acquireStatus + '\'' +
                ", checkStatus='" + checkStatus + '\'' +
                ", checkTime='" + checkTime + '\'' +
                ", dormInfo=" + dormInfo +
                ", idcard='" + idcard + '\'' +
                ", departmentInfo=" + departmentInfo +
                '}';
    }
}
