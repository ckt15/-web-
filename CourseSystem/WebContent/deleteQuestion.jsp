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
	<title>删除题目</title>
	<link rel="stylesheet" type="text/css" href="css/setPractise.css">
</head>
<body>
	<header>
		<span class="tlt" style="font-family:隶书;">精品课程系统--教师系统</span>
		<ul class="ul1">
			<li><a href="html/teacher.html">课程资料</a></li>
			<li><a href="html/publish.html">发布课程</a></li>
			<li><a href="chatMake.jsp">社区问答</a></li>
			<li><a href="html/setPractise.html" style="color:red;">创建题目</a></li>
			<li><a href="teacherPersonal.jsp">用户使用中心</a></li>
		</ul>
		<a href="html/setPractise.html" style="margin-left: 200px;line-height: 70px;font-size: 15px;font-family: 微软雅黑;">返回上一层</a>
		<a href="#" class="back" onclick="logout()" style="margin-left: 50px;display:inline-block;">退出登录</a>
	</header>
	<section style="height:72%;overflow:scroll;">
	<table width="500" border="1" cellpadding="0" style="margin-left:120px;margin-top:40px;border:1px solid black;height:100%;">
		<tr style="color:white;background:#3c3c3c;border:1px solid black;height:40px;">
			<th>题目号</th>
			<th>章节号</th>
			<th>章节名</th>
			<th>题目难度</th>
			<th>题目</th>
			<th>选项A</th>
			<th>选项B</th>
			<th>选项C</th>
			<th>选项D</th>
			<th>答案</th>
			<th>出题人</th>
			<th>操作</th>
		</tr>
		 <%
            	TeacherDao ud = new TeacherDaoImpl();
            	List<Practise> practiseAll = ud.getPractiseAll();
            	int i = 2;
            	%>
                <%for(Practise t:practiseAll){%>
			<form action="DeletePractiseServlet" method="post" id="formPersonal<%=i++ %>>">
				<tr>
					<td><input type="text" value="<%=t.getPid() %>" name="pid" style="width:100px;border:0px;font-size:16px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getPchapter() %>" name="pchapter" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getPname() %>" name="pname" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getPdifficult() %>" name="pdifficult" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getPcontent() %>" name="pcontent" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getChooseA() %>" name="chooseA" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getChooseB() %>" name="chooseB" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getChooseC() %>" name="chooseC" style="width:140px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getChooseD() %>" name="chooseD" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getPanswer() %>" name="panswer" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="text" value="<%=t.getPtid() %>" name="ptid" style="width:100px;border:0px;font-size:16px;"></td>
					<td><input type="submit" value="删除" onclick="alert('删除成功');"  style="width:100px;"></td>
				</tr>
			</form>
		<%}
            %>
	</table><br>
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