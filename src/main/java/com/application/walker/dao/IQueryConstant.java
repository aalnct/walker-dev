package com.application.walker.dao;

public interface IQueryConstant {
	
	//SQL Query
	String insertQuery = "insert into User () values (?,?,?,?,?)";
	public static StringBuilder INSERT_USER_INFORMATION = new StringBuilder(insertQuery);
	
}
