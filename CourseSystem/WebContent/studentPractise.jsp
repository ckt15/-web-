<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.Practise" %>
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
	<title>学生练习页面</title>
	<link rel="stylesheet" type="text/css" href="css/practise.css">
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
	<section style="height:72%;overflow:scroll;">
	<br>	
		 <%
           	TeacherDao ud = new TeacherDaoImpl();
           	List<Practise> practiseAll = ud.getPractiseAll();
           	int a = 1;
           	int b = 1;
           	int j = 1;
           	int k = 1;
           	%>
               <%for(Practise t:practiseAll){%>
			<h5 style="font:bold 16px 微软雅黑;display:block;margin-left:200px;"><%=j++ %>、<%=t.getPcontent() %></h5>
			<div style="font: 16px 微软雅黑;display:block;margin-left:200px;">
				<input type="radio" name="choose"><%=t.getChooseA() %>
				<input type="radio" name="choose" style="margin-left:60px;"><%=t.getChooseB() %><br>
				<input type="radio" name="choose"><%=t.getChooseC() %>
				<input type="radio" name="choose" style="margin-left:60px;"><%=t.getChooseD() %><br><br>
				<input type="button" onclick="shouqi(this)" value="收起" style="width:100px;">
				<input type="button" onclick="chakan(this)" value="查看答案" style="width:100px;">
				<input  value="<%=t.getPanswer() %>" name="panswer" 
				style="width:300px;border:0px;font-size:16px;display:none;">
			</div><br>
		<%}
            %>
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
		        top.location = "html/adminLogin.jsp";
		       	return false;
		    }	
		}
		function chakan(obj){
			obj.nextElementSibling.style.display="block";
		}
		function shouqi(obj){
			obj.nextElementSibling.nextElementSibling.style.display="none";
		}
	</script>
</body>
</html>