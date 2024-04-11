package com.ssm.pojo;

//import jdk.net.SocketFlow;

import java.util.List;

public class DormInfo {
    private String id;      //宿舍分配编号
    private int alreadyNumber;//已住人数
    private int allNumber;    //可住人数
    private String status;    //是否住满
    private String sex;     //男生/女生宿舍
    private List<StudentInfo> studentInfos;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getAlreadyNumber() {
        return alreadyNumber;
    }

    public void setAlreadyNumber(int alreadyNumber) {
        this.alreadyNumber = alreadyNumber;
    }

    public int getAllNumber() {
        return allNumber;
    }

    public void setAllNumber(int allNumber) {
        this.allNumber = allNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public List<StudentInfo> getStudentInfos() {
        return studentInfos;
    }

    public void setStudentInfos(List<StudentInfo> studentInfos) {
        this.studentInfos = studentInfos;
    }

    @Override
    public String toString() {
        return "DormInfo{" +
                "id='" + id + '\'' +
                ", alreadyNumber=" + alreadyNumber +
                ", allNumber=" + allNumber +
                ", status='" + status + '\'' +
                ", sex='" + sex + '\'' +
                ", studentInfos=" + studentInfos +
                '}';
    }
}
