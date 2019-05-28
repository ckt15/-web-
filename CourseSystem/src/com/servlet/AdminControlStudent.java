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
 
public class AdminControlStudent extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String srealname = request.getParameter("srealname");
		String sschool = request.getParameter("sschool");
		String smajor = request.getParameter("smajor");
		String ssex = request.getParameter("ssex");
		String stime = request.getParameter("stime");
		String sphone = request.getParameter("sphone");
		String semail = request.getParameter("semail");
		String sps = request.getParameter("sps");
		String sreps = request.getParameter("sreps");
		StudentDao ud = new StudentDaoImpl();
		 
		if(ud.update(sid,sname, srealname, sschool, smajor, ssex, stime, sphone,semail, sps,sreps)){
			request.setAttribute("xiaoxi", "更新成功");
			request.getRequestDispatcher("/AdminControlStudentServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
