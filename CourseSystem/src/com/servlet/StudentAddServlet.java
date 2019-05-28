package com.servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.entity.StudentRegister;
 
public class StudentAddServlet extends HttpServlet {
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
		String sname = request.getParameter("sname");
		String srealname = request.getParameter("srealname");
		String sschool = request.getParameter("sschool");
		String smajor = request.getParameter("smajor");
		String ssex = request.getParameter("ssex");
		String stime = request.getParameter("stime");
		
		StudentRegister student = new StudentRegister();
		student.setSid(sid);
		student.setSphone(sphone);
		student.setSemail(semail);
		student.setSps(sps);
		student.setSreps(sreps);
		student.setSname(sname);
		student.setSrealname(srealname);
		student.setSschool(sschool);
		student.setSmajor(smajor);
		student.setSsex(ssex);
		student.setStime(stime);
		StudentDao ud = new StudentDaoImpl();
		
		if(ud.add(student)){
			request.setAttribute("xiaoxi", "添加成功");
			request.getRequestDispatcher("/AdminControlStudentServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
