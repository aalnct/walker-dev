/**
 * 
 */
package com.application.walker.service;

import java.io.Serializable;

/**
 * @author AmitAgarwal
 *
 */
public class CheckInformationVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer purchaseID;
	private Integer checkNumber;
	private Integer amountPaid;
	private Integer paymentID;
	
	
	public Integer getPurchaseID() {
		return purchaseID;
	}
	public void setPurchaseID(Integer purchaseID) {
		this.purchaseID = purchaseID;
	}
	public Integer getCheckNumber() {
		return checkNumber;
	}
	public void setCheckNumber(Integer checkNumber) {
		this.checkNumber = checkNumber;
	}
	public Integer getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(Integer amountPaid) {
		this.amountPaid = amountPaid;
	}
	public Integer getPaymentID() {
		return paymentID;
	}
	public void setPaymentID(Integer paymentID) {
		this.paymentID = paymentID;
	}
	
	
}
