package com.ssm.dao;

import com.ssm.dao.provider.StudentInfoDynaSqlProvider;
import com.ssm.pojo.StudentInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;
import java.util.Map;

public interface StudentInfoDao {

    //学生登录验证
    @Results({@Result(id = true,column = "sno",property = "sno"),
            @Result(column = "sname",property = "sname"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property ="address"),
            @Result(column = "acquireStatus",property = "acquireStatus"),
            @Result(column = "checkStatus",property = "checkStatus"),
            @Result(column = "checkTime",property = "checkTime"),
            @Result(column = "dorm_id",property = "dormInfo",
                    one=@One(select = "com.ssm.dao.DormInfoDao.selectById", fetchType = FetchType.EAGER)),
            @Result(column = "idcard",property = "idcard"),
            @Result(column = "dep_id",property ="departmentInfo",
                    one = @One(select = "com.ssm.dao.DepartmentInfoDao.selectById", fetchType = FetchType.EAGER))
    })
    @Select("select * from student where sno=#{sno} and password=#{password}")
    StudentInfo login(StudentInfo stu);


    //根据条件查询学生总数
    //    @Select("select count(*) from student")
    @SelectProvider(type = StudentInfoDynaSqlProvider.class,method ="count")
    Integer count(Map<String, Object> params);

    //分页获取学生列表
    @Results({@Result(id = true,column = "sno",property = "sno"),
            @Result(column = "sname",property = "sname"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property ="address"),
            @Result(column = "acquireStatus",property = "acquireStatus"),
            @Result(column = "checkStatus",property = "checkStatus"),
            @Result(column = "checkTime",property = "checkTime"),
            @Result(column = "dorm_id",property = "dormInfo",
                    one=@One(select = "com.ssm.dao.DormInfoDao.selectById", fetchType = FetchType.EAGER)),
            @Result(column = "idcard",property = "idcard"),
            @Result(column = "dep_id",property ="departmentInfo",
                    one = @One(select = "com.ssm.dao.DepartmentInfoDao.selectById", fetchType = FetchType.EAGER))
    })
    @SelectProvider(type = StudentInfoDynaSqlProvider.class,method="selectWithParam")
    List<StudentInfo> selectByPage(Map<String,Object> params);

    //添加学生
    @Insert("insert into student(sno,sname,sex,dep_id) values(#{sno},#{sname},#{sex},#{departmentInfo.id})")
    int addStudent(StudentInfo studentInfo);

    //删除学生
    @Delete("delete from student where sno in (${sno})")
    int deleteStudent(@Param("sno") String sno);

    //更新学生
    @UpdateProvider(type = StudentInfoDynaSqlProvider.class,method = "updateWithParam")
    int updateStudent(StudentInfo studentInfo);



    //根据宿舍编号查学生
    @Results({@Result(id = true,column = "sno",property = "sno"),
            @Result(column = "sname",property = "sname"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property ="address"),
            @Result(column = "acquireStatus",property = "acquireStatus"),
            @Result(column = "checkStatus",property = "checkStatus"),
            @Result(column = "checkTime",property = "checkTime"),
            @Result(column = "dorm_id",property = "dormInfo",
                    one=@One(select = "com.ssm.dao.DormInfoDao.selectById", fetchType = FetchType.EAGER)),
            @Result(column = "idcard",property = "idcard"),
            @Result(column = "dep_id",property ="departmentInfo",
                    one = @One(select = "com.ssm.dao.DepartmentInfoDao.selectById", fetchType = FetchType.EAGER))
    })
    @Select("select * from student where dorm_id=#{dorm_id}")
    List<StudentInfo> selectStudentById(@Param("dorm_id") String dorm_id);



    //根据条件查询可分配宿舍的学生列表
    @Results({@Result(id = true,column = "sno",property = "sno"),
            @Result(column = "sname",property = "sname"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property ="address"),
            @Result(column = "acquireStatus",property = "acquireStatus"),
            @Result(column = "checkStatus",property = "checkStatus"),
            @Result(column = "checkTime",property = "checkTime"),
            @Result(column = "dorm_id",property = "dormInfo",
                    one=@One(select = "com.ssm.dao.DormInfoDao.selectById", fetchType = FetchType.EAGER)),
            @Result(column = "idcard",property = "idcard"),
            @Result(column = "dep_id",property ="departmentInfo",
                    one = @One(select = "com.ssm.dao.DepartmentInfoDao.selectById", fetchType = FetchType.EAGER))
    })
    @SelectProvider(type = StudentInfoDynaSqlProvider.class,method ="allocationStudent")
    List<StudentInfo> allocationStudent(StudentInfo studentInfo);



    //为学生分配宿舍
    @Update("update student set dorm_id=#{dormInfo.id} where sno=#{sno}")
    int updateStudentDorm(StudentInfo studentInfo);


    //根据院系编号查询学生列表
    @Results({@Result(id = true,column = "sno",property = "sno"),
            @Result(column = "sname",property = "sname"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property ="address"),
            @Result(column = "acquireStatus",property = "acquireStatus"),
            @Result(column = "checkStatus",property = "checkStatus"),
            @Result(column = "checkTime",property = "checkTime"),
            @Result(column = "dorm_id",property = "dormInfo",
                    one=@One(select = "com.ssm.dao.DormInfoDao.selectById", fetchType = FetchType.EAGER)),
            @Result(column = "idcard",property = "idcard"),
            @Result(column = "dep_id",property ="departmentInfo",
                    one = @One(select = "com.ssm.dao.DepartmentInfoDao.selectById", fetchType = FetchType.EAGER))
    })
    @Select("select * from student where dep_id=#{dep_id}")
    List<StudentInfo> selectStudentByDepId(@Param("dep_id") int dep_id);


    //获取所有学生列表
    @Results({@Result(id = true,column = "sno",property = "sno"),
            @Result(column = "sname",property = "sname"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property ="address"),
            @Result(column = "acquireStatus",property = "acquireStatus"),
            @Result(column = "checkStatus",property = "checkStatus"),
            @Result(column = "checkTime",property = "checkTime"),
            @Result(column = "dorm_id",property = "dormInfo",
                    one=@One(select = "com.ssm.dao.DormInfoDao.selectById", fetchType = FetchType.EAGER)),
            @Result(column = "idcard",property = "idcard"),
            @Result(column = "dep_id",property ="departmentInfo",
                    one = @One(select = "com.ssm.dao.DepartmentInfoDao.selectById", fetchType = FetchType.EAGER))
    })
    @Select("select * from student")
    List<StudentInfo> getAllStudent();

    //获取已分配的学生列表

    @Select("select count(sno) from student where dorm_id is not null group by dep_id order by dep_id")
    List<Integer> getAlreadyDistribute();

    //获取未分配的学生列表

    @Select("select count(sno) from student where dorm_id is null group by dep_id order by dep_id")
    List<Integer> getNoDistribute();


    //报到
    @UpdateProvider(type = StudentInfoDynaSqlProvider.class,method ="updateWithParam")
    int changeMessage(StudentInfo studentInfo);




    @Results({@Result(id = true,column = "sno",property = "sno"),
            @Result(column = "sname",property = "sname"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property ="address"),
            @Result(column = "acquireStatus",property = "acquireStatus"),
            @Result(column = "checkStatus",property = "checkStatus"),
            @Result(column = "checkTime",property = "checkTime"),
            @Result(column = "dorm_id",property = "dormInfo",
                    one=@One(select = "com.ssm.dao.DormInfoDao.selectById", fetchType = FetchType.EAGER)),
            @Result(column = "idcard",property = "idcard"),
            @Result(column = "dep_id",property ="departmentInfo",
                    one = @One(select = "com.ssm.dao.DepartmentInfoDao.selectById", fetchType = FetchType.EAGER))
    })
    @Select("select * from student where sno=#{sno}")
    StudentInfo getStudent(StudentInfo studentInfo);


    //修改密码
    @Update("update student set password=#{password} where sno=#{sno}")
    int changePassword(StudentInfo studentInfo);
}
