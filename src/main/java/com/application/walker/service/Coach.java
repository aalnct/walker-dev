package com.application.walker.service;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Columns;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "coach")
public class Coach {
	
	@Transient
	private String message;
	
	@Id
	@GeneratedValue
	@Column(name="coach_id",nullable=false)
	private int coachid;
	
	
	@Column(name="name",nullable=false)
	private String name;
	
	
	@Column(name="userId",nullable=false)
	private int userId;
	
	@Column(name="description")
	private String description;
	
	@Column(name="coach_email",nullable=false)
	private String coachEmailId;
	
	public String getCoachEmailId() {
		return coachEmailId;
	}

	public void setCoachEmailId(String coachEmailId) {
		this.coachEmailId = coachEmailId;
	}

	@OneToMany(mappedBy="coach",fetch=FetchType.LAZY)
	//this enables the lazy loading (it is enabled by default)
	@Fetch(FetchMode.SELECT)
	private List<User> user;
	
	public int getId() {
		return coachid;
	}

	public void setId(int id) {
		this.coachid = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
