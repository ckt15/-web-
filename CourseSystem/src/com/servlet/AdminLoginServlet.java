package com.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.AdminDao;
import com.dao.AdminDaoImpl;
 
public class AdminLoginServlet extends HttpServlet {  //需要继承HttpServlet  并重写doGet
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String aid = request.getParameter("aid"); //得到html页面传过来的参数
		String aps = request.getParameter("aps");
		
		AdminDao ud = new AdminDaoImpl();
		
		if(ud.login(aid, aps)){
			request.setAttribute("xiaoxi", "欢迎用户"+aid); //向request域中放置信息
			response.sendRedirect("html/adminindex.html");
		}else{
			response.sendRedirect("html/adminLogin.jsp?error=yes");
		}
	}
}
