package com.ssm.pojo;

public class DormDetail {
    private String id; //宿舍号

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "DormDetail{" +
                "id='" + id + '\'' +
                '}';
    }
}
