/**
 * 
 */
package com.application.walker.service;

import java.io.Serializable;
import java.util.Date;

/**
 * @author AmitAgarwal
 *
 */
public class TransactionMasterVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer purchaseID;
	private Integer customerID;
	private Date TimeStamp;
	private String paymentMode;
	private Integer checkNumber;
	private String location;
	
	
	public Integer getPurchaseID() {
		return purchaseID;
	}
	public void setPurchaseID(Integer purchaseID) {
		this.purchaseID = purchaseID;
	}
	public Integer getCustomerID() {
		return customerID;
	}
	public void setCustomerID(Integer customerID) {
		this.customerID = customerID;
	}
	public Date getTimeStamp() {
		return TimeStamp;
	}
	public void setTimeStamp(Date timeStamp) {
		TimeStamp = timeStamp;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public Integer getCheckNumber() {
		return checkNumber;
	}
	public void setCheckNumber(Integer checkNumber) {
		this.checkNumber = checkNumber;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	

}
