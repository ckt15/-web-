package com.servlet;
 
import javax.servlet.http.HttpServlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.entity.StudentRegister;
 
public class RegisterServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sid = request.getParameter("sid"); //获取html页面传过来的参数
		String sphone = request.getParameter("sphone");
		String semail = request.getParameter("semail");
		String sps = request.getParameter("sps");
		String sreps = request.getParameter("sreps");
		
		StudentRegister student = new StudentRegister(); //实例化一个对象，组装属性
		student.setSid(sid);
		student.setSphone(sphone);
		student.setSemail(semail);
		student.setSps(sps);
		student.setSreps(sreps);
		
		StudentDao ud = new StudentDaoImpl();
		
		if(ud.register(student)){
			request.setAttribute("userid", sid);  //向request域中放置参数
			//request.setAttribute("xiaoxi", "注册成功");
			response.sendRedirect("html/login.jsp");  //转发到登录页面
		}else{
			response.sendRedirect("html/register.jsp?error=yes");//重定向到首页
		}
	}
}
