package com.ssm.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.ssm.dao.provider.DormInfoDynaSqlProvider;
import com.ssm.pojo.DormInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;
import java.util.Map;

public interface DormInfoDao {

    //获取所有宿舍分配编号
    @Select("select * from dorm")
    List<DormInfo> getAll();


    @Select("select * from dorm where id=#{id}")
    DormInfo selectById(@Param("id") String id);

    //获取满足条件的宿舍总数
    @SelectProvider(type = DormInfoDynaSqlProvider.class,method="count")
    Integer count(DormInfo dormInfo);

    //获取满足条件的宿舍列表
@Results({
        @Result(id = true,column ="id",property = "id"),
        @Result(column = "alreadyNumber",property = "alreadyNumber"),
        @Result(column = "allNumber",property = "allNumber"),
        @Result(column = "status",property = "status"),
        @Result(column ="sex",property = "sex"),
        @Result(column = "id",property = "studentInfos",many = @Many(select = "com.ssm.dao.StudentInfoDao.selectStudentById",fetchType = FetchType.EAGER))
})
    @SelectProvider(type = DormInfoDynaSqlProvider.class,method = "selectWithParam")
    List<DormInfo> selectByPage(Map<String, Object> params);


    //更新宿舍居住信息
    @Update("update dorm set alreadyNumber=alreadyNumber+1 where id=#{id}")
    int updateDormById(@Param("id") String id);

}
