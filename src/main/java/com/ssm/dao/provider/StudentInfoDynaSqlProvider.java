package com.ssm.dao.provider;

import com.ssm.pojo.StudentInfo;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class StudentInfoDynaSqlProvider {

    //根据条件查询学生总数
    public String count(Map<String,Object> params){
        return new SQL(){
            {
                SELECT("count(*)");
                FROM("student");
                if(params.get("studentInfo")!=null){
                    StudentInfo studentInfo=(StudentInfo)params.get("studentInfo");
                    if(studentInfo.getSno()!=null&&!"".equals(studentInfo.getSno())){
                        WHERE("sno=#{studentInfo.sno}");
                    }
                    if(studentInfo.getSname()!=null&&!"".equals(studentInfo.getSname())){
                        WHERE("sname like CONCAT('%',#{studentInfo.sname},'%')");
                    }
                    if(studentInfo.getSex()!=null&&!"".equals(studentInfo.getSex())&&!"请选择".equals(studentInfo.getSex())){
                        WHERE("sex=#{studentInfo.sex}");
                    }
                    if(studentInfo.getAcquireStatus()!=null&&!"".equals(studentInfo.getAcquireStatus())&&!"请选择".equals(studentInfo.getAcquireStatus())){
                        WHERE("acquireStatus=#{studentInfo.acquireStatus}");
                    }
                    if(studentInfo.getCheckStatus()!=null&&!"".equals(studentInfo.getCheckStatus())&&!"请选择".equals(studentInfo.getCheckStatus())){
                        WHERE("checkStatus=#{studentInfo.checkStatus}");
                    }
                    if(studentInfo.getDormInfo()!=null&&!"".equals(studentInfo.getDormInfo().getId())&&!"0".equals(studentInfo.getDormInfo().getId())){
                        WHERE("dorm_id=#{studentInfo.dormInfo.id}");
                    }
                    if(studentInfo.getDepartmentInfo()!=null&&studentInfo.getDepartmentInfo().getId()>0){
                        WHERE("dep_id=#{studentInfo.departmentInfo.id}");
                    }
                }
            }
        }.toString();
    }

    //根据条件查询学生列表
    public String selectWithParam(Map<String,Object> params){
        String sql=new SQL(){
            {
                SELECT("*");
                FROM("student");
                if(params.get("studentInfo")!=null){
                    StudentInfo studentInfo=(StudentInfo)params.get("studentInfo");
                    if(studentInfo.getSno()!=null&&!"".equals(studentInfo.getSno())){
                        WHERE("sno=#{studentInfo.sno}");
                    }
                    if(studentInfo.getSname()!=null&&!"".equals(studentInfo.getSname())){
                        WHERE("sname like CONCAT('%',#{studentInfo.sname},'%')");
                    }
                    if(studentInfo.getSex()!=null&&!"".equals(studentInfo.getSex())&&!"请选择".equals(studentInfo.getSex())){
                        WHERE("sex=#{studentInfo.sex}");
                    }
                    if(studentInfo.getAcquireStatus()!=null&&!"".equals(studentInfo.getAcquireStatus())&&!"请选择".equals(studentInfo.getAcquireStatus())){
                        WHERE("acquireStatus=#{studentInfo.acquireStatus}");
                    }
                    if(studentInfo.getCheckStatus()!=null&&!"".equals(studentInfo.getCheckStatus())&&!"请选择".equals(studentInfo.getCheckStatus())){
                        WHERE("checkStatus=#{studentInfo.checkStatus}");
                    }
                    if(studentInfo.getDormInfo()!=null&&!"".equals(studentInfo.getDormInfo().getId())&&!"0".equals(studentInfo.getDormInfo().getId())){
                        WHERE("dorm_id=#{studentInfo.dormInfo.id}");
                    }
                    if(studentInfo.getDepartmentInfo()!=null&&studentInfo.getDepartmentInfo().getId()>0){
                        WHERE("dep_id=#{studentInfo.departmentInfo.id}");
                    }
                }
            }
        }.toString();
        if(params.get("pager")!=null){
            sql+=" limit #{pager.firstLimitParam},#{pager.perPageRows}";
        }
        return sql;
    }
    public String updateWithParam(StudentInfo studentInfo){
        String sql=new SQL(){
            {
                     UPDATE("student");
                    if(studentInfo.getSname()!=null&&!"".equals(studentInfo.getSname())){
                        SET("sname=#{sname}");
                    }
                    if(studentInfo.getPassword()!=null&&!"".equals(studentInfo.getPassword())){
                        SET("password=#{password}");
                    }
                    if(studentInfo.getSex()!=null&&!"请选择".equals(studentInfo.getSex())&&!"".equals(studentInfo.getSex())){
                        SET("sex=#{sex}");
                    }
                    if(studentInfo.getPhone()!=null&&!"".equals(studentInfo.getPhone())){
                        SET("phone=#{phone}");
                    }
                    if(studentInfo.getEmail()!=null&&!"".equals(studentInfo.getEmail())){
                        SET("email=#{email}");
                    }
                    if(studentInfo.getAddress()!=null&&!"".equals(studentInfo.getAddress())){
                        SET("address=#{address}");
                    }
                    if(studentInfo.getAcquireStatus()!=null&&!"".equals(studentInfo.getAcquireStatus())&&!"请选择".equals(studentInfo.getAcquireStatus())){
                        SET("acquireStatus=#{acquireStatus}");
                    }
                    if(studentInfo.getCheckStatus()!=null&&!"".equals(studentInfo.getCheckStatus())&&!"请选择".equals(studentInfo.getCheckStatus())){
                        SET("checkStatus=#{checkStatus}");
                    }
                    if(studentInfo.getCheckTime()!=null&&!"".equals(studentInfo.getCheckTime())){
                        SET("checkTime=#{checkTime}");
                    }
                    if(studentInfo.getDormInfo()!=null&&!"0".equals(studentInfo.getDormInfo().getId())&&!"".equals(studentInfo.getDormInfo().getId())){
                        SET("dorm_id=#{dormInfo.id}");
                    }
                    if(studentInfo.getIdcard()!=null&&!"".equals(studentInfo.getIdcard())){
                        SET("idcard=#{idcard}");
                    }
                    if(studentInfo.getDepartmentInfo()!=null&&studentInfo.getDepartmentInfo().getId()>0){
                        SET("dep_id=#{departmentInfo.id}");
                    }
                WHERE("sno=#{sno}");
            }
        }.toString();
        return sql;
    }
    //根据条件查询未分配宿舍的学生列表
    public String allocationStudent(StudentInfo studentInfo){
        String sql=new SQL(){
            {
                SELECT("*");
                FROM("student");
                if(studentInfo.getSex()!=null&&!"".equals(studentInfo.getSex())){
                    WHERE("sex=#{sex}");
                }
                if(studentInfo.getDepartmentInfo()!=null&&studentInfo.getDepartmentInfo().getId()>0){
                    WHERE("dep_id=#{departmentInfo.id}");
                }
               WHERE("dorm_id is null");
            }
        }.toString();
        return sql;
    }
}
