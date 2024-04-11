package com.ssm.service;

import com.ssm.pojo.AdminInfo;

public interface AdminService {
    //查询合法管理员
    AdminInfo login(AdminInfo adminInfo);

    //更新管理员信息
    Integer changeMessage(AdminInfo adminInfo);
}
