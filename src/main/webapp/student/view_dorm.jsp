<%@ page import="com.ssm.pojo.DormInfo" %>
<%@ page import="com.ssm.pojo.StudentInfo" %><%--
  Created by IntelliJ IDEA.
  User: xzc
  Date: 2021/1/13
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>查看个人宿舍分配</title>
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
<%
    StudentInfo studentInfo=(StudentInfo) session.getAttribute("STUDENT");
    if(studentInfo.getDormInfo()!=null){
        DormInfo dormInfo=studentInfo.getDormInfo();
        request.getSession().setAttribute("dormInfo",dormInfo);
    }else{
        request.getSession().setAttribute("dormInfo",null);
    }
%>
<c:choose>
    <c:when test="${not empty STUDENT.dormInfo}">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h4>宿舍分配情况</h4>
                </div>
                <div class="ibox-content">
                    <!--个人信息-->
                    <div class="table-responsive">
                        <table id="table" class="table" data-click-to-select="true">
                        </table>
                    </div>
                </div>
            </div>
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h4>宿舍成员</h4>
                </div>
                <div class="ibox-content">
                    <!--宿舍成员信息-->
                    <div class="table-responsive">
                        <table id="table_number" class="table" data-click-to-select="true">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <h2 class="text-center">您还未分配宿舍!</h2>
    </c:otherwise>
</c:choose>

<script type="text/javascript">
    $(function () {
        var $table=$('#table');
        $table.bootstrapTable({
            url:'/ysms/dorm/getUnAllocation',
            dataType:'json',
            method:'post',
            // async:false,        //add by xtt
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",//发送到服务器的数据编码类型
            cache:false,        //禁用AJAX数据缓存
            sidePagination: 'server',   //服务端处理分页
            pagination:true,    //是否显示分页
            pageSize:8,         //设置每页的记录行数
            pageList: [8,16,32,64,128,256],  //可供选择的每页的行数
            pageNumber:1,       //设置首页页码
            singleSelect:false, //设置是否单选
            checkboxHeader: true,
            showRefresh:true,   //是否显示刷新按钮
            showToggle:true,    //是否显示详细视图和列表视图的切换按钮
            showColumns:true,   //选择要显示的列
            striped: true,      //是否显示行间隔色
            clickToSelect:true, //是否启用点击选中行
            queryParamsType:"undefined",    //设置参数格式
            queryParams:function queryParams(params) {  //设置查询参数page和rows
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var param={
                    page:params.pageNumber, //首页页码
                    rows:params.pageSize,  //每页的记录行数
                    id:"${dormInfo.id}"
                    // id:$('#id option:selected').val(),
                    // status:$('#status option:selected').val(),
                    // sex:$('#sex option:selected').val()
                };
                return param;
            },
            columns:[{
                checkbox:true
            },{
                title:'宿舍编号',
                field:'id',
                valign:'middle'
            },{
                title:'男/女宿舍',
                field:'sex',
                valign:'middle'
            },{
                title:'已住人数',
                field:'alreadyNumber',
                valign:'middle'
            },{
                title:'可住人数',
                field:'allNumber',
                valign:'middle'
            },{
                title:'是否住满',
                field:'status',
                valign:'middle'
            }/*, {
                title:'操作',
                field:'studentInfos',
                formatter:function (value,row,index) {
                   var test=JSON.stringify(value);
                   var test1=value;
                   var  studentInfos=JSON.stringify(value); //将json对象转为json字符串
                   var id=JSON.stringify(row.id);
                   var  sex=JSON.stringify(row.sex);
                   var  alreadyNumber=JSON.stringify(row.alreadyNumber);
                   var  allNumber=JSON.stringify(row.allNumber);
                   var  status=JSON.stringify(row.status);
                     var e="<a href=\"javascript:void(0)\" class=\"btn btn-gmtx-define1\" onclick='edit("+studentInfos+","+id+","+sex+","+alreadyNumber+","+allNumber+","+status+")'>"+"操作</a>";
                    return e;
                }
            }*/]
        });
        $('#table_number').bootstrapTable({
            url:'/ysms/student/list',
            toolbar:'#toolbar',
            dataType:'json',    //服务器返回的数据类型
            method:'post',      //请求方式
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",//发送到服务器的数据编码类型
            pagination:true,    //是否显示分页
            pageSize:4,         //设置每页的记录行数
            pageList: [4,8,32,64,256],  //可供选择的每页的行数
            pageNumber:1,       //设置首页页码
            singleSelect:false, //设置是否单选
            checkboxHeader: true,
            showRefresh:true,   //是否显示刷新按钮
            showToggle:true,    //是否显示详细视图和列表视图的切换按钮
            showColumns:true,   //选择要显示的列
            striped: true,      //是否显示行间隔色
            clickToSelect:true, //是否启用点击选中行
            cache:false,            //禁用AJAX数据缓存
            sidePagination:'server',   //服务端处理分页
            queryParamsType:"undefined",    //设置参数格式
            queryParams:function queryParams(params) {//设置查询参数
                var param={
                    page:params.pageNumber,     //首页页码
                    rows:params.pageSize,       //每页的记录数
                    // sno:$('#sno').val(),
                    // sname:$('#sname').val(),
                    // sex:$('#sex option:selected').val(),
                    // acquireStatus:$('#acquireStatus option:selected').val(),
                    // checkStatus:$('#checkStatus option:selected').val(),
                    "dormInfo.id":"${dormInfo.id}"
                    // "departmentInfo.id":parseInt($('#dep_id option:selected').val())
                };
                return param;
            },
            columns:[{
                checkbox:true
            },{
                title:'学号',
                field:'sno',
                valign:'middle'
            },{
                title:'姓名',
                field:'sname',
                valign:'middle'
            },{
                title:'性别',
                field:'sex',
                valign:'middle'
            },{
                title:'已领物品',
                field:'acquireStatus',
                valign:'middle'
            },{
                title:'是否报到',
                field:'checkStatus',
                valign:'middle'
            },{
                title:'宿舍编号',
                field:'dormInfo',
                formatter:function (value,row,index) {
                    if (row.dormInfo){
                        return row.dormInfo.id;
                    }else{
                        return value;
                    }
                }
            },{
                title:'院系',
                field:'departmentInfo',
                formatter:function (value,row,index) {
                    if (row.departmentInfo){
                        return row.departmentInfo.dep_name;
                    }else{
                        return value;
                    }
                }
            }]
        });
    });
</script>
</body>
</html>
