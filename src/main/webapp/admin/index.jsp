<%--
  Created by IntelliJ IDEA.
  User: Peroy
  Date: 2021/1/12
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
    //防止直接进入后台
    if(session.getAttribute("ADMIN")==null){
        response.sendRedirect("/ssm_test/login.jsp");
    }
//    System.out.println(session.getAttribute("ADMIN"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>管理员主界面</title>

    <meta name="keywords" content="管理员">
    <meta name="description" content="管理员">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="../commons/jslib/hplus/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="../commons/jslib/hplus/css/font-awesome.min.css"
          rel="stylesheet">
    <link href="../commons/jslib/hplus/css/animate.min.css"
          rel="stylesheet">
    <link href="../commons/jslib/hplus/css/style.min.css"
          rel="stylesheet">
    <link rel="stylesheet"
          href="../commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
          type="text/css">
    <link href="../commons/css/qy-style.css" rel="stylesheet">
    <%--  <style>
          .page-tabs-jj a.active {
             /* background: #EE4000;*/
              color: #fff
          }

          .page-tabs-jj a.active i:hover,.page-tabs a.active:hover {
              /*background: #FF8C00;*/
              color: #fff
          }

          #accordion .panel {
              border: none;
              box-shadow: none;
              border-radius: 0;
              margin-bottom: -5px;
          }

          #accordion .panel-heading {
              padding: 0;
              border-radius: 0;
              border: none;
              text-align: center;
          }

          #accordion .panel-title a {
              display: block;
              padding: 25px 30px;
              font-size: 16px;
              font-weight: bold;
              color: #fff;
              background: #212b34;
              border-bottom: 1px solid #2F4050;
              position: relative;
              transition: all 0.5s ease 0s;
          }

          #accordion .panel-title a:hover {
              background: #19222a;
          }

          #accordion .panel-title a:after,#accordion .panel-title a.collapsed:after
          {
              content: "\f067";
              font-family: FontAwesome;
              font-size: 15px;
              font-weight: 200;
              position: absolute;
              top: 25px;
              left: 15px;
              transform: rotate(135deg);
              transition: all 0.5s ease 0s;
          }

          #accordion .panel-title a.collapsed:after {
              transform: rotate(0deg);
          }

          #accordion .panel-body {
              background: #293846;
              padding: 0 0 0 0px;
              border: none;
              position: relative;
          }

          #accordion .panel-body p {
              font-size: 14px;
              color: #fff;
              line-height: 25px;
              background: #3296b7;
              padding: 30px;
              margin: 0;
          }

          #accordion .panel-collapse .panel-body p {
              opacity: 0;
              transform: scale(0.9);
              transition: all 0.5s ease-in-out 0s;
          }

          #accordion .panel-collapse.in .panel-body p {
              opacity: 1;
              transform: scale(1);
          }
      </style>--%>
</head>
<body class="fixed-sidebar full-height-layout white-bg black-bg-gmtx" style="overflow:hidden">
<!--左侧导航开始-->
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="nav-close">
        <i class="fa fa-times-circle"></i>
    </div>
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header" style="height: 158px;">
                <div class="dropdown profile-element">
                    <span><img alt="image" class="img-circle" src="../commons/images/head-index.jpg" height="50%"
                               width="50%"/></span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${ADMIN.adminName}</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li>
                            <a data-toggle="modal" data-keyboard="true"
                               data-backdrop="true" id="btn_ResetPsw"><b>修改密码</b>
                            </a>
                        </li>
                        <li>
                            <a href="/ysms/admin/loginOut"><b>安全退出</b>
                            </a>
                        </li>
                    </ul>
                </div>
                <br/><br/>
                <div class="logo-element">
                    H+
                </div>
            </li>

            <li>
                <a href="#">
                    <i class="fa fa-check"></i>
                    <span class="nav-label">学生管理</span><span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li>
                        <a class="J_menuItem" href="addStudent.jsp">新生信息录入</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"> <i class="fa fa-check"></i> <span
                        class="nav-label">宿舍管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li>
                        <a class="J_menuItem"
                           href="dormAllocation.jsp">宿舍分配</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"> <i class="fa fa-check"></i> <span
                        class="nav-label">用户管理</span><span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li>
                        <a class="J_menuItem"
                           href="changePassword.jsp">修改密码</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-check"></i>
                    <span class="nav-label">信息统计</span><span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li>
                        <a class="J_menuItem" href="dormStatistic.jsp">宿舍信息统计</a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="studentStatistic.jsp">学院信息统计</a>
                    </li>
                </ul>
            </li>
        </ul>

    </div>
</nav>
<!--左侧导航结束-->
<!--右侧部分开始-->
<!--右侧部分开始-->
<div id="page-wrapper" class="gray-bg dashbard-1">
    <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation"
             style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-minimalize minimalize-styl-2 btn btn-primary"
                   href="#"><i class="fa fa-bars"></i> </a>
            </div>
        </nav>
    </div>
    <div class="row content-tabs">
        <button class="roll-nav roll-left J_tabLeft">
            <i class="fa fa-backward"></i>
        </button>
        <nav class="page-tabs page-tabs-jj J_menuTabs">
            <div class="page-tabs-content">
                <a href="javascript:;" class="active J_menuTab"
                   data-id="index_homePage.jsp">首页</a>
            </div>
        </nav>
        <button class="roll-nav roll-right J_tabRight">
            <i class="fa fa-forward"></i>
        </button>
        <div class="btn-group roll-nav roll-right">
            <button class="dropdown J_tabClose" data-toggle="dropdown">
                <b>关闭操作</b>
            </button>
            <ul role="menu" class="dropdown-menu dropdown-menu-right">
                <li class="J_tabShowActive">
                    <a>定位当前选项卡</a>
                </li>
                <li class="divider">
                    <br>
                </li>
                <li class="J_tabCloseAll">
                    <a>关闭全部选项卡</a>
                </li>
                <li class="J_tabCloseOther">
                    <a>关闭其他选项卡</a>
                </li>
            </ul>
        </div>
        <a href="/ysms/admin/loginOut"
           class="roll-nav roll-right J_tabExit">
            <i class="fa fa fa-sign-out"></i> <b>退出</b> </a>
    </div>
    <div class="row J_mainContent" id="content-main">
        <iframe class="J_iframe" name="iframe0" width="100%" height="100%"
                src="index_homePage.jsp" frameborder="0"
                data-id="index_homePage.jsp" seamless></iframe>
    </div>
    <div class="footer">
        <div class="pull-right">
            <font color="black">&copy; xtt xzc kjy</font>
        </div>
    </div>
</div>
<!--右侧部分结束-->
<!-- 修改密码窗口 -->
<div class="modal fade" id="resetPswWin">
    <div class="modal-dialog" style="width: 400px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true" id="clearUpPsw">
                    &times;
                </button>
                <h4 class="modal-title">
                    修改密码
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form method="post" class="form-horizontal" id="resetform">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">
                                用户名：
                            </label>
                            <div class="col-sm-7 controls">
                                <input type="text" value="" class="form-control"
                                       name="username_reset" id="username_reset" disabled
                                       tabindex="0" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">
                                原密码：
                            </label>
                            <div class="col-sm-7 controls">
                                <input type="password" value="" class="form-control"
                                       name="psw_old" id="psw_old" tabindex="1" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">
                                新密码：
                            </label>
                            <div class="col-sm-7 controls">
                                <input type="password" value="" class="form-control"
                                       name="psw_new" id="psw_new" tabindex="2" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">
                                确认密码：
                            </label>
                            <div class="col-sm-7 controls">
                                <input type="password" value="" class="form-control"
                                       name="psw_sure" id="psw_sure" tabindex="3" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="controls">
                                <button type="submit"
                                        class="btn btn-gmtx-define1 center-block">
                                    修改
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 修改密码窗口结束 -->


<script src="../commons/jslib/hplus/js/jquery.min.js"></script>
<script
        src="../commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script
        src="../commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
<script src="../commons/jslib/hplus/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="../commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
<script
        src="../commons/jslib/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script
        src="../commons/jslib/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script
        src="../commons/jslib/hplus/js/plugins/layer/layer.min.js"></script>
<script src="../commons/jslib/hplus/js/hplus.min.js"></script>
<script type="text/javascript"
        src="../commons/jslib/hplus/js/contabs.min.js"></script>
<script
        src="../commons/jslib/hplus/js/plugins/pace/pace.min.js"></script>
<script src="../commons/jslib/CommonValue.js"></script>
</body>
</html>
