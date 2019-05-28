<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.servlet.StudentPersonalUpdateServlet" %>
<%@ page import="com.entity.StudentRegister" %>
<%@ page import="com.dao.StudentDao" %>
<%@ page import="com.dao.StudentDaoImpl" %>
<%@ page import="com.servlet.LoginServlet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	String patr = request.getContextPath();
	String basePatr = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ patr + "/";

	StudentRegister t =  (StudentRegister) session.getAttribute("student");
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//Dtr HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePatr%>">
<title>用户中心</title>
	<link rel="stylesheet" type="text/css" href="css/personnal.css">
</head>
<body>
	<header>
		<span class="tlt" style="font-family:隶书;">精品课程系统</span>
		<ul class="ul1">
			<li style="margin-left: 20px;">
				<a href="html/studentindex.html" class="a12">课程学习</a>
			</li>
			<li><a href="html/progress.html" class="a22">学习进度</a></li>
			<li><a href="html/learnPlan.html" class="a32">课程计划</a></li>
			<li><a href="chat.jsp" class="a42">社区问答</a></li>
			<li><a href="html/practise.html" class="a62">练习专栏</a></li>
			<li><a href="personal.jsp" class="a52">用户使用中心</a></li>
		</ul>
		<a href="html/login.jsp" class="back" onclick="confirm('您确定要退出系统吗')">退出登录</a>
	</header>
	<aside>
		<div id="use1">
			<img src="images/d1.jpg" class="img1"><br>
			<span style="font: 16px 微软雅黑;display: inline-block;margin-left: 100px;"><%=t.getSid() %></span>
			<br><br>
			<span class="span1" style="font: bolder 19px 微软雅黑;display: inline-block;margin-left: 25px;">使用中心</span>
			<hr>
			<ul class="use2">
				<li class="li1" onclick="Myper()">
					<span>个人信息</span>
					<img src="images/右.png" class="img2">
				</li>
				<li class="li1" onclick="Mynote()">
					<span>学习笔记</span>
					<img src="images/右.png" class="img2">
				</li>
				<li class="li1" onclick="Myschedule()">
					<span>课程进度</span>
					<img src="images/右.png" class="img2">
				</li>
				<li class="li1" onclick="Myhelp()">
					<span>使用帮助</span>
					<img src="images/右.png" class="img2">
				</li>
			</ul>
		</div>
		<div id="cebian">
			<a href="html/help.html">
				<div class="div1">
					<img src="images/帮助中心.png" class="cebian1">
					<span class="sp">帮助<br>中心</span>
				</div>
			</a>
			<div class="div1">
				<img src="images/意见反馈.png" class="cebian1">
				<span class="sp">意见<br>反馈</span>
			</div>
			<div class="div1">
				<img src="images/官方微信.png" class="cebian1">
				<span class="sp">官方<br>微信</span>
			</div>
			<div class="div1">
				<img src="images/收藏.png" class="cebian1">
				<span class="sp">个人<br>收藏</span>
			</div>
		</div>
	</aside>
	<section>
		<div id="per">
			<%
            	StudentDao ud = new StudentDaoImpl();
            	List<StudentRegister> studentAll = ud.getUserAll();
    		%>
			<form action="StudentPersonalUpdateServlet" metrod="post" id="formPersonal">
			<div class="per">
				<li class="nameleft">昵称</li>
				<tr><input type="text" value="<%=t.getSname() %>" name="sname" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">真实姓名</li>
				<tr><input type="text" value="<%=t.getSrealname() %>" name="srealname" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">所在学校</li>
				<tr><input type="text" value="<%=t.getSschool() %>" name="sschool" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">所在专业</li>
				<tr><input type="text" value="<%=t.getSmajor() %>" name="smajor" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div class="per">
				<li class="nameleft">性别</li>
				<tr><input type="text" value="<%=t.getSsex() %>" name="ssex" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div>
			<div id="edit">
				<li class="nameleft">课程学时</li>
				<tr><input type="text" value="<%=t.getStime() %>" name="stime" class="nameright" style="border: 0px solid black;
				height: 30px;width:200px;margin-top: 28px;font-size:20px;"></tr>
			</div><br><br><br><br><br>
				<tr><input type="submit" value="修改" onclick="alert('修改成功')" style="margin-left:300px;width:100px;height:40px;
				font-size:18px;background: #3c3c3c;color:white;border:0px;border-radius:5px;font-family:微软雅黑;"/></tr>
			</form>
			</table>
		</div>
		<div id="note">
			<span class="span2">课程笔记</span><br><hr><br>
			<div class="biji">
				<form action="StudentUpdateNoteServlet" metrod="post">
					<span style="font: 18px 微软雅黑;color:red;">笔记内容：</span><br><textarea name="snote" class="namebottom" 
					style="width:800px;height:400px;font: 16px 微软雅黑;color:black;"><%=t.getSnote() %></textarea><br>
					<input type="submit" value="修改" onclick="alert('修改成功')" style="width:100px;height:30px;margin-left:300px;background:#3c3c3c;
					color:white;border:0px;border-radius:5px;">
				</form>
			</div>
		</div>
		<div id="schedule">
			<span class="span2">正在学习</span><br><hr><br>
			<div class="biji">
				<ul>
					<li class="nametop"><a href="html/videoindex.html" style="color:black;">课程章节：第一节 软件工程简介</a></li>
					<li class="namebottom">2019-3-28</li><br><br>
				</ul>
			</div>
		</div>
		<div id="help">
			<span class="span2">猜你想问</span><br><hr><br>
			<div class="helpAll">
				<ul>
					<li class="namebottom"><a href="html/help.html">ppt无法加载</a></li>
					<li class="namebottom"><a href="html/help.html">视频无法加载</a></li>
					<li class="namebottom"><a href="html/help.html">搜索关键字出错</a></li>
					<li class="namebottom"><a href="html/help.html">页面跳转出错</a></li>
					<li class="namebottom"><a href="html/help.html">修改个人信息出错</a></li>
					<li class="namebottom"><a href="html/help.html">学习笔记无法保存</a></li>
					<li class="namebottom"><a href="html/help.html">无法登陆</a></li>
					<li class="namebottom"><a href="html/help.html">无法注册用户</a></li>
				</ul>
			</div>
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
		var formPersonal = document.getElementById('formPersonal');
		 var per = document.getElementById('per');
		 var note = document.getElementById('note');
		 var schedule = document.getElementById('schedule');
		 var help = document.getElementById('help');
		 function Myper(){
		 	per.style.display = "block";
		 	note.style.display = "none";
		 	help.style.display = "none";
		 	schedule.style.display = "none";
		 }
		 function Mynote(){
		 	per.style.display = "none";
		 	note.style.display = "block";
		 	schedule.style.display = "none";
		 	help.style.display = "none";
		 }
		 function Myhelp(){
		 	per.style.display = "none";
		 	note.style.display = "none";
		 	schedule.style.display = "none";
		 	help.style.display = "block";
		 }
		 function Myschedule(){
		 	per.style.display = "none";
		 	note.style.display = "none";
		 	schedule.style.display = "block";
		 	help.style.display = "none";
		 }
	</script>
</body>
</html>