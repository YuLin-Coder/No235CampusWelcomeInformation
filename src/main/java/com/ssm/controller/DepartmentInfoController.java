package com.ssm.controller;

import com.ssm.pojo.DepartmentInfo;
import com.ssm.service.DepartmentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/department")
public class DepartmentInfoController {

    @Autowired
    DepartmentInfoService departmentInfoService;

    //动态加载院系类别列表
    @RequestMapping(value = "/getDepartment",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> getDepartmentType(HttpServletResponse res, HttpServletRequest req)throws Exception{
        //获取类别
        List<DepartmentInfo> departmentInfos=departmentInfoService.getAll();
//        for(DepartmentInfo departmentInfo:departmentInfos){
//            System.out.println(departmentInfo);
//        }
        int count=0;
        if(departmentInfos!=null&&departmentInfos.size()>0){
            count=departmentInfos.size();
        }
        //创建对象result,保存返回结果
        Map<String,Object> result=new HashMap<>(2);
        result.put("count",count);
        result.put("DepartmentType",departmentInfos);

        return result;
    }




}
