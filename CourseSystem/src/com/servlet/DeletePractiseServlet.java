package com.servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.dao.TeacherDao;
import com.dao.TeacherDaoImpl;
import com.entity.Practise;
 
public class DeletePractiseServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pid = request.getParameter("pid"); //获取html页面传过来的参数
		
		TeacherDao ud = new TeacherDaoImpl();
		
		if(ud.deletePractise(pid)){
			request.setAttribute("xiaoxi", "删除成功");
			List<Practise> practiseAll = ud.getPractiseAll();
			request.setAttribute("studentAll", practiseAll);
			request.getRequestDispatcher("/deleteQuestion.jsp").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
