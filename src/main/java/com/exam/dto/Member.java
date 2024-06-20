package com.exam.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;

@Alias("Member")
public class Member {

	@NotBlank(message = "적어도 한글이상")
	String userid;
	
	String passwd;
	
	@NotBlank(message = "적어도 한글이상")
	String username;
	
	public Member() {}

    
	public Member(String userid, String passwd, String username) {
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	@Override
	public String toString() {
		return "Member [userid=" + userid + ", passwd=" + passwd + ", username=" + username + "]";
	}

}
