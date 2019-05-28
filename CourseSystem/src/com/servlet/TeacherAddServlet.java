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
 
public class TeacherAddServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String tid = request.getParameter("tid");
		String tname = request.getParameter("tname");
		String trealname = request.getParameter("trealname");
		String tps = request.getParameter("tps");
		String tschool = request.getParameter("tschool");
		String tmajor = request.getParameter("tmajor");
		String tsex = request.getParameter("tsex");
		String ttime = request.getParameter("ttime");
		
		Teacher teacher = new Teacher();
		teacher.setTid(tid);
		teacher.setTname(tname);
		teacher.setTrealname(trealname);
		teacher.setTps(tps);
		teacher.setTschool(tschool);
		teacher.setTmajor(tmajor);
		teacher.setTsex(tsex);
		teacher.setTtime(ttime);
		TeacherDao ud = new TeacherDaoImpl();
		
		if(ud.add(teacher)){
			request.setAttribute("xiaoxi", "添加成功");
			request.getRequestDispatcher("/AdminControlTeacherServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
