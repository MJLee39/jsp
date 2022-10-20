package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import com.sist.vo.MemberVO;

public class MemberDAO {
	public int insertMember(MemberVO m) {
		int re = 0;
		try {
			String sql = "insert into member(id,pwd,name) values(?,?,?)";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","c##madang","madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getName());
			
			re = pstmt.executeUpdate();
			
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			
		}catch (Exception e) {
			System.out.println("exception"+e.getMessage());
		}
		return re;
	}
}
