package com.application.walker.dao;

import java.util.Map;

import com.application.walker.service.User;

public interface IWalkerDAO {
	public void addUser(User user);
	public User retrieveUser(String username, String lastname, String emailid);
	public int deleteUser(String username) throws Exception;
	
}
