package com.servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.TeacherDao;
import com.dao.TeacherDaoImpl;
import com.entity.Teacher;
 
public class AdminControlTeacher extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String tid = request.getParameter("tid");
		String tname = request.getParameter("tname");
		String trealname = request.getParameter("trealname");
		String tschool = request.getParameter("tschool");
		String tmajor = request.getParameter("tmajor");
		String tsex = request.getParameter("tsex");
		String ttime = request.getParameter("ttime");
		String tps = request.getParameter("tps");
		TeacherDao ud = new TeacherDaoImpl();
		 
		if(ud.update(tid,tname, trealname, tschool, tmajor, tsex, ttime, tps)){
			request.setAttribute("xiaoxi", "更新成功");
			request.getRequestDispatcher("/AdminControlTeacherServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}