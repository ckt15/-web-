package com.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.entity.StudentRegister;
 
public class StudentPersonalUpdateServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sname = request.getParameter("sname");
		String srealname = request.getParameter("srealname");
		String sschool = request.getParameter("sschool");
		String smajor = request.getParameter("smajor");
		String ssex = request.getParameter("ssex");
		String stime = request.getParameter("stime");
		StudentDao ud = new StudentDaoImpl();
		 
		StudentRegister student = (StudentRegister) request.getSession().getAttribute("student");
		String sid = student.getSid();
		student.setSname(sname);
		student.setSrealname(srealname);
		student.setSschool(sschool);
		student.setSmajor(smajor);
		student.setSsex(ssex);
		student.setStime(stime);
		if(ud.updateStudent(sid,sname, srealname, sschool, smajor, ssex, stime)){
			request.setAttribute("xiaoxi", "更新成功");
			request.getRequestDispatcher("/PersonalShowServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
