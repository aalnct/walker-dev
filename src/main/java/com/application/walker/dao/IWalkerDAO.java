package com.application.walker.dao;


import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.application.walker.service.Coach;
import com.application.walker.service.User;
import com.application.walker.service.health;
@Component
@Repository
public interface IWalkerDAO {
	/*
	 * Add user and address at the same query
	 */
	public void addUser(User user);
	
	/*
	 * retrieve all user or based on the given criteria
	 */

	public Set<User> retrieveUser(List<String> username, List<String> lastname, List<String> emailid,String dob,Integer zip);
	
	/*
	 * delete user based on the given user id
	 */
	public int deleteUser(int id,User user) throws Exception;
	
	/*
	 * Save user bmi information, command name health object
	 */
	public String saveBMIiDAO(health h);
	
	/*
	 * Will check if user have any health history, will take user id as parameter 
	 */
	public List retrieveUserHealthHistory(int id);
	
	/*
	 * save coach information. making check if coach id already exists than don;t save as coach already exists.
	 */
	
	public String saveCoachData(String name, String coachEmailId, String description);
	
	/*
	 * Getting list of coach from database
	 */
	public List<Coach> getListofCoach();
	
	/*
	 * Assigning coach to user. But before that check if coach exists in our database
	 */
	
	public String assignCoachtoUser(String coachName, String coachEmailid, String userName, String userEmailId);
	
	/*
    * We are retrieving user information based on id, to update it  	
    */
	
	public User retrieveUserInformationForUpdate(Integer id);
	
	
}
