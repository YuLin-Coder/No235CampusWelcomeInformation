<%--
  Created by IntelliJ IDEA.
  User: Peroy
  Date: 2021/1/11
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园迎新信息管理系统</title>
    <meta name="keywords" content="登录">
    <meta name="description" content="登录">
    <link href="commons/jslib/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="commons/jslib/hplus/css/animate.min.css" rel="stylesheet">
    <link href="commons/jslib/hplus/css/style.min.css" rel="stylesheet">
    <link href="commons/jslib/hplus/css/login.min.css" rel="stylesheet">

    <link href="commons/css/qy-style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="commons/jslib/hplus/js/jquery.min.js"></script>
    <script src="commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
    <script src="commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>

    <script src="commons/jslib/CommonValue.js"></script>
    <style>

        body.signin {
            background:url(/ysms/commons/images/login-background.jpg) no-repeat center fixed;
        }
        .signinPanal{
            width: 750px;
            margin: 10% auto 0;
            height:340px;
            position: relative;
        }
        .signup-footer {
            position: absolute;
            border-top: solid 1px rgba(255,255,255,.3);
            top:100%;
            width: 750px;
            padding-top: 15px;
        }
        .signinPanal .uname {
            background: #fff url(/ysms/commons/images/user.png) no-repeat 95% center;
        }
        .signinPanal .pword {
            background: #fff url(/ysms/commons/images/locked.png) no-repeat 95% center;
        }
    </style>
</head>
<body class="signin">
<div class="signinPanal">
    <div style="position: absolute;  width: 306px; height: 400px; top: 0; right: 0; background: rgba(255,255,255,.2);    border: 1px solid rgba(255,255,255,.3) ">
        <form id='loginForm' method="post" action="/ysms/admin/login">
            <p class="m-t-md" id="title" style="position: absolute; width: 237px; height: 26px; z-index: 1; top: 8%; left: 13%;">登录到后台</p>
            <div style="position: absolute; width: 237px; height: 26px; z-index: 1; top: 28%; left: 13%;">
                <input type="text" class="form-control uname" placeholder="用户名" name="id" id="id" style="color:#030303;"/>
            </div>
            <div style="position: absolute; width: 237px; height: 26px; z-index: 2; top: 49%; left: 13%;">
                <input type="password" class="form-control pword m-b" placeholder="密码" name="password" id="password" style="color:#030303;"/>
            </div>
            <div style="position: absolute; width: 185px; height: 26px; z-index: 2; top: 60%; left: 13%;">
           <%--     div——msg用来输出登录失败的信息--%>
                <b><DIV id="div_msg" style="color: #FF9C00;"></DIV></b>
            </div><br>
            <div style="position: absolute;width:237px; height: 40px; z-index: 3; top: 70%; left: 13%;">
                <select class="form-control" style="color: #0a0a0a" id="identity">
                    <option value="学生" style="color: #0a0a0a" selected>学生</option>
                    <option value="管理员" style="color: #0a0a0a">管理员</option>
                </select>
            </div>
            <div style="position: absolute; width:237px; height: 40px; z-index: 3; top: 80%; left: 13%; ">
                <button type="submit" class="btn btn-primary btn-block">登　录</button>
            </div>
        </form>
    </div>
    <div class="signup-footer">
        <div class="pull-left" style="color:#fff;">
            © 2016 All Rights Reserved.
        </div>
    </div>
</div>
<script>
    //window.top表示最顶层的浏览器窗口
    //window.self表示当前窗口
    if(window.top!==window.self){window.top.location=window.location};

    $(function(){

        $("#userName").focus(function(){
            $("#div_msg").html("");
        });

        $("#pwd").focus(function(){
            $("#div_msg").html("");
        });

        var rtnCode = GetQueryString("rtnCode");
        if (rtnCode != null && rtnCode == '500') {
            $("#div_msg").html("用户名或密码错误");
        }else if(rtnCode != null && rtnCode == '200')
        {
            $("#div_msg").html("软件试用期已到，请联系商务");
        }else {
            $("#div_msg").html("");
        }
        $("#loginForm").validate({
            //rules 是用来给表单中name绑定验证信息,而messages是给验证不通过的反馈信息
            rules : {
                id : {
                    required : true //必须输入的字段
                },
                password : {
                    required : true //必须输入的字段
                }
            },
            messages : {//验证不通过的反馈信息
                id : {
                    required : "请输入用户名"
                },
                password : {
                    required : "请输入密码"
                }
            },
            submitHandler : function(form) {
                //当return true时，才会提交表单，可用来发送ajax请求
                //提交
                // form.submit();
                submitTest();
            }
        });

    });
    function submitTest() {
        var identity=$('#identity').val();
        if (identity=="学生"){//学生登录
           $.ajax({
                url:'/ysms/student/login',
               type:'post',
               async:false,
               cache:false,
               dataType:'json',
               data:{
                    sno:$('#id').val(),
                   password:$('#password').val()
               },
               success:function (data) {
                    if (data.success=='true'){
                        window.location.href="/ysms/student/index.jsp";
                    }else if(data.success=='false'){
                        $('#div_msg').html("账号或密码错误!");
                    }else{
                        alert("异常");
                    }

               },
               error:function (aa,ee,rr) {
                   swal("系统提示","请求服务器失败","warning");
               }
           });
        }else{
            $.ajax({
               url:'/ysms/admin/login',
               method:'post',
                dataType:'json',
               async:false,
               data:{
                   id:$('#id').val(),
                   password:$('#password').val()
               },
                success:function (data) {
                    if (data.success=='true'){
                        window.location.href="/ysms/admin/index.jsp";
                    }else if (data.success ='false'){
                        $('#div_msg').html("账号或密码错误!");
                    } else{
                       alert("返回数据异常")
                    }
                },
                error:function (aa,ee,rr) {
                    swal("系统提示","请求服务器失败","warning");
                }

            });
        }
    }
</script>
</body>
</html>
