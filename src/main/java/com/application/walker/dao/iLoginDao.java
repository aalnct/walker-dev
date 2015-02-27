package com.application.walker.dao;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.application.walker.service.User;

//Will handle request coming for user login
//Hilton select:
//hilton Honours: 645 412 578
//hiltonselect.com

@Component
public interface iLoginDao {
	public User loginUser(String username,String lastname);
}
