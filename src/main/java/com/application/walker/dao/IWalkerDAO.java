package com.application.walker.dao;


import java.util.List;

import com.application.walker.service.User;

public interface IWalkerDAO {
	public void addUser(User user);
//	public User retrieveUser(String username, String lastname, String emailid);
	public List<User> retrieveUser(List<String> username, List<String> lastname, List<String> emailid);
	public int deleteUser(String username,User user) throws Exception;
	
}
