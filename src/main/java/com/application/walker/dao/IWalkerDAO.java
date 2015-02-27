package com.application.walker.dao;


import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.application.walker.service.Coach;
import com.application.walker.service.User;
import com.application.walker.service.health;
@Component
@Repository
public interface IWalkerDAO {
	public void addUser(User user);
//	public User retrieveUser(String username, String lastname, String emailid);
	public List<User> retrieveUser(List<String> username, List<String> lastname, List<String> emailid,String dob,Integer zip);
	public int deleteUser(int id,User user) throws Exception;
	public String saveBMIiDAO(health h);
	public List retrieveUserHealthHistory(int id);
	public String saveCoachData(String name, String description);
	public List<Coach> getListofCoach();
}
