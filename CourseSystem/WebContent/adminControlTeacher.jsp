<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.servlet.TeacherPersonalUpdateServlet" %>
<%@ page import="com.entity.Teacher" %>
<%@ page import="com.dao.TeacherDao" %>
<%@ page import="com.dao.TeacherDaoImpl" %>
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
<body style="height:100%;">
	<header>
		<a href="html/adminindex.html" style="margin-left: 900px;line-height: 70px;font-size: 15px;font-family: 微软雅黑;">返回首页</a>
		<span class="tlt" style="font-family:隶书;margin-left: 20px;">精品课程系统--服务端系统</span>
		<a href="#" class="back" onclick="logout()" style="margin-left: 20px;">退出登录</a>
	</header>
	<section style="height:72%;overflow:scroll;">
		<table width="500" border="1" cellpadding="0" style="margin-left:240px;margin-top:40px;border:1px solid black;height:100%;">
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
			<form action="searchTeacher.jsp" method="post">
				<tr>
					<td colspan="8"></td>
					<td><input type="submit" value="查询" style="width:100px;"/></td>
				</tr>
			</form>
			<form action="TeacherAddServlet" method="post" id="formPersonal1">
					<tr>
						<td><input type="text"  name="tid" style="width:100px;border:0px;font-size:16px;font-size:16px;"></td>
						<td><input type="text"  name="tps" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text"  name="tname" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text"  name="trealname" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text"  name="tschool" style="width:140px;border:0px;font-size:16px;"></td>
						<td><input type="text"  name="tmajor" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text"  name="tsex" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text"  name="ttime" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="submit" value="添加" onclick="alert('添加成功');" style="width:100px;"/></td>
					</tr>
				</form>	
			 <%
			 		TeacherDao ud = new TeacherDaoImpl();
	            	List<Teacher> teacherAll = ud.getUserAll();
	            	int i = 2;
	         %>    
	         <% for(Teacher t:teacherAll){%>   
				<form action="" method="post" id="formPersonal<%=i++%>">
					<tr>
						<td><input type="text" value="<%=t.getTid() %>" name="tid" style="width:100px;border:0px;font-size:16px;font-size:16px;"></td>
						<td><input type="text" value="<%=t.getTps() %>" name="tps" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text" value="<%=t.getTname() %>" name="tname" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text" value="<%=t.getTrealname() %>" name="trealname" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text" value="<%=t.getTschool() %>" name="tschool" style="width:140px;border:0px;font-size:16px;"></td>
						<td><input type="text" value="<%=t.getTmajor() %>" name="tmajor" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text" value="<%=t.getTsex() %>" name="tsex" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="text" value="<%=t.getTtime() %>" name="ttime" style="width:100px;border:0px;font-size:16px;"></td>
						<td><input type="submit" value="更新" onclick="gengxin(this)" style="width:100px;"/>
						<input type="submit" value="删除" onclick="shanchu(this)" style="width:100px;"/></td>
					</tr>
				</form>	
				<%}
	            %>
		</table>
	</section>
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