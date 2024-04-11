package com.ssm.controller;

import com.ssm.pojo.DepartmentInfo;
import com.ssm.pojo.DormInfo;
import com.ssm.pojo.Pager;
import com.ssm.pojo.StudentInfo;
import com.ssm.service.DepartmentInfoService;
import com.ssm.service.DormInfoService;
import com.ssm.service.StudentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentInfoController {
    @Autowired
    StudentInfoService studentInfoService;
    @Autowired
    DormInfoService dormInfoService;
    @Autowired
    DepartmentInfoService departmentInfoService;

    @RequestMapping(value = "/login",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String login(StudentInfo stu, HttpServletRequest req){
//        System.out.println(stu);
        StudentInfo studentInfo=studentInfoService.login(stu);
//        System.out.println(studentInfo);
        if(studentInfo!=null){
            req.getSession().setAttribute("STUDENT",studentInfo);
            return "{\"success\":\"true\"}";
        }else{
            return "{\"success\":\"false\"}";
        }
    }

    //分页显示学生列表
    @RequestMapping(value = "/list",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> list(Integer page, Integer rows, StudentInfo studentInfo) throws Exception{
//        System.out.println(studentInfo);
        //初始化分页类对象
        Pager pager=new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        //创建params对象，封装查询条件
        Map<String,Object> params=new HashMap<>();
        params.put("studentInfo",studentInfo);
        //获取满足条件的学生总数
        int totalCount=studentInfoService.count(params);

        //获取满足条件的商品列表
        List<StudentInfo> studentInfos=studentInfoService.findStudentInfo(studentInfo,pager);
//        for(StudentInfo studentInfo1:studentInfos){
//            System.out.println(studentInfo1);
//        }
        //创建result对象,保存查询结果数据
        Map<String,Object> result=new HashMap<>(2);
        result.put("total",totalCount);
        result.put("rows",studentInfos);
        return result;
    }

    //添加学生
    @RequestMapping(value = "/addStudent",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String addStudent(StudentInfo studentInfo){
        try{
            int count=studentInfoService.addStudent(studentInfo);
            if(count>0){
                return "{\"success\":\"true\"}";
            }else{
                return "{\"success\":\"false\"}";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    //删除学生
    @RequestMapping(value = "/deleteStudent",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String deleteStudent(String sno){
        try{
            int count=studentInfoService.deleteStudent(sno);
            if(count>0){
                return "{\"success\":\"true\"}";
            }else{
                return "{\"success\":\"false\"}";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    //更新学生
    @RequestMapping(value = "/updateStudent",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String updateStudent(StudentInfo studentInfo){
        try{
            int count=studentInfoService.updateStudent(studentInfo);
            if(count>0){
                return "{\"success\":\"true\"}";
            }else{
                return "{\"success\":\"false\"}";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    //动态加载可分配学生列表
    @RequestMapping(value = "/studentAllocation",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> studentAllocation(StudentInfo studentInfo)throws Exception{
        //根据条件查询可分配宿舍的学生列表
        List<StudentInfo> studentInfos=studentInfoService.allocationStudent(studentInfo);
       /* for(StudentInfo studentInfo1:studentInfos){
            System.out.println(studentInfo1);
        }*/
        int count=0;
        if(studentInfos!=null&&studentInfos.size()>0){
            count=studentInfos.size();
        }
        Map<String,Object> result=new HashMap<>(2);
        result.put("count",count);
        result.put("studentInfos",studentInfos);
        return result;
    }
    //为学生分配宿舍
    @RequestMapping(value = "/updateDorm",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String updateDorm(StudentInfo studentInfo)throws Exception{
//        System.out.println(studentInfo);
        //修改student表dorm_id字段
        int count=studentInfoService.updateStudentDorm(studentInfo);
        //修改dorm表alreadyNumber字段,status字段由触发器去修改
        int count1=dormInfoService.updateDormById(studentInfo.getDormInfo().getId());
        if(count>0&&count1>0){
            return "{\"success\":\"true\"}";
        }else{
            return "{\"success\":\"false\"}";
        }
    }

    //查看各个院系的学神分配情况
    @RequestMapping(value = "/studentDistribution",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> studentDistribution(){
        List<DepartmentInfo> departmentInfos=departmentInfoService.getAll();
      /*  for(DepartmentInfo departmentInfo:departmentInfos){
            System.out.println(departmentInfo);
        }*/
        List<String> dep_names =new ArrayList<>();
        for(int i = 0;i<departmentInfos.size();i++){
            dep_names.add(departmentInfos.get(i).getDep_name());
        }
        //获取已分配和未分配宿舍的学生人数
        List<Integer> alreadyDistribute=studentInfoService.getAlreadyDistribute();
        List<Integer> noDistribute=studentInfoService.getNoDistribute();
        Map<String,Object> result=new HashMap<>();
        result.put("dep_names",dep_names);
        result.put("alreadyDistribute",alreadyDistribute);
        result.put("noDistribute",noDistribute);
        return result;
    }

    //退出登录
    @RequestMapping(value = "/loginOut",method = {RequestMethod.GET,RequestMethod.POST})
    public String loginOut(HttpServletRequest req){
        req.getSession().invalidate();//清除session对象中的所有信息
        return "redirect:/login.jsp";
    }

    //报到
    @RequestMapping(value = "/changeMessage",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String changeMessage(StudentInfo studentInfo,HttpServletRequest req) throws Exception{
        int count=studentInfoService.changeMessage(studentInfo);
        if(count>0){
            StudentInfo studentInfo1=studentInfoService.getStudent(studentInfo);
            req.getSession().setAttribute("STUDENT",studentInfo1);
            return "{\"success\":\"true\"}";
        }else{
            return "{\"success\":\"false\"}";
        }

    }
    //学生修改密码
    @RequestMapping(value = "/changePassword",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String changePassword(StudentInfo studentInfo,HttpServletRequest req){
        int count=studentInfoService.changePassword(studentInfo);
        StudentInfo studentInfo1= (StudentInfo) req.getSession().getAttribute("STUDENT");
        studentInfo1.setSname(studentInfo.getSname());
        studentInfo1.setPassword(studentInfo.getPassword());
        req.getSession().setAttribute("STUDENT",studentInfo1);
        if(count>0){
            return "{\"message\":\"true\"}";
        }else{
            return "{\"message\":\"false\"}";
        }
    }
}
