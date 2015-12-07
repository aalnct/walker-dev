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
public class VehicleVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer purchaseID;
	private Integer vin_Number;
	private String auction_Location;
	private Integer workOrder;
	private Date paymentTimeStamp;
	
	public Integer getPurchaseID() {
		return purchaseID;
	}
	public void setPurchaseID(Integer purchaseID) {
		this.purchaseID = purchaseID;
	}
	public Integer getVin_Number() {
		return vin_Number;
	}
	public void setVin_Number(Integer vin_Number) {
		this.vin_Number = vin_Number;
	}
	public String getAuction_Location() {
		return auction_Location;
	}
	public void setAuction_Location(String auction_Location) {
		this.auction_Location = auction_Location;
	}
	public Integer getWorkOrder() {
		return workOrder;
	}
	public void setWorkOrder(Integer workOrder) {
		this.workOrder = workOrder;
	}
	public Date getPaymentTimeStamp() {
		return paymentTimeStamp;
	}
	public void setPaymentTimeStamp(Date paymentTimeStamp) {
		this.paymentTimeStamp = paymentTimeStamp;
	}
	
	
}
