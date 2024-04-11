package com.ssm.service.impl;

import com.ssm.dao.AdminInfoDao;
import com.ssm.pojo.AdminInfo;
import com.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminInfoDao adminInfoDao;

    @Override
    public AdminInfo login(AdminInfo adminInfo) {
        return adminInfoDao.login(adminInfo);
    }

    @Override
    public Integer changeMessage(AdminInfo adminInfo) {
        return adminInfoDao.updateAdminInfo(adminInfo);
    }

}
