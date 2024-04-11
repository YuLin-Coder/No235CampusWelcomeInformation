package com.ssm.pojo;

import java.util.List;

public class DepartmentInfo {
    private int id;     //院系编号
    private String dep_name;//院系名称
    private List<StudentInfo> studentInfos;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDep_name() {
        return dep_name;
    }

    public void setDep_name(String dep_name) {
        this.dep_name = dep_name;
    }

    public List<StudentInfo> getStudentInfos() {
        return studentInfos;
    }

    public void setStudentInfos(List<StudentInfo> studentInfos) {
        this.studentInfos = studentInfos;
    }

    @Override
    public String toString() {
        return "DepartmentInfo{" +
                "id=" + id +
                ", dep_name='" + dep_name + '\'' +
                ", studentInfos=" + studentInfos +
                '}';
    }
}
