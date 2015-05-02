package com.application.walker.service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="health",catalog="walker")
public class health {
		
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int health_id;
		
		@Column(name="height")
		
		private double height;
		
		@Column(name="weight")
		private float weight;
		
		@Column(name="age")
		private int age;
		@Column(name="bmi")
		private float bmi;
		
		private int userId;

		public int getHealth_id() {
			return health_id;
		}

		public void setHealth_id(int health_id) {
			this.health_id = health_id;
		}

		public double getHeight() {
			return height;
		}

		public void setHeight(double height) {
			this.height = height;
		}

		public float getWeight() {
			return weight;
		}

		public void setWeight(float weight) {
			this.weight = weight;
		}

		public int getAge() {
			return age;
		}

		public void setAge(int age) {
			this.age = age;
		}
		
		public float getBmi() {
			return bmi;
		}

		public void setBmi(float bmi) {
			this.bmi = bmi;
		}

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}	
}
