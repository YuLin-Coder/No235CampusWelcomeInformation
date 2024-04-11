package com.ssm.controller;

import com.ssm.pojo.DormInfo;
import com.ssm.pojo.Pager;
import com.ssm.service.DormInfoService;
import javafx.beans.binding.ObjectExpression;
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
@RequestMapping("/dorm")
public class DormInfoController {
    @Autowired
    DormInfoService dormInfoService;

    @RequestMapping(value = "/getDormId",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> getDormId(HttpServletResponse res, HttpServletRequest req)
        throws Exception{
        //获取所有宿舍编号
        List<DormInfo> dormInfos=dormInfoService.getAll();
//        for(DormInfo dormInfo:dormInfos){
//            System.out.println(dormInfo);
//        }
        int count=0;
        if(dormInfos!=null&&dormInfos.size()>0){
            count=dormInfos.size();
        }
        //创建对象result,保存返回结果
        Map<String,Object> result=new HashMap<>(2);
        result.put("count",count);
        result.put("DormId",dormInfos);

        return result;
    }
    //宿舍列表分页显示
    @RequestMapping(value = "/getUnAllocation",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> getUnAllocation(Integer page, Integer rows,DormInfo dormInfo){
        //初始化分页类对象
        Pager pager=new Pager();
        pager.setCurPage(page);
        pager.setPerPageRows(rows);
        //创建params对象，封装查询条件
//        Map<String,Object> params=new HashMap<>();
//        params.put("dormInfo",dormInfo);
        //获取满足条件的宿舍总数
        int count=dormInfoService.count(dormInfo);
        //获取满足条件的宿舍列表
        List<DormInfo> dormInfos=dormInfoService.findDormInfo(dormInfo,pager);
        //创建result对象，保存查询结果数据
        Map<String,Object> result=new HashMap<>(2);
        result.put("total",count);
        result.put("rows",dormInfos);
        return result;
    }

    @RequestMapping(value = "/dormDistribution",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public List<DormInfo> dormDistribution() throws Exception{

        //查询所有宿舍的分配情况
        List<DormInfo> dormInfos=dormInfoService.getDormNumber();
        /*for(DormInfo dormInfo:dormInfos){
            System.out.println(dormInfo);
        }*/
        return dormInfos;
    }


}
