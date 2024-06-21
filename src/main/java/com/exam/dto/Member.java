package com.exam.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;

@Alias("Member")
public class Member {
	String userid;
	String password;
	String confirmPassword;
	String email;
	String address;
	public Member(String userid, String password, String confirmPassword, String email, String address) {
		super();
		this.userid = userid;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.email = email;
		this.address = address;
	}
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}


}
