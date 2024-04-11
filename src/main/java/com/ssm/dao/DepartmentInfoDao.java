package com.ssm.dao;

import com.ssm.pojo.DepartmentInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface DepartmentInfoDao {

    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "dep_name",property = "dep_name"),
            @Result(column = "id",property = "studentInfos",many = @Many(select ="com.ssm.dao.StudentInfoDao.selectStudentByDepId",fetchType = FetchType.EAGER))
    })
    @Select("select * from department")
    List<DepartmentInfo> getAll();

    @Select("select * from department where id=#{id}")
    DepartmentInfo selectById(@Param("id") int id);

}
