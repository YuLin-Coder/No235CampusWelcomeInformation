package com.ssm.service;

import com.ssm.pojo.Pager;
import com.ssm.pojo.StudentInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentInfoService {
    //学生登录验证
    StudentInfo login(StudentInfo stu);
    //获取满足条件的学生总数
    int count(Map<String,Object> params);
    //获取满足条件的学生列表
    List<StudentInfo> findStudentInfo(StudentInfo studentInfo, Pager pager);
    //添加学生
    int addStudent(StudentInfo studentInfo);
    //删除学生
    int deleteStudent(String sno);
    //更新学生
    int updateStudent(StudentInfo studentInfo);

    //根据条件查询学生列表
    List<StudentInfo> allocationStudent(StudentInfo studentInfo);

    //为学生分配宿舍
    int updateStudentDorm(StudentInfo studentInfo);

    //查看所有学生列表
    List<StudentInfo> getAllStudent();

    //获取已分配宿舍的学生列表
    List<Integer> getAlreadyDistribute();
    //获取未分配宿舍的学生列表
    List<Integer> getNoDistribute();

    //报到
    int changeMessage(StudentInfo studentInfo);

    //根据学号查询学生所有信息
    StudentInfo getStudent(StudentInfo studentInfo);

    //学生修改密码
    int changePassword(StudentInfo studentInfo);
}
