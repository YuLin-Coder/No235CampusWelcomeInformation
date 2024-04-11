<%--
  Created by IntelliJ IDEA.
  User: Peroy
  Date: 2021/1/14
  Time: 0:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>宿舍分配</title>
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
<body class="gray-bg black-bg-gmtx">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <div class="row">
                    <label class="col-sm-1 control-label text-right">分配情况</label>
                    <div class="col-sm-2">
                        <select class="form-control" name="status" id="status">
                            <option value="" selected>请选择</option>
                            <option value="是">已住满</option>
                            <option value="否">未住满</option>
                        </select>
                    </div>
                    <label class="col-sm-1 control-label text-right">男/女</label>
                    <div class="col-sm-2">
                        <select class="form-control" name="sex" id="sex">
                            <option value="" selected>请选择</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <label class="col-sm-1 control-label text-right">宿舍编号</label>
                    <div class="col-sm-2">
                        <select class="form-control" name="id" id="id"><%--动态加载所有宿舍编号--%>
                        </select>
                    </div>
                </div>
                <div class="row" id="toolbar">
                        <button class="btn btn-w-m btn-primary glyphicon glyphicon-search" type="button"
                                onclick="javascript:search();">搜索</button>
                        <button class="btn btn-w-m btn-primary glyphicon glyphicon-erase" onclick="javascript:btn_clear()">清空</button>
                </div>
            </div>
            <%--未住满的宿舍列表--%>
            <div class="ibox-content table-responsive">
                <table id="table" class="table"data-click-to-select="true">
                </table>
            </div>
        </div>
    </div>
    <%--宿舍分配模态对话框--%>
    <div class="modal fade" id="dormUpdate">
        <div class="modal-dialog" style="width: 800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h2 class="modal-title" id="updateLabel">宿舍分配</h2>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6 b-r">
                            <h2 class="m-t-none m-b text-center">宿舍成员</h2>
                            <div class="ibox-content table-responsive">
                                <table id="tableDorm" class="table" data-click-to-select="true"><!--将选中宿舍的已住成员显示在列表上面-->
                                    <thead>
                                        <tr>
                                            <th data-field="sno">学号</th>
                                            <th data-field="sname">姓名</th>
                                            <th data-field="sex">性别</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                            <div class="col-sm-6">
                                <form method="post" class="form-horizontal" id="updateDorm">
                                <h2 class="m-t-none m-b text-center">宿舍分配</h2>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label text-right">院系:</label>
                                    <div class="col-sm-8 controls">
                                        <select class="form-control" id="dep_idAllocation" name="dormInfo.id">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label text-right">男/女生宿舍:</label>
                                    <div class="col-sm-8 controls">
                                        <input type="text" class="form-control input-sm" value="" id="sexAllocation"
                                        readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label text-right">可分配学生:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="snoAllocation" name="snoAllocation"><!--动态加载可分配的学生列表-->
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">目标宿舍:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control input-sm" value="" id="dorm_idAllocation"
                                               readonly="true"/>
                                    </div>
                                </div>
                                 <div class="form-group">
                                     <label class="col-sm-4 control-label">可住人数:</label>
                                     <div class="col-sm-8">
                                         <input type="text" class="form-control input-sm" value="" id="allNumberAllocation"
                                                readonly="true"/>
                                     </div>
                                 </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">是否已满:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control input-sm" value="否" id="statusAllocation1"
                                               name="statusAllocation1" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" class="form-control input-sm" value="" id="statusAllocation"
                                          name="statusAllocation" readonly="true"/>
                                </div>
                                <div class="form-group">
                                    <div class="controls">
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-8">
                                            <input type="submit" class="btn btn-w-m btn-primary center-block" value="加入到该宿舍"/>
                                        </div>
                                    </div>
                                </div>
                               </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //加载所有宿舍编号
            loadDormId("/ysms/dorm/getDormId","id");
            //加载院系下拉框(宿舍分配对话框)
            loadDepartmentType("/ysms/department/getDepartment","dep_idAllocation");
            //动态监听学院下拉框的change事件
            $('#dep_idAllocation').change(function () {
                $('#snoAllocation').empty();
                loadStudentType('/ysms/student/studentAllocation','snoAllocation');
            });
            vform('updateDorm',updateDormInfo);

            var $table=$('#table');
            $table.bootstrapTable({
               url:'/ysms/dorm/getUnAllocation',
                toolbar:'#toolbar',
               dataType:'json',
               method:'post',
                contentType: "application/x-www-form-urlencoded;charset=UTF-8",//发送到服务器的数据编码类型
                cache:false,        //禁用AJAX数据缓存
                sidePagination: 'server',   //服务端处理分页
                pagination:true,    //是否显示分页
                pageSize:8,         //设置每页的记录行数
                pageList: [8,16,32,64,128,256,'All'],  //可供选择的每页的行数
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
                        id:$('#id option:selected').val(),
                        status:$('#status option:selected').val(),
                        sex:$('#sex option:selected').val()
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
                },{
                   title:'操作',
                    field:'studentInfos',
                    formatter:function (value,row,index) {
                        var studentInfos=JSON.stringify(value); //将json对象转为json字符串
                        var id=JSON.stringify(row.id);
                        var sex=JSON.stringify(row.sex);
                        var alreadyNumber=JSON.stringify(row.alreadyNumber);
                        var allNumber=JSON.stringify(row.allNumber);
                        var status=JSON.stringify(row.status);
                       var e="<a href=\"javascript:void(0)\" class=\"btn btn-gmtx-define1\" onclick='edit("+studentInfos+","+id+","+sex+","+alreadyNumber+","+allNumber+","+status+")'>"+"操作</a>";
                        return e;
                    }
                }]
            });

        });
        function search() {
          $('#table').bootstrapTable('refresh');
        }
        //分配宿舍
        function updateDormInfo() {
            var sno=$('#snoAllocation option:selected').val();
            var dorm_id=$('#dorm_idAllocation').val();
            $.ajax({
               url:'/ysms/student/updateDorm',
                dataType:'json',
                async:false,
                data:{
                   sno:sno,
                    "dormInfo.id":dorm_id
                },
                type:'post',
                success:function (data) {
                    if(data.success=='true'){
                        $('#dep_idAllocation').val('');
                        $('#sexAllocation').val('');
                        $('#snoAllocation').empty();
                        $('#statusAllocation').val('');
                        $('#allNumberAllocation').val('');
                        $('#dormUpdate').modal('hide');
                        //刷新宿舍分配表格
                        $('#table').bootstrapTable('refresh');
                        $('#tableDorm').bootstrapTable('refresh');
                        swal("系统提示","分配成功","success");
                    }else if (data.success =='false' ){
                        swal("系统提示","分配失败","warning");
                    }
                },
                error:function () {
                    swal("系统提示","请求服务器失败","warning");
                }
            });
        }
        function loadDormId(url,idStr) {
            $.ajax({
                url:url,
                dataType:'json',
                async:false,
                data:{},
                type:'post',
                success:function (data) {
                    var options="<option value=''>请选择</option>";
                    $.each(data.DormId,function (key,val) {
                        options+='<option value='+val.id+'>'+val.id+'</option>';
                    });
                    $('#'+idStr).empty();
                    $('#'+idStr).append(options);
                },
                error:function () {
                    swal('系统提示','加载失败','warning');
                }
            });
        }
        function btn_clear() {
            $('#id').val('');
            $('#status').val('');
            $('#sex').val('');
        }
        function edit(studentInfos,id,sex,alreadyNumber,allNumber,status) {
           var jsonStudent=eval(studentInfos);  //将JSON字符串转为JSON对象
            if (jsonStudent.length==0){     //空宿舍
                $('#sexAllocation').val(sex);
                $('#dorm_idAllocation').val(id);
                $('#statusAllocation').val(status);
                $('#allNumberAllocation').val(allNumber);
                //加载可分配学生下拉框
                // loadStudentType('/ysms/student/studentAllocation','snoAllocation');
            }else{
                $('#sexAllocation').val(sex);
                $('#dorm_idAllocation').val(id);
                $('#statusAllocation').val(status);
                $('#allNumberAllocation').val(allNumber);
                //加载可分配学生下拉框
                // loadStudentType('/ysms/student/studentAllocation','snoAllocation');
            }
            $('#tableDorm').bootstrapTable('destroy');
            $('#tableDorm').bootstrapTable({
                data:jsonStudent    //将JSON对象中的学生集合加入table中
            })
            $('#dormUpdate').modal('show');
        }
        //加载院系下拉框
        function loadDepartmentType(url,idStr) {
            $.ajax({
                url:url,
                dataType:'json',
                async:false,
                data:{},
                type:'post',
                success:function (data) {
                    var options="<option value=''>请选择</option>";
                    $.each(data.DepartmentType,function (key,val) {
                        options+='<option value='+val.id+'>'+val.dep_name+'</option>';
                    });
                    $('#'+idStr).empty();
                    $('#'+idStr).append(options);
                },
                error:function () {
                    swal('系统提示','加载失败','warning');
                }
            });
        }
        //动态加载可分配学生下拉框
        function loadStudentType(url,idStr) {
            $.ajax({
               url:url,
                type:'post',
                dataType:'json',
                async:false,
                data:{
                   sex:$('#sexAllocation').val(),
                    // "dormInfo.id":parseInt($('#dep_idAllocation option:selected').val())
                    "departmentInfo.id":function () {
                        if (isNaN(parseInt($('#dep_idAllocation option:selected').val()))){
                            return 0
                        }else{
                            return parseInt($('#dep_idAllocation option:selected').val());
                        }
                    }
                },
                success:function (data) {
                    var options="<option value=''>请选择</option>";
                     $.each(data.studentInfos,function (key,val) {
                           options+='<option value='+val.sno+'>'+val.sno+val.sname+'</option>';
                     });
                     $('#'+idStr).empty();
                     $('#'+idStr).append(options);
                },
                error:function () {
                    swal('系统提示','加载失败','warning');
                }
            });
        }
        function vform(dom,func) {
            $('#'+dom).validate({
               rules: {
                   snoAllocation: {
                       required: true
                   },
                   statusAllocation:{
                       equalTo:'#statusAllocation1'
                   },
                   "dormInfo.id":{
                       required:true
                   }
               },
               messages:{
                    snoAllocation:{
                       required:'请选择要分配的学生'
                   },
                   statusAllocation:{
                        equalTo:'该宿舍已住满'
                   },
                   "dormInfo.id":{
                        required:'请选择院系'
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
