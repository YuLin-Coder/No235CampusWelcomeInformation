package com.ssm.controller;

import com.mysql.cj.Session;
import com.ssm.pojo.AdminInfo;
import com.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminInfoController {

    @Autowired
    AdminService adminService;
    @ResponseBody
    @RequestMapping(value = "/login",method = {RequestMethod.GET,RequestMethod.POST})
    public String login(AdminInfo adminInfo, HttpServletRequest req, HttpServletResponse res,
                        ModelAndView mv, HttpSession session)throws Exception{
//        System.out.println("11111");
//        System.out.println(adminInfo);
        AdminInfo ai=adminService.login(adminInfo);
//        System.out.println("controller:"+ai);
        if(ai!=null){   //登录成功
            req.getSession().setAttribute("ADMIN",ai);
//            res.sendRedirect(req.getContextPath()+"/admin/index.jsp");
            return "{\"success\":\"true\"}";
        }else{          //登录失败
//            session.setAttribute("ADMIN",null);
//            res.sendRedirect(req.getContextPath()+"/login.jsp?rtnCode=500");
            return "{\"success\":\"false\"}";
        }
    }

    //修改管理员个人信息
    @RequestMapping(value = "/changeMessage",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public String changeMessage(AdminInfo adminInfo){
//        System.out.println(adminInfo);
        Integer count=adminService.changeMessage(adminInfo);
        if(count>0){
            return "{\"message\":\"true\"}";
        }else{
            return "{\"message\":\"false\"}";
        }
    }

    //退出登录
    @RequestMapping(value = "/loginOut",method = {RequestMethod.GET,RequestMethod.POST})
    public String loginOut(HttpServletRequest req){
        req.getSession().invalidate();//清除session对象中的所有信息
        return "redirect:/login.jsp";
    }
}
