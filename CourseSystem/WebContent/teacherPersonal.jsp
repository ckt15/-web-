<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.servlet.TeacherPersonalUpdateServlet" %>
<%@ page import="com.entity.Teacher" %>
<%@ page import="com.dao.TeacherDao" %>
<%@ page import="com.dao.TeacherDaoImpl" %>
<%@ page import="com.servlet.TeacherLoginServlet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	String patr = request.getContextPath();
	String basePatr = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ patr + "/";

	Teacher t =  (Teacher) session.getAttribute("teacher");
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//Dtr HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePatr%>">
<title>用户中心</title>
	<link rel="stylesheet" type="text/css" href="css/teacherPersonal.css">
</head>
<body>
	<header>
		<span class="tlt" style="font-family:隶书;">精品课程系统--教师系统</span>
		<ul class="ul1">
			<li><a href="html/teacher.html">课程资料</a></li>
			<li><a href="html/publish.html">发布课程</a></li>
			<li><a href="chatMake.jsp">社区问答</a></li>
			<li><a href="html/setPractise.html">创建题目</a></li>
			<li><a href="teacherPersonal.jsp" style="color:red;">用户使用中心</a></li>
		</ul>
		<a href="#" class="back" onclick="logout()">退出登录</a>
	</header>
	<aside>
		<div id="use1">
			<img src="images/d1.jpg" class="img1"><br>
			<span style="font: 16px 微软雅黑;display: inline-block;margin-left: 80px;"><%=t.getTid() %></span>
			<br><br>
			<span class="span1" style="font: bolder 19px 微软雅黑;display: inline-block;margin-left: 25px;">使用中心</span>
			<hr>
			<ul class="use2">
				<li class="li1" onclick="Myper()">
					<span>个人信息</span>
					<img src="images/右.png" class="img2">
				</li>
			</ul>
		</div>
	</aside>
	<section>
		<div id="per">
			<%
            	TeacherDao ud = new TeacherDaoImpl();
            	List<Teacher> teacherAll = ud.getUserAll();
    		%>
			<form action="TeacherPersonalUpdateServlet" metrod="post">
			<div class="per">
				<li class="nameleft">昵称</li>
				<tr><input type="text" value="<%=t.getTname() %>" name="tname" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">真实姓名</li>
				<tr><input type="text" value="<%=t.getTrealname() %>" name="trealname" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">所在学校</li>
				<tr><input type="text" value="<%=t.getTschool() %>" name="tschool" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">教学专业</li>
				<tr><input type="text" value="<%=t.getTmajor() %>" name="tmajor" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">性别</li>
				<tr><input type="text" value="<%=t.getTsex() %>" name="tsex" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div id="edit">
				<li class="nameleft">课程学时</li>
				<tr><input type="text" value="<%=t.getTtime() %>" name="ttime" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div><br><br><br><br><br>
				<tr><input type="submit" value="修改" onclick="alert('修改成功')" style="margin-left:300px;width:100px;height:40px;
				font-size:18px;background: #3c3c3c;color:white;border:0px;border-radius:5px;font-family:微软雅黑;"/></tr>
			</form>
			</table>
		</div>
	</section>
	<footer>
		<span class="tlt2">精品课程系统</span>
		<ul class="ul2">
			<li><a href="#">关注我们</a></li>
			<li><a href="#">联系我们</a></li>
			<li><a href="#">意见反馈</a></li>
			<li><a href="#">教师信息</a></li>
			<li><a href="#">常见问题</a></li>
			<li><a href="#">法律条款</a></li>
			<li><a href="#">加入我们</a></li>
		</ul>
		<br><br><br><br><br>
		<span class="sp1">粤A1-20181010-10 | 京ICP备1010101号-2 | 京公网安备4441155424</span><br>
		<span class="sp2">©2018-2019 abcdefg.org</span>
	</footer>
	<script type="text/javascript">
		function logout(){
	       if (confirm("您确定要退出系统吗？")){
	       		top.location = "html/teacherLogin.jsp";
	       		return false;
	       }	
		}		
	</script>
</body>
</html>