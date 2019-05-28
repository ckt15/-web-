<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.StudentRegister" %>
<%@ page import="com.dao.StudentDao" %>
<%@ page import="com.dao.StudentDaoImpl" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>学生管理页面</title>
	<link rel="stylesheet" type="text/css" href="css/adminindex.css">
</head>
<body>
	<header>
		<a href="html/adminindex.html" style="margin-left: 900px;line-height: 70px;font-size: 15px;font-family: 微软雅黑;">返回首页</a>
		<span class="tlt" style="font-family:隶书;margin-left: 20px;">精品课程系统--服务端系统</span>
		<a href="#" class="back" onclick="logout()" style="margin-left: 20px;">退出登录</a>
	</header>
	<table width="500" border="1" cellpadding="0" style="margin-left:120px;margin-top:40px;border:1px solid black;">
		<tr style="color:white;background:#3c3c3c;border:1px solid black;height:40px;">
			<th>id</th>
			<th>手机号码</th>
			<th>电子邮箱</th>
			<th>密码</th>
			<th>确认密码</th>
			<th>昵称</th>
			<th>真实姓名</th>
			<th>学校</th>
			<th>专业</th>
			<th>性别</th>
			<th>课程学时</th>
			<th>操作</th>
		</tr>
		<form action="StudentSearchServlet" method="post">
			<tr>
				<td><input type="text"  name="sid" style="width:100px;border:0px;font-size:16px;font-size:16px;"></td>
				<td colspan="8"></td>
				<td colspan="2"><a href="adminControlStudent.jsp"><input type="button" value="返回全部列表" style="width:210px;"/></a></td>
				<td><input type="submit" value="查询" style="width:100px;"/></td>
			</tr>
		</form>
			<form action="" method="post">
				<tr>
					<td><input type="text"  name="sid" style="width:100px;border:0px;font-size:16px;font-size:16px;" value="${xiaoxi.sid}"></td>
					<td><input type="text"  name="sphone" style="width:100px;border:0px;font-size:16px;font-size:16px;" value="${xiaoxi.sphone}"></td>
					<td><input type="text"  name="semail" style="width:100px;border:0px;font-size:16px;font-size:16px;" value="${xiaoxi.semail}"></td>
					<td><input type="text"  name="sps" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.sps}"></td>
					<td><input type="text"  name="sreps" style="width:100px;border:0px;font-size:16px;font-size:16px;" value="${xiaoxi.sreps}"></td>
					<td><input type="text"  name="sname" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.sname}"></td>
					<td><input type="text"  name="srealname" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.srealname}"></td>
					<td><input type="text"  name="sschool" style="width:140px;border:0px;font-size:16px;" value="${xiaoxi.sschool}"></td>
					<td><input type="text"  name="smajor" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.smajor}"></td>
					<td><input type="text"  name="ssex" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.ssex}"></td>
					<td><input type="text"  name="stime" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.stime}"></td>
					<td><input type="submit" value="更新" onclick="gengxin(this)" style="width:100px;"/>
					<input type="submit" value="删除" onclick="shanchu(this)" style="width:100px;"/></td>
				</tr>
			</form>
	</table>
<footer>
		<span class="tlt2">精品课程系统</span>
		<ul class="ul2">
			<li><a href="#">关注我们</a></li>
			<li><a href="#">联系我们</a></li>
			<li><a href="#">意见反馈</a></li>
		</ul>
		<ul class="ul2">
			<li><a href="#">教师信息</a></li>
			<li><a href="#">常见问题</a></li>
			<li><a href="#">法律条款</a></li>
		</ul>
		<ul class="ul2">
			<li><a href="#">加入我们</a></li>
		</ul>
		<br><br><br><br><br>
		<span class="sp1">粤A1-20181010-10 | 京ICP备1010101号-2 | 京公网安备4441155424 
</span><br>
		<span class="sp2">©2018-2019 abcdefg.org</span>
	</footer>
	<script type="text/javascript">
	function gengxin(obj){
		obj.form.action = "AdminControlStudent";
		alert("更新成功！");
	}
	function shanchu(obj){
		obj.form.action = "DeleteServlet";
		alert("删除成功！");
	}
		function logout(){
		    if (confirm("您确定要退出系统吗？")){
		        top.location = "html/adminLogin.jsp";
		       	return false;
		    }	
		}
	</script>
</body>
</html>