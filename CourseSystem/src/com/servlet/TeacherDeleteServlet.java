package com.servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.TeacherDao;
import com.dao.TeacherDaoImpl;
 
public class TeacherDeleteServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userId = request.getParameter("tid");
		TeacherDao ud = new TeacherDaoImpl();
		
		if(ud.delete(userId)){
			request.setAttribute("xiaoxi", "删除成功");
			request.getRequestDispatcher("/AdminControlTeacherServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}