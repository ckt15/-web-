package com.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.entity.StudentRegister;
 
public class LoginServlet extends HttpServlet {  //需要继承HttpServlet  并重写doGet
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sid = request.getParameter("sid"); //得到html页面传过来的参数
		String sps = request.getParameter("sps");
		
		StudentDao ud = new StudentDaoImpl();
		StudentRegister student = ud.login(sid, sps);
		if(student!=null){
			request.setAttribute("xiaoxi", "欢迎用户"+sid); //向request域中放置信息
			HttpSession session = request.getSession();			
			session.setAttribute("student", student);
			response.sendRedirect("html/studentindex.html");
		}else{
			response.sendRedirect("html/login.jsp?error=yes");
		}
	}
}
