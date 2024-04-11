package com.ssm.service;

import com.ssm.pojo.DormInfo;
import com.ssm.pojo.Pager;

import java.util.List;
import java.util.Map;

public interface DormInfoService {

    //获取所有宿舍分配编号
    List<DormInfo> getAll();
    //获取满足条件的宿舍总数
    int count(DormInfo dormInfo);

    //获取满足条件的宿舍列表
    List<DormInfo> findDormInfo(DormInfo dormInfo, Pager pager);

    //更新宿舍人数
    int updateDormById(String id);

    //查询每个宿舍已住人数
    List<DormInfo> getDormNumber();
}
