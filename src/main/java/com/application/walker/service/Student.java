package com.application.walker.service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Student")
public class Student {

	@Column(name = "Name")
	private String name;
	@Column(name = "Branch")
	private String branch;
	@Column(name = "team")
	private String sportsTeam;
	
	@Id
	@Column(name = "identifier")
	private Integer identifier;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSportsTeam() {
		return sportsTeam;
	}
	public void setSportsTeam(String sportsTeam) {
		this.sportsTeam = sportsTeam;
	}
	public Integer getIdentifier() {
		return identifier;
	}
	public void setIdentifier(Integer identifier) {
		this.identifier = identifier;
	}
	
	
}
