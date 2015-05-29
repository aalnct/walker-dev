/**
 * 
 */
package com.application.walker.service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author AmitAgarwal
 *
 */

@Entity
@Table(name="State")
public class State {
		
	@Id
	@Column(name = "stateid")
	private String stateId;
	
	@Column(name = "stateName")
	private String stateName;

	public String getStateId() {
		return stateId;
	}

	public void setStateId(String stateId) {
		this.stateId = stateId;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	
	
	
	
}
