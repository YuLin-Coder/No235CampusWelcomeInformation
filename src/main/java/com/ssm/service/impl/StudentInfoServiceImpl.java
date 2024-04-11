package com.ssm.service.impl;

import com.ssm.dao.DepartmentInfoDao;
import com.ssm.dao.StudentInfoDao;
import com.ssm.pojo.Pager;
import com.ssm.pojo.StudentInfo;
import com.ssm.service.StudentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("studentInfoService")
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

public class StudentInfoServiceImpl implements StudentInfoService {
    @Autowired
    StudentInfoDao studentInfoDao;
    @Autowired
    DepartmentInfoDao departmentInfoDao;
    @Override
    public StudentInfo login(StudentInfo stu) {
        return studentInfoDao.login(stu);
    }

    @Override
    public int count(Map<String, Object> params) {
        return studentInfoDao.count(params);
    }

    @Override
    public List<StudentInfo> findStudentInfo(StudentInfo studentInfo, Pager pager) {
        //创建对象params
        Map<String,Object> params=new HashMap<>();
        //将封装有查询条件的studentInfo对象放入params
        params.put("studentInfo",studentInfo);
        //根据条件计算学生总数
        int recordCount=studentInfoDao.count(params);
        //给pager对象设置rowCount属性值(记录总数)
        pager.setRowCount(recordCount);
        if(recordCount>0){
            //将pager对象放入params
            params.put("pager",pager);
        }
        //分页获取学生信息
        return studentInfoDao.selectByPage(params);
    }

    @Override
    public int addStudent(StudentInfo studentInfo) {
        return studentInfoDao.addStudent(studentInfo);
    }

    @Override
    public int deleteStudent(String sno) {
        return studentInfoDao.deleteStudent(sno);
    }

    @Override
    public int updateStudent(StudentInfo studentInfo) {
        return studentInfoDao.updateStudent(studentInfo);
    }

    @Override
    public List<StudentInfo> allocationStudent(StudentInfo studentInfo) {
        return studentInfoDao.allocationStudent(studentInfo);
    }

    @Override
    public int updateStudentDorm(StudentInfo studentInfo) {
        return studentInfoDao.updateStudentDorm(studentInfo);
    }

    @Override
    public List<StudentInfo> getAllStudent() {
        return studentInfoDao.getAllStudent();
    }

    @Override
    public List<Integer> getAlreadyDistribute() {
        return studentInfoDao.getAlreadyDistribute();
    }

    @Override
    public List<Integer> getNoDistribute() {
        return studentInfoDao.getNoDistribute();
    }

    @Override
    public int changeMessage(StudentInfo studentInfo) {
        return studentInfoDao.changeMessage(studentInfo);
    }

    @Override
    public StudentInfo getStudent(StudentInfo studentInfo) {
        return studentInfoDao.getStudent(studentInfo);
    }

    @Override
    public int changePassword(StudentInfo studentInfo) {
        return studentInfoDao.changePassword(studentInfo);
    }


}
