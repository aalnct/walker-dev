/**
 * 
 */
package com.application.walker.college.service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.application.walker.service.Student;

/**
 * @author AmitAgarwal
 *
 */
@Entity
@Table(name="accessories")
public class Accessories {
	
	@Id
	private int id;
	
	//@Column(name = "studentID")
	//@ManyToOne
	private Student student;
	
	@Column(name = "schoolTshirt")
	private String schoolTShirt;
	
	@Column(name = "schoolBag")
	private String schoolBag;
	
	@Column(name = "schoolTie")
	private String schoolTie;
	
	@Column(name = "schoolDress")
	private String schoolDress;

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getSchoolTShirt() {
		return schoolTShirt;
	}

	public void setSchoolTShirt(String schoolTShirt) {
		this.schoolTShirt = schoolTShirt;
	}

	public String getSchoolBag() {
		return schoolBag;
	}

	public void setSchoolBag(String schoolBag) {
		this.schoolBag = schoolBag;
	}

	public String getSchoolTie() {
		return schoolTie;
	}

	public void setSchoolTie(String schoolTie) {
		this.schoolTie = schoolTie;
	}

	public String getSchoolDress() {
		return schoolDress;
	}

	public void setSchoolDress(String schoolDress) {
		this.schoolDress = schoolDress;
	}
	
	

}
