package com.exam.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;

@Alias("Member")
public class Member {
	  @NotEmpty(message = "아이디는 필수 입력 값입니다.")
	    private String userid;

	    @NotEmpty(message = "비밀번호는 필수 입력 값입니다.")
	    private String password;

	    @NotEmpty(message = "비밀번호 확인은 필수 입력 값입니다.")
	    private String confirmPassword;

	    @Email(message = "올바른 이메일 형식이 아닙니다.")
	    @NotEmpty(message = "이메일은 필수 입력 값입니다.")
	    private String email;

	    @NotEmpty(message = "주소는 필수 입력 값입니다.")
	    private String address;
	    
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
	@Override
	public String toString() {
		return "Member [userid=" + userid + ", password=" + password + ", confirmPassword=" + confirmPassword
				+ ", email=" + email + ", address=" + address + "]";
	}


}
