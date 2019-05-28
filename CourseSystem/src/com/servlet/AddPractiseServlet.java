package com.servlet;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.dao.TeacherDao;
import com.dao.TeacherDaoImpl;
import com.entity.Practise;
 
public class AddPractiseServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pid = request.getParameter("pid"); //获取html页面传过来的参数
		String pchapter = request.getParameter("pchapter");
		String pname = request.getParameter("pname");
		String pdifficult = request.getParameter("pdifficult");
		String pcontent = request.getParameter("pcontent");
		String chooseA = request.getParameter("chooseA");
		String chooseB = request.getParameter("chooseB");
		String chooseC = request.getParameter("chooseC");
		String chooseD = request.getParameter("chooseD");
		String panswer = request.getParameter("panswer");
		String ptid = request.getParameter("ptid");
		
		Practise practise = new Practise();
		practise.setPid(pid);
		practise.setPchapter(pchapter);
		practise.setPname(pname);
		practise.setPdifficult(pdifficult);
		practise.setPcontent(pcontent);
		practise.setChooseA(chooseA);
		practise.setChooseB(chooseB);
		practise.setChooseC(chooseC);
		practise.setChooseD(chooseD);
		practise.setPanswer(panswer);
		practise.setPtid(ptid);
		TeacherDao ud = new TeacherDaoImpl();
		
		if(ud.addPractise(practise)){
			request.setAttribute("xiaoxi", "添加成功");
			List<Practise> practiseAll = ud.getPractiseAll();
			request.setAttribute("studentAll", practiseAll);
			request.getRequestDispatcher("/addQuestion.jsp").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}
}
