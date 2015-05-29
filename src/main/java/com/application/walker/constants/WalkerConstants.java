/**
 * 
 */
package com.application.walker.constants;

/**
 * @author AmitAgarwal
 *
 */
public interface WalkerConstants {
	
	public static String SPACE = "";
	public static String USA_STATE_CONSTANTS = "U";
	public static String INDIA_STATE_CONSTANTS = "I";
	public static String ENGLAND_STATE_CONSTANTS = "E";
	
	public static String STUDENT_ACTIVE_STATUS = "A";
	public static String STUDENT_INACTIVE_STATUS = "NA";
	public static String STUDENT_SEMESTER_TOPPER = "Y";
	public static String STUDENT_YEAR_BACK = "YEARBACK";
	
	public static String COLLEGE_AFFILIATED_TO_UNIVERSITY = "collegeaffiliatedtouniversity";
	public static String DEEMED_UNIVERSITY = "Y";
	
	
	public static String FACULTY_INSERT_QUERY = "INSERT INTO Faculty " +
				"(Name, Department,Subjects, emailAddress) VALUES (?, ?, ?,?)";
	
	public static String FACULTY_SEARH_SQL = "select * from faculty where emailAddress = :emailAddress";
}
