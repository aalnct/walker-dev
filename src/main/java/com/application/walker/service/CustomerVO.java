/**
 * 
 */
package com.application.walker.service;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author AmitAgarwal
 *
 */
@Entity
@Table(name = "Honda_Customer_Details")
public class CustomerVO implements Serializable{
		
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		
		@Column(name = "UserName")
		private String emailAddress;
		
		@Column(name = "First_Name")
		private String firstName;
		
		@Column(name = "Last_Name")
		private String lastName;
		
		@Column(name = "password")
		private String password;
		
		@Column(name = "customer_id")
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		private Integer customerID;
		
		@OneToMany
		@ElementCollection
		private Set<AddressVO> address;
		
		public String getEmailId() {
			return emailAddress;
		}
		public void setEmailId(String emailID) {
			this.emailAddress = emailID;
		}
		public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		public String getLastName() {
			return lastName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public Integer getCustomerID() {
			return customerID;
		}
		public void setCustomerID(Integer customerID) {
			this.customerID = customerID;
		}
		public Set<AddressVO> getAddress() {
			return address;
		}
		public void setAddress(Set<AddressVO> address) {
			this.address = address;
		}
		
}
