<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.Chat" %>
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
	<title>社区问答</title>
	<link rel="stylesheet" type="text/css" href="css/chat.css">
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
		<a href="#" class="back" onclick="logout()">退出登录</a>
	</header>
	<br>
	<aside style="position:fixed;margin-top: 2%;">
		<div id="use1">
			<ul class="use2">
				<li class="li1" onclick="publish()">
					<a href=""><span>发布的问题</span></a>
					<img src="images/右.png" class="img2">
				</li>
				<li class="li1" onclick="receive()">
					<a href=""><span>回复的问题</span></a>
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
			<a href=""> 
				<div class="div1">
					<img src="images/意见反馈.png" class="cebian1">
					<span class="sp">意见<br>反馈</span>
				</div>
			</a>
			<a href="">
				<div class="div1">
					<img src="images/官方微信.png" class="cebian1">
					<span class="sp">官方<br>微信</span>
				</div>
			</a>
			<a href="">
				<div class="div1">
					<img src="images/收藏.png" class="cebian1">
					<span class="sp">个人<br>收藏</span>
				</div>
			</a>
		</div>
	</aside>
	<section style="height:60%;margin-top: 1.5%;">
		<div id="show1">
			<span class="span2"">发布的问题</span><br><br><hr style="width: 900px;">
			<tr>
				<th><span style="font:bold 18px 微软雅黑;margin-left:140px;display:inline-block;">问题</span></th>
				<th><span style="font:bold 18px 微软雅黑;margin-left:340px;display:inline-block;">问题描述</span></th>
			</tr>
		</div>
		<div id="note" style="overflow:scroll;width:900px;height:90%;">
			<div style="width:850px;overflow:auto;margin-bottom:60px;">
				<form action="ChatPublishServlet" metrod="post">
					<input type="text"  name="squestion" class="nametop" style="font:15px 微软雅黑;width:330px;height:40px;">
					<input type="text"  name="sdescribe" class="namebottom" style="font:15px 微软雅黑;width:360px;margin-left:40px;display:inline-block;height:40px;">
					<input type="submit" value="发布" style="font:15px 微软雅黑;width:100px;margin-left:10px;
					height:30px;background:#3c3c3c;border:0px;border-radius:5px;color:white;cursor:pointer;">
				</form>	
				<br>
				<%
				 	StudentDao ud = new StudentDaoImpl();
	            	List<Chat> questionAll = ud.getChatAll();
	         	%>  
	         	<% for(Chat t:questionAll){%>   
				<form action="ChatShowServlet" method="post">
					
					<tr>
						<td><input type="text" value="<%=t.getSquestion() %>" name="squestion" style="font:15px 微软雅黑;width:330px;height:30px;border:0px;text-align:center;"></td>
						<td><input type="text" value="<%=t.getSdescribe() %>" name="sdescribe" style="font:15px 微软雅黑;
						width:360px;margin-left:40px;display:inline-block;height:30px;border:0px;text-align:center;"></td>
					</tr>
					<br><br><hr>
				</form>	
				<%}
	            %>
			</div>
		</div>
		<div id="show2" style="display:none;">
			<span class="span2"">回复的问题</span><br><br><hr style="width: 900px;">
			<tr>
				<th><span style="font:bold 18px 微软雅黑;margin-left:140px;display:inline-block;">问题</span></th>
				<th><span style="font:bold 18px 微软雅黑;margin-left:360px;display:inline-block;">回复</span></th>
			</tr>
		</div>
			<br>
		<div id="note2" style="display:none;overflow:scroll;width:900px;height:90%;">	
			<div style="width:850px;overflow:auto;margin-bottom:60px;">
				 <%
				 	StudentDao ad = new StudentDaoImpl();
	            	List<Chat> replyAll = ad.getChatAll();
	         	%>  
	         	<% for(Chat s:replyAll){%>   
				<form action="" method="post">
					<tr>
						<td><input type="text" value="<%=s.getSquestion() %>" name="squestion" style="font:15px 微软雅黑;width:330px;height:30px;border:0px;text-align:center;"></td>
						<td><input type="text" value="<%=s.getTreply() %>" name="treply" style="font:15px 微软雅黑;
							width:360px;margin-left:40px;display:inline-block;height:30px;border:0px;text-align:center;"></td>
					</tr>
					<br><br><hr>
				</form>	
				<%}
	            %>
	    	</div>
		</div>
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
	<script type="text/javascript" src="js/chat.js"></script>
	<script type="text/javascript">
		function logout(){
		    if (confirm("您确定要退出系统吗？")){
		        top.location = "html/login.jsp";
		       	return false;
		    }	
		}
		var note = document.getElementById('note');
		var note2 = document.getElementById('note2');
		var show1 = document.getElementById('show1');
		var show2 = document.getElementById('show2');
		function publish(){
			note.style.display = "block";
			note2.style.display = "none";
			show1.style.display = "block";
			show2.style.display = "none";
		}
		function receive(){
			note.style.display = "none";
			note2.style.display = "block";
			show2.style.display = "block";
			show1.style.display = "none";
		}
	</script>
</body>
</html>