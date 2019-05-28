<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>精品课程系统--学生登录页面</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
</head>
<body>
	<div id="log">
		<span id="tlt" style="font:21px 微软雅黑;">精品课程系统</span><br><br><br>
		<form action="../LoginServlet" method="post">
			<input type="text" placeholder="请输入账号" class="inp inp1" id="bank" name="sid"><br><br>
			<input type="password" placeholder="请输入密码" class="inp inp2" id="psw" name="sps"><br><br>
			<input type="checkbox" id="saveCookie">
			<span style="font-size: 12px;font-family: 微软雅黑;">记住密码</span>
			<a href="#" class="a1">忘记密码</a><br><br><br>
			<input type="submit" value="登录" id="sub" name="login">
		</form>
		<br>
		<span class="a3">还未有账号？</span>
		<a href="register.jsp" class="a2">前往注册</a>
	</div><br><br><br>
	<span style="color: white;font-family: 微软雅黑;font-size: 13px;margin-left: 630px;">版权所有 广东工业大学软件工程  精品课程系统</span>
</body>
</html>
<script> 
//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='yes'){
   alert("登录失败，请检查你的账号和密码是否正确!");
  }
</script>