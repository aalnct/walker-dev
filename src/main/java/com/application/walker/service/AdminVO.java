/**
 * 
 */
package com.application.walker.service;

import java.io.Serializable;

/**
 * @author AmitAgarwal
 *
 */
public class AdminVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String emailID;
	private String password;
	
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
