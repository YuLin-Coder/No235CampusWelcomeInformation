package com.ssm.dao;

import com.ssm.pojo.AdminInfo;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface AdminInfoDao {

    //查询合法管理员
    @Select("select * from admin where id=#{id} and password=#{password}")
    AdminInfo login(AdminInfo adminInfo);


    //更新管理员信息
    @Update("update admin set adminName=#{adminName},password=#{password} where id=#{id}")
    Integer updateAdminInfo(AdminInfo adminInfo);
}
