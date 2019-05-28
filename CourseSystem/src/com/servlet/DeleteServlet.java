package com.servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
 
public class DeleteServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userId = request.getParameter("sid");
		StudentDao ud = new StudentDaoImpl();
		
		if(ud.delete(userId)){
			request.setAttribute("xiaoxi", "删除成功");
			request.getRequestDispatcher("/AdminControlStudentServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}