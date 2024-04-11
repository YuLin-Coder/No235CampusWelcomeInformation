package com.ssm.pojo;

public class BuildingInfo {
    private String id;  //楼号

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "BuildingInfo{" +
                "id='" + id + '\'' +
                '}';
    }
}
