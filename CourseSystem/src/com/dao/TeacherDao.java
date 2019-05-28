package com.dao;

import java.util.List;

import com.entity.Practise;
import com.entity.Teacher;

public interface TeacherDao {
	public Teacher login(String tid,String tps);
	public boolean updateTeacher(String tid, String tname, String trealname, String tschool, String tmajor, String tsex,
			String ttime);
	public boolean update(String tid, String tname, String trealname, String tschool, String tmajor, String tsex,
			String ttime, String tps);
	public List<Teacher> getUserAll();
	public boolean delete(String tid);
	public boolean add(Teacher teacher);
	public Teacher searchTeacher(String tid);
	public List<Practise> getPractiseAll();
	public boolean addPractise(Practise practise);
	public boolean deletePractise(String pid);
	public boolean updatePractise(String pid, String pchapter, String pname, String pdifficult, String pcontent,
			String chooseA, String chooseB,String chooseC, String chooseD, String panswer,String ptid);
}