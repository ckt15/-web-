package com.dao;
 
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.StudentRegister;
import com.mysql.jdbc.PreparedStatement;
import com.util.DBconn;
 
public class AdminDaoImpl implements AdminDao{
 
    public boolean login(String aid, String aps) {
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select * from adminlogin where aid='"+aid+"' and aps='"+aps+"'");
				while(rs.next()){
					if(rs.getString("aid").equals(aid) && rs.getString("aps").equals(aps)){
						flag = true;
					}
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}