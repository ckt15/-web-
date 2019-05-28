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
 
public class TeacherPersonalShowServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TeacherDao ud = new TeacherDaoImpl();
		List<Teacher> teacherAll = ud.getUserAll();
		request.setAttribute("teacherAll", teacherAll);
		request.getRequestDispatcher("/teacherPersonal.jsp").forward(request, response);
	}
}


