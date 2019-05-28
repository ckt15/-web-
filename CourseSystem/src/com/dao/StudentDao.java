package com.dao;
 
import java.util.List;

import com.entity.Chat;
import com.entity.Practise;
import com.entity.StudentRegister;
 
public interface StudentDao {
	public StudentRegister login(String sid,String sps);
	public boolean register(StudentRegister student);
	public List<StudentRegister> getUserAll();
	public boolean delete(String sid) ;
	public boolean updateStudent(String sid, String sname, String srealname, String sschool, String smajor, String ssex,
			String stime);
	public boolean update(String sid, String sname, String srealname, String sschool, String smajor, String ssex,
			String stime, String sphone, String semail, String sps, String sreps);
	public boolean add(StudentRegister student);
	public boolean updateNote(String sid, String snote);
	public boolean chatPublish(Chat chat);
	public List<Chat> getChatAll();
	public boolean replyPublish(String treply,String squestion);
	public StudentRegister searchStudent(String sid);
	public List<Practise> getPractiseByTidAll(String ptid);
	public List<Practise> getPractiseByPdifficultAll(String pdifficult);
	public List<Practise> getPractiseByPchapterAll(String pchapter);
}
