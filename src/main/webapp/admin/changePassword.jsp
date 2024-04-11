<%@ page import="com.ssm.pojo.AdminInfo" %><%--
  Created by IntelliJ IDEA.
  User: Peroy
  Date: 2021/1/17
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
//    System.out.println(session.getAttribute("ADMIN"));
//    AdminInfo adminInfo=(AdminInfo)session.getAttribute("ADMIN");
//    request.setAttribute("admin",adminInfo);
%>
<!DOCTYPE html>
<html>
<head>
    <title>修改密码</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="../commons/jslib/hplus/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="../commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
          rel="stylesheet">
    <link href="../commons/jslib/hplus/css/animate.min.css"
          rel="stylesheet">
    <link href="../commons/jslib/hplus/css/style.min.css?v=4.0.0"
          rel="stylesheet">
    <link href="../commons/jslib/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css"
          rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="../commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
          rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="../commons/css/qy-style.css" rel="stylesheet">

    <link href="../commons/jslib/hplus/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <script src="../commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
    <script
            src="../commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
    <script
            src="../commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>

    <script type="text/javascript" src="../commons/jslib/jquery-form.js"></script>

    <script src="../commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>

    <!-- Sweet Alert -->
    <script type="text/javascript"
            src="../commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
    <!-- Sweet Alert -->
    <script src="../commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"></script>
    <script src="../commons/jslib/CommonValue.js"></script>


    <%--    <script--%>
    <%--            src="/ssm_test/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"--%>
    <%--            type="text/javascript"></script>--%>
    <%--    <script--%>
    <%--            src="/ssm_test/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"--%>
    <%--            type="text/javascript"></script>--%>
    <script src="../commons/jslib/hplus/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
    <!--数据导出相关-->
    <script src="../commons/tableExport.jquery.plugin/tableExport.js"></script>
    <script src="../commons/tableExport.jquery.plugin/libs/FileSaver/FileSaver.min.js"></script>
    <script src="../commons/tableExport.jquery.plugin/libs/jsPDF/jspdf.min.js"></script>
    <script src="../commons/tableExport.jquery.plugin/libs/jsPDF-AutoTable/jspdf.plugin.autotable.js"></script>
    <script src="../commons/tableExport.jquery.plugin/libs/js-xlsx/xlsx.core.min.js"></script>
    <script src="../commons/jslib/hplus/js/plugins/bootstrap-table/dist/bootstrap-table.min.js"></script>
    <script src="../commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"
            type="text/javascript"></script>
    <script src="../commons/jslib/hplus/js/plugins/bootstrap-table/dist/extensions/export/bootstrap-table-export.min.js"></script>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h2>个人信息修改</h2>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12 b-r">
                                <form  method="post" class="form-horizontal" id="changeform">
                                    <div class="form-group">
                                        <label>用户名:</label>
                                        <input type="text" placeholder="请输入您的姓名" name="adminName" id="adminName" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>密码:</label>
                                        <input type="password" placeholder="请输入密码" name="password" id="password" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>确认密码:</label>
                                        <input type="password" placeholder="请确认密码" name="password1" id="password1" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-w-m btn-primary text-center m-t-n-xs" type="submit">
                                            <strong>更 新</strong>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="col-sm-2"></div>
        </div>
    </div>
    <script type="text/javascript">

        $(function () {
            vform('changeform',updateAdmin);

        });
        function updateAdmin() {
            var adminName=$('#adminName').val();
            var password=$('#password').val();
            var id="${ADMIN.id}";   //取出session中存的管理员信息
           $.ajax({
               url:'/ysms/admin/changeMessage',
               type:'post',
               async:false,
               cache:false,
               data:{
                   id:id,
                   password:password,
                   adminName:adminName
               },
               dataType:'json',
               success:function (data) {
                   if (data.message=='true'){
                        swal("系统提示",'修改成功',"success");
                        $('#adminName').val('');
                        $('#password').val('');
                        $('#password1').val('');
                    }else{
                       swal("系统提示",'修改失败',"error");
                   }
               }
           });
        }
        //验证表单
        function vform(dom,func) {
            $('#'+dom).validate({
               rules:{
                   adminName:{
                       required:true,
                       maxlength:10
                   },
                   password:{
                       required:true,
                       maxlength:20
                   },
                   password1:{
                       required:true,
                       maxlength:20,
                       equalTo:'#password'
                   }
               },
                messages:{
                   adminName:{
                       required:'请输入姓名',
                       maxlength:'参数名过长'
                   },
                    password:{
                        required:'请输入密码',
                        maxlength:'参数名过长'
                    },
                    password1:{
                       required:'请输入确认密码',
                        maxlength:'参数名过长',
                        equalTo:'两次输入的密码不一致'
                    }
                },
                submitHandler:function () {
                    func();
                }
            });
        }
    </script>
</body>
</html>
