package com.sist.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverTest {
	public static void main(String[] args) {
		Connection conn;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##madang","madang");
			System.out.println("success");
		}catch (SQLException e) {
			System.out.println("sqlexception"+e.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("exception"+e.getMessage());
		}
	}
}