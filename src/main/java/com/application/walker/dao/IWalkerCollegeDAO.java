/**
 * 
 */
package com.application.walker.dao;

import com.application.walker.college.service.Faculty;

/**
 * @author AmitAgarwal
 *
 */
public interface IWalkerCollegeDAO {
	
	/*
	 * get faculty as parameter and save the information in database
	 */
	public void saveFacultyData(Faculty faculty);
	
	/*
	 * search based on faculty email address
	 */
	public void searchFacultyDetails(String emailAddress);

}
