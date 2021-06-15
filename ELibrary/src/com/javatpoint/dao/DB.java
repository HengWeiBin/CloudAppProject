package com.javatpoint.dao;

import java.sql.*;

public class DB {
	private static String jdbcURL = "jdbc:mysql://localhost:3306/todo_management?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	private static String jdbcUsername = "todoproject";
	private static String jdbcPassword = "1234";
	
public static Connection getCon(){
	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return connection;
}
}
