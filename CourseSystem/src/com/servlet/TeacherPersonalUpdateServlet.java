package com.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.TeacherDao;
import com.dao.TeacherDaoImpl;
import com.entity.Teacher;
 
public class TeacherPersonalUpdateServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String tname = request.getParameter("tname");
		String trealname = request.getParameter("trealname");
		String tschool = request.getParameter("tschool");
		String tmajor = request.getParameter("tmajor");
		String tsex = request.getParameter("tsex");
		String ttime = request.getParameter("ttime");
		TeacherDao ud = new TeacherDaoImpl();
		 
		Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
		String tid = teacher.getTid();
		teacher.setTname(tname);
		teacher.setTrealname(trealname);
		teacher.setTschool(tschool);
		teacher.setTmajor(tmajor);
		teacher.setTsex(tsex);
		teacher.setTtime(ttime);
		if(ud.updateTeacher(tid,tname, trealname, tschool, tmajor, tsex, ttime)){
			request.setAttribute("xiaoxi", "更新成功");
			request.getRequestDispatcher("/TeacherPersonalShowServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}

