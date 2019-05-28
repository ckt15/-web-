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
 
public class StudentSearchServlet extends HttpServlet {  //需要继承HttpServlet  并重写doGet
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sid = request.getParameter("sid"); //得到html页面传过来的参数
		
		StudentDao ud = new StudentDaoImpl();
		StudentRegister student = ud.searchStudent(sid);
		
		if(student!=null){
			request.setAttribute("xiaoxi", student);
			request.getRequestDispatcher("/search.jsp").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
