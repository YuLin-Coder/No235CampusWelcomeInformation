package com.ssm.service;

import com.ssm.pojo.DepartmentInfo;

import java.util.List;

public interface DepartmentInfoService {
    //查询所有院系
    List<DepartmentInfo> getAll();

}
