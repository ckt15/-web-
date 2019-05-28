<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.Chat" %>
<%@ page import="com.dao.StudentDao" %>
<%@ page import="com.dao.StudentDaoImpl" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//Dtr HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户中心</title>
	<link rel="stylesheet" type="text/css" href="css/chatMake.css">
</head>
<body>
	<header>
		<span class="tlt" style="font-family:隶书;">精品课程系统--教师系统</span>
		<ul class="ul1">
			<li><a href="html/teacher.html">课程资料</a></li>
			<li><a href="html/publish.html">发布课程</a></li>
			<li><a href="chatMake.jsp" style="color:red;">社区问答</a></li>
			<li><a href="html/setPractise.html">创建题目</a></li>
			<li><a href="teacherPersonal.jsp">用户使用中心</a></li>
		</ul>
		<a href="#" class="back" onclick="logout()">退出登录</a>
	</header>
	<aside style="position:fixed;margin-top: 2%;">
		<div id="use1">
			<ul class="use2">
				<li class="li1" onclick="publish()">
					<a href=""><span>回复的问题</span></a>
					<img src="images/右.png" class="img2">
				</li>
				<li class="li1" onclick="receive()">
					<a href=""><span>收到的问题</span></a>
					<img src="images/右.png" class="img2">
				</li>
			</ul>
		</div>
	</aside>
	<section style="height:60%;margin-top: 1.5%;">
		<div id="show1">
			<span class="span2"">回复</span><br><br><hr style="width: 900px;">
			<tr>
				<th><span style="font:bold 18px 微软雅黑;margin-left:140px;display:inline-block;">问题</span></th>
				<th><span style="font:bold 18px 微软雅黑;margin-left:340px;display:inline-block;">回复</span></th>
			</tr>
		</div>
		<div id="note" style="overflow:scroll;width:950px;height:90%;">
			<div style="width:900px;overflow:auto;margin-bottom:60px;">
				<%
				 	StudentDao ud = new StudentDaoImpl();
	            	List<Chat> questionAll = ud.getChatAll();
	         	%> 
	         	<% for(Chat t:questionAll){%>
				<form action="ReplyPublishServlet" metrod="post">
					<input type="text" value="<%=t.getSquestion() %>" name="squestion" style="font:15px 微软雅黑;width:330px;height:40px;">
					<input type="text"  name="treply" class="nametop" style="font:15px 微软雅黑;width:360px;margin-left:40px;display:inline-block;height:40px;">
					<input type="submit" value="回复" style="font:15px 微软雅黑;width:100px;margin-left:10px;
						height:30px;background:#3c3c3c;border:0px;border-radius:5px;color:white;cursor:pointer;">
				</form>
				<%}
	            %>
            </div>
		</div>
		<div id="show2" style="display:none;">
			<span class="span2"">收到的问题</span><br><br><hr style="width: 900px;">
			<tr>
				<th><span style="font:bold 18px 微软雅黑;margin-left:140px;display:inline-block;">问题</span></th>
				<th><span style="font:bold 18px 微软雅黑;margin-left:360px;display:inline-block;">问题描述</span></th>
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
						<td><input type="text" value="<%=s.getSdescribe() %>" name="sdescribe" style="font:15px 微软雅黑;
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