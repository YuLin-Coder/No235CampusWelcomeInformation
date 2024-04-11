<%--
  Created by IntelliJ IDEA.
  User: xzc
  Date: 2021/1/13
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>报到并注册</title>
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
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h3>报到注册</h3>
                    </div>
                    <div class="ibox-content">
                        <form method="post" class="form-horizontal" id="updateform">
                           <div class="form-group">
                               <label class="col-sm-3 control-label">学号:</label>
                               <div class="col-sm-8">
                                   <input type="text" class="form-control" value="${STUDENT.sno}" readonly="true"
                                   id="sno" name="sno"/>
                               </div>
                           </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">姓名:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${STUDENT.sname}"
                                    id="sname" name="sname"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">性别</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${STUDENT.sex}" readonly="true"
                                    id="sex" name="sex"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">电话:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${STUDENT.phone}"
                                    id="phone" name="phone"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">邮箱:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${STUDENT.email}"
                                    id="email" name="email"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">住址:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${STUDENT.address}"
                                    id="address" name="address"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">领取物品?</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="acquireStatus" name="acquireStatus">
                                        <option value="未领取" <c:if test="${STUDENT.acquireStatus eq '未领取' }">selected</c:if>>未领取</option>
                                        <option value="已领取" <c:if test="${STUDENT.acquireStatus eq '已领取' }">selected</c:if>>已领取</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">是否报到?</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="${STUDENT.checkStatus}" readonly="true"
                                    id="checkStatus" name="checkStatus"/>
                                </div>
                            </div>
                            <c:if test="${STUDENT.checkStatus  eq '未报到'}">
                                <div class="form-group">
                                    <button type="button" class="btn btn-w-m btn-primary text-center m-t-n-xs" onclick="checkStudent()">
                                        <strong>报 到</strong>
                                    </button>
                                </div>
                            </c:if>
                            <c:if test="${STUDENT.checkStatus!='未报到'}">
                                <div class="form-group">
                                    <button type="button" class="btn btn-w-m btn-primary text-center m-t-n-xs" onclick="updateStudent()">
                                        更 新
                                    </button>
                                </div>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-2"></div>
        </div>
    </div>
<script type="text/javascript">
        //报到并更新
    function checkStudent() {
        var now = new Date();
        var time = now.getFullYear() + "-" +((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate();
        var sno=$('#sno').val();
        var sname=$('#sname').val();
        var sex=$('#sex').val();
        var phone=$('#phone').val();
        var email=$('#email').val();
        var address=$('#address').val();
        var acquireStatus=$('#acquireStatus option:selected').val();
        var checkStatus=$('#checkStatus').val();
        var idcard=$('#idcard').val();
        $.ajax({
           url:'/ysms/student/changeMessage',
            type:'post',
            async:true,
            cache:false,
            data:{
               sno:sno,
                sname:sname,
                sex:sex,
                phone:phone,
                email:email,
                address:address,
                acquireStatus:acquireStatus,
                checkStatus:'已报到',
                checkTime:time,          //将当前时间作为报到时间(年-月-日)
                idcard:idcard
            },
            dataType:'json',
            success:function (data) {
               if (data.success=='true'){
                   swal({
                       title:'系统提示',
                       text:'报到成功',
                       icon:'success',
                       confirmButtonColor:'#DD6B55',
                       confirmButtonText:'确定'
                   },function (isconfirm) {
                       window.location.reload();        //刷新当前页面
                   });

               }else{
                   swal('系统提示','报到失败','error');
               }
            }
        });
    }
    //只进行更新
    function updateStudent() {
        var sno=$('#sno').val();
        var sname=$('#sname').val();
        var sex=$('#sex').val();
        var phone=$('#phone').val();
        var email=$('#email').val();
        var address=$('#address').val();
        var acquireStatus=$('#acquireStatus option:selected').val();
        var checkStatus=$('#checkStatus').val();
        var idcard=$('#idcard').val();
        $.ajax({
            url:'/ysms/student/changeMessage',
            type:'post',
            async:true,
            cache:false,
            data:{
                sno:sno,
                sname:sname,
                sex:sex,
                phone:phone,
                email:email,
                address:address,
                acquireStatus:acquireStatus,
                idcard:idcard
            },
            dataType:'json',
            success:function (data) {
                if (data.success=='true'){
                    swal({
                        title:'系统提示',
                        text:'更新成功',
                        icon:'success',
                        confirmButtonColor:'#DD6B55',
                        confirmButtonText:'确定'
                    },function (isconfirm) {
                        window.location.reload();        //刷新当前页面
                    });
                }else{
                    swal('系统提示','更新失败','error');
                }
            }
        });
    }
</script>
</body>
</html>
