package com.dao;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Chat;
import com.entity.Practise;
import com.entity.StudentRegister;
import com.entity.Teacher;
import com.mysql.jdbc.PreparedStatement;
import com.util.DBconn;
 
public class StudentDaoImpl implements StudentDao{
 
	public boolean register(StudentRegister student) {
		boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into student(sid,sphone,semail,sps,sreps)" +
				"values('"+student.getSid()+"','"+student.getSphone()+"','"+student.getSemail()+"','"+student.getSps()+"','"+student.getSreps()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public StudentRegister login(String sid, String sps) {
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select * from student where sid='"+sid+"' and sps='"+sps+"'");
				
				while(rs.next()){
					StudentRegister student = new StudentRegister();
					student.setSid(rs.getString("sid"));
					student.setSphone(rs.getString("sphone"));
					student.setSemail(rs.getString("semail"));
					student.setSps(rs.getString("sps"));
					student.setSreps(rs.getString("sreps"));
					student.setSname(rs.getString("sname"));
					student.setSrealname(rs.getString("srealname"));
					student.setSschool(rs.getString("sschool"));
					student.setSmajor(rs.getString("smajor"));
					student.setSsex(rs.getString("ssex"));
					student.setStime(rs.getString("stime"));
					student.setSnote(rs.getString("snote"));
			
					if(rs.getString("sid").equals(sid) && rs.getString("sps").equals(sps)){
						flag = true;
					}
					return student;
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<StudentRegister> getUserAll() {
		List<StudentRegister> list = new ArrayList<StudentRegister>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from student");
			while(rs.next()){
				StudentRegister student = new StudentRegister();
				student.setSid(rs.getString("sid"));
				student.setSphone(rs.getString("sphone"));
				student.setSemail(rs.getString("semail"));
				student.setSps(rs.getString("sps"));
				student.setSreps(rs.getString("sreps"));
				student.setSname(rs.getString("sname"));
				student.setSrealname(rs.getString("srealname"));
				student.setSschool(rs.getString("sschool"));
				student.setSmajor(rs.getString("smajor"));
				student.setSsex(rs.getString("ssex"));
				student.setStime(rs.getString("stime"));
				student.setSnote(rs.getString("snote"));
				list.add(student);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Chat> getChatAll() {
		List<Chat> list = new ArrayList<Chat>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from chat");
			while(rs.next()){
				Chat chat = new Chat();
				chat.setSquestion(rs.getString("squestion"));
				chat.setSdescribe(rs.getString("sdescribe"));
				chat.setTreply(rs.getString("treply"));
				list.add(chat);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean update(String sid, String sname, String srealname, String sschool, String smajor, String ssex,
			String stime, String sphone, String semail, String sps, String sreps) {
		boolean flag = false;
		DBconn.init();
		String sql ="update student set sname ='"+sname
				+"' , srealname ='"+srealname
				+"' , sschool ='"+sschool
				+"' , smajor ='"+smajor
				+"' , ssex ='"+ssex
				+"' , stime ='"+stime
				+"' , sphone ='"+sphone
				+"' , semail ='"+semail
				+"' , sps ='"+sps
				+"' , sreps ='"+sreps+"' where sid = '"+sid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean updateStudent(String sid, String sname, String srealname, String sschool, String smajor, String ssex,
			String stime) {
		boolean flag = false;
		DBconn.init();
		String sql ="update student set sname ='"+sname
				+"' , srealname ='"+srealname
				+"' , sschool ='"+sschool
				+"' , smajor ='"+smajor
				+"' , ssex ='"+ssex
				+"' , stime ='"+stime+"' where sid = '"+sid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean delete(String sid) {
		boolean flag = false;
		DBconn.init();
		String sql = "delete  from student where sid='"+sid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean add(StudentRegister student) {
    	boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into student(sid,sphone,semail,sps,sreps,sname,srealname,sschool,smajor,ssex,stime)" +
				"values('"+student.getSid()+"','"+student.getSphone()+"','"+student.getSemail()+"','"+student.getSps()+"','"+student.getSreps()+"','"
				+student.getSname()+"','"+student.getSrealname()+"','"+student.getSschool()+"','"+student.getSmajor()+"','"
				+student.getSsex()+"','"+student.getStime()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean updateNote(String sid, String snote) {
		boolean flag = false;
		DBconn.init();
		String sql ="update student set snote ='"+snote
				+"' where sid = '"+sid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean chatPublish(Chat chat) {
    	boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into chat(squestion,sdescribe)" +
				"values('"+chat.getSquestion()+"','"+chat.getSdescribe()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean replyPublish(String sreply,String squestion) {
    	boolean flag = false;
		DBconn.init();
		String sql ="update chat set treply ='"+sreply
				+"' where squestion = '"+squestion+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public StudentRegister searchStudent(String sid) {
		StudentRegister student = null;
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select sid,sphone,semail,sps,sreps,sname,srealname,sschool,smajor,ssex,stime from student where sid='"+sid+"'");
				
				while(rs.next()){
					student = new StudentRegister();
					student.setSid(rs.getString("sid"));
					student.setSphone(rs.getString("sphone"));
					student.setSemail(rs.getString("semail"));
					student.setSps(rs.getString("sps"));
					student.setSreps(rs.getString("sreps"));
					student.setSname(rs.getString("sname"));
					student.setSrealname(rs.getString("srealname"));
					student.setSschool(rs.getString("sschool"));
					student.setSmajor(rs.getString("smajor"));
					student.setSsex(rs.getString("ssex"));
					student.setStime(rs.getString("stime"));
			
					if(rs.getString("sid").equals(sid)){
						flag = true;
					}
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return student;
	}  
	 public List<Practise> getPractiseByTidAll(String ptid) {
		 	List<Practise> list = new ArrayList<Practise>();
			try {
				    DBconn.init();
					ResultSet rs = DBconn.selectSql("select * from practise where ptid='"+ptid+"'");
					while(rs.next()){
						Practise practise = new Practise();
						practise.setPid(rs.getString("pid"));
						practise.setPchapter(rs.getString("pchapter"));
						practise.setPname(rs.getString("pname"));
						practise.setPdifficult(rs.getString("pdifficult"));
						practise.setPcontent(rs.getString("pcontent"));
						practise.setChooseA(rs.getString("chooseA"));
						practise.setChooseB(rs.getString("chooseB"));
						practise.setChooseC(rs.getString("chooseC"));
						practise.setChooseD(rs.getString("chooseD"));
						practise.setPanswer(rs.getString("panswer"));
						practise.setPtid(rs.getString("ptid"));
						list.add(practise);
					}
					DBconn.closeConn();
					return list;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		} 
	 public List<Practise> getPractiseByPdifficultAll(String pdifficult) {
		 	List<Practise> list = new ArrayList<Practise>();
			try {
				    DBconn.init();
					ResultSet rs = DBconn.selectSql("select * from practise where pdifficult='"+pdifficult+"'");
					while(rs.next()){
						Practise practise = new Practise();
						practise.setPid(rs.getString("pid"));
						practise.setPchapter(rs.getString("pchapter"));
						practise.setPname(rs.getString("pname"));
						practise.setPdifficult(rs.getString("pdifficult"));
						practise.setPcontent(rs.getString("pcontent"));
						practise.setChooseA(rs.getString("chooseA"));
						practise.setChooseB(rs.getString("chooseB"));
						practise.setChooseC(rs.getString("chooseC"));
						practise.setChooseD(rs.getString("chooseD"));
						practise.setPanswer(rs.getString("panswer"));
						practise.setPtid(rs.getString("ptid"));
						list.add(practise);
					}
					DBconn.closeConn();
					return list;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		} 
	 public List<Practise> getPractiseByPchapterAll(String pchapter) {
		 	List<Practise> list = new ArrayList<Practise>();
			try {
				    DBconn.init();
					ResultSet rs = DBconn.selectSql("select * from practise where pchapter='"+pchapter+"'");
					while(rs.next()){
						Practise practise = new Practise();
						practise.setPid(rs.getString("pid"));
						practise.setPchapter(rs.getString("pchapter"));
						practise.setPname(rs.getString("pname"));
						practise.setPdifficult(rs.getString("pdifficult"));
						practise.setPcontent(rs.getString("pcontent"));
						practise.setChooseA(rs.getString("chooseA"));
						practise.setChooseB(rs.getString("chooseB"));
						practise.setChooseC(rs.getString("chooseC"));
						practise.setChooseD(rs.getString("chooseD"));
						practise.setPanswer(rs.getString("panswer"));
						practise.setPtid(rs.getString("ptid"));
						list.add(practise);
					}
					DBconn.closeConn();
					return list;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		} 
}
