package com.exam.entity;

public class Member {
	 private String userid;
	    private String password;
	    private String confirmPassword;
	    private String email;
	    private String address;

	    // Getters and Setters
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
