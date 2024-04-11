package com.ssm.service.impl;

import com.ssm.dao.DepartmentInfoDao;
import com.ssm.pojo.DepartmentInfo;
import com.ssm.service.DepartmentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("departmentInfoService")
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
public class DepartmentInfoServiceImpl implements DepartmentInfoService {
    @Autowired
    DepartmentInfoDao departmentInfoDao;


    @Override
    public List<DepartmentInfo> getAll() {
        return departmentInfoDao.getAll();
    }


}
