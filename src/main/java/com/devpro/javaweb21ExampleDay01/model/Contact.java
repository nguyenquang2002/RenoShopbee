package com.devpro.javaweb21ExampleDay01.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity{
	@Column(name = "full_name", length = 45, nullable = false)
	String fullName;
	@Column(name = "email", length = 45, nullable = false)
	String email;
	@Column(name = "subject", length = 45, nullable = true)
	String subject;
	@Column(name = "message", length = 1000, nullable = false)
	String message;

	

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
