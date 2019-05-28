package com.dao;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Practise;
import com.entity.StudentRegister;
import com.entity.Teacher;
import com.util.DBconn;
 
public class TeacherDaoImpl implements TeacherDao{
 
    public Teacher login(String tid, String tps) {
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select * from teacherlogin where tid='"+tid+"' and tps='"+tps+"'");
				while(rs.next()){
					Teacher teacher = new Teacher();
					teacher.setTid(rs.getString("tid"));
					teacher.setTps(rs.getString("tps"));
					teacher.setTname(rs.getString("tname"));
					teacher.setTrealname(rs.getString("trealname"));
					teacher.setTschool(rs.getString("tschool"));
					teacher.setTmajor(rs.getString("tmajor"));
					teacher.setTsex(rs.getString("tsex"));
					teacher.setTtime(rs.getString("ttime"));
					
					if(rs.getString("tid").equals(tid) && rs.getString("tps").equals(tps)){
						flag = true;
					}
					return teacher;
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
    public boolean updateTeacher(String tid, String tname, String trealname, String tschool, String tmajor, String tsex,
			String ttime) {
		boolean flag = false;
		DBconn.init();
		String sql ="update teacherlogin set tname ='"+tname
				+"' , trealname ='"+trealname
				+"' , tschool ='"+tschool
				+"' , tmajor ='"+tmajor
				+"' , tsex ='"+tsex
				+"' , ttime ='"+ttime+"' where tid = '"+tid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public boolean update(String tid, String tname, String trealname, String tschool, String tmajor, String tsex,
			String ttime, String tps) {
		boolean flag = false;
		DBconn.init();
		String sql ="update teacherlogin set tname ='"+tname
				+"' , trealname ='"+trealname
				+"' , tschool ='"+tschool
				+"' , tmajor ='"+tmajor
				+"' , tsex ='"+tsex
				+"' , ttime ='"+ttime
				+"' , tps ='"+tps+"' where tid = '"+tid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public boolean updatePractise(String pid, String pchapter, String pname, String pdifficult, String pcontent,
			String chooseA, String chooseB,String chooseC, String chooseD, String panswer,String ptid) {
		boolean flag = false;
		DBconn.init();
		String sql ="update practise set pchapter ='"+pchapter
				+"' , pname ='"+pname
				+"' , pdifficult ='"+pdifficult
				+"' , pcontent ='"+pcontent
				+"' , chooseA ='"+chooseA
				+"' , chooseB ='"+chooseB
				+"' , chooseC ='"+chooseC
				+"' , chooseD ='"+chooseD
				+"' , panswer ='"+panswer
				+"' , ptid ='"+ptid+"'where pid = '"+pid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public List<Teacher> getUserAll() {
		List<Teacher> list = new ArrayList<Teacher>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from teacherlogin");
			while(rs.next()){
				Teacher teacher = new Teacher();
				teacher.setTid(rs.getString("tid"));
				teacher.setTps(rs.getString("tps"));
				teacher.setTname(rs.getString("tname"));
				teacher.setTrealname(rs.getString("trealname"));
				teacher.setTschool(rs.getString("tschool"));
				teacher.setTmajor(rs.getString("tmajor"));
				teacher.setTsex(rs.getString("tsex"));
				teacher.setTtime(rs.getString("ttime"));
				list.add(teacher);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
    public List<Practise> getPractiseAll() {
		List<Practise> list = new ArrayList<Practise>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from practise");
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
    public boolean delete(String tid) {
		boolean flag = false;
		DBconn.init();
		String sql = "delete  from teacherlogin where tid='"+tid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public boolean deletePractise(String pid) {
		boolean flag = false;
		DBconn.init();
		String sql = "delete  from practise where pid='"+pid+"'";
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public boolean add(Teacher teacher) {
    	boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into teacherlogin(tid,tname,trealname,tps,tschool,tmajor,tsex,ttime)" +
				"values('"+teacher.getTid()+"','"+teacher.getTname()+"','"+teacher.getTrealname()+"','"+teacher.getTps()+"','"
				+teacher.getTschool()+"','"+teacher.getTmajor()+"','"+teacher.getTsex()+"','"+teacher.getTtime()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public boolean addPractise(Practise practise) {
    	boolean flag = false;
		DBconn.init();
		int i =DBconn.addUpdDel("insert into practise(pid,pchapter,pname,pdifficult,pcontent,chooseA,chooseB,chooseC,chooseD,panswer,ptid)" +
				"values('"+practise.getPid()+"','"+practise.getPchapter()+"','"+practise.getPname()+"','"+practise.getPdifficult()+"','"
				+practise.getPcontent()+"','"+practise.getChooseA()+"','"+practise.getChooseB()+"','"+practise.getChooseC()+"','"
				+practise.getChooseD()+"','"+practise.getPanswer()+"','"+practise.getPtid()+"')");
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    public Teacher searchTeacher(String tid) {
    	Teacher teacher = null;
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select tid,tps,tname,trealname,tschool,tmajor,tsex,ttime from teacherlogin where tid='"+tid+"'");
				
				while(rs.next()){
					teacher = new Teacher();
					teacher.setTid(rs.getString("tid"));
					teacher.setTps(rs.getString("tps"));
					teacher.setTname(rs.getString("tname"));
					teacher.setTrealname(rs.getString("trealname"));
					teacher.setTschool(rs.getString("tschool"));
					teacher.setTmajor(rs.getString("tmajor"));
					teacher.setTsex(rs.getString("tsex"));
					teacher.setTtime(rs.getString("ttime"));
			
					if(rs.getString("tid").equals(tid)){
						flag = true;
					}
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return teacher;
	}  
}

