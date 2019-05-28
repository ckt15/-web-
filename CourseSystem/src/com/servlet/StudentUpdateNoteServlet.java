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
 
public class StudentUpdateNoteServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String snote = request.getParameter("snote");
	
		StudentDao ud = new StudentDaoImpl();
		 
		StudentRegister student = (StudentRegister) request.getSession().getAttribute("student");
		String sid = student.getSid();
		student.setSnote(snote);
		
		if(ud.updateNote(sid,snote)){
			request.setAttribute("xiaoxi", "更新成功");
			request.getRequestDispatcher("/PersonalShowServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
