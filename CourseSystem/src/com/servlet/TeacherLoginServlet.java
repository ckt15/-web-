package com.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TeacherDao;
import com.dao.TeacherDaoImpl;
import com.entity.Teacher;
 
public class TeacherLoginServlet extends HttpServlet {  //需要继承HttpServlet  并重写doGet
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String tid = request.getParameter("tid"); //得到html页面传过来的参数
		String tps = request.getParameter("tps");
		
		TeacherDao ud = new TeacherDaoImpl();
		Teacher teacher = ud.login(tid, tps);
		
		if(teacher!=null){
			request.setAttribute("xiaoxi", "欢迎用户"+tid); //向request域中放置信息
			HttpSession session = request.getSession();			
			session.setAttribute("teacher", teacher);
			response.sendRedirect("html/teacher.html");
		}else{
			response.sendRedirect("html/teacherLogin.jsp?error=yes");
		}
	}
}
