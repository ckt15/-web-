package com.servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.entity.Chat;
 
public class ChatPublishServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String squestion = request.getParameter("squestion");
		String sdescribe = request.getParameter("sdescribe");
		
		Chat chat = new Chat();
		chat.setSquestion(squestion);
		chat.setSdescribe(sdescribe);
		StudentDao ud = new StudentDaoImpl();
		
		if(ud.chatPublish(chat)){
			request.setAttribute("xiaoxi", "添加成功");
			request.getRequestDispatcher("/ChatServlet").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
