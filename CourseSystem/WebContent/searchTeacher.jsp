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
	<title>教师管理页面</title>
	<link rel="stylesheet" type="text/css" href="css/adminindex.css">
</head>
<body>
	<header>
		<a href="html/adminindex.html" style="margin-left: 900px;line-height: 70px;font-size: 15px;font-family: 微软雅黑;">返回首页</a>
		<span class="tlt" style="font-family:隶书;margin-left: 20px;">精品课程系统--服务端系统</span>
		<a href="#" class="back" onclick="logout()" style="margin-left: 20px;">退出登录</a>
	</header>
	<table width="500" border="1" cellpadding="0" style="margin-left:190px;margin-top:40px;border:1px solid black;">
		<tr style="color:white;background:#3c3c3c;border:1px solid black;height:40px;">
			<th>id</th>
			<th>密码</th>
			<th>昵称</th>
			<th>真实姓名</th>
			<th>学校</th>
			<th>专业</th>
			<th>性别</th>
			<th>课程学时</th>
			<th>操作</th>
		</tr>
		<form action="TeacherSearchServlet" method="post">
			<tr>
				<td><input type="text"  name="tid" style="width:100px;border:0px;font-size:16px;font-size:16px;"></td>
				<td colspan="6"></td>
				<td colspan="1"><a href="adminControlTeacher.jsp"><input type="button" value="返回全部列表" style="width:210px;"/></a></td>
				<td><input type="submit" value="查询" style="width:100px;"/></td>
			</tr>
		</form>
			<form action="" method="post">
				<tr>
					<td><input type="text"  name="tid" style="width:100px;border:0px;font-size:16px;font-size:16px;" value="${xiaoxi.tid}"></td>
					<td><input type="text"  name="tps" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.tps}"></td>
					<td><input type="text"  name="tname" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.tname}"></td>
					<td><input type="text"  name="trealname" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.trealname}"></td>
					<td><input type="text"  name="tschool" style="width:140px;border:0px;font-size:16px;" value="${xiaoxi.tschool}"></td>
					<td><input type="text"  name="tmajor" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.tmajor}"></td>
					<td><input type="text"  name="tsex" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.tsex}"></td>
					<td><input type="text"  name="ttime" style="width:100px;border:0px;font-size:16px;" value="${xiaoxi.ttime}"></td>
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
		obj.form.action = "AdminControlTeacher";
		alert("更新成功！");
	}
	function shanchu(obj){
		obj.form.action = "TeacherDeleteServlet";
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