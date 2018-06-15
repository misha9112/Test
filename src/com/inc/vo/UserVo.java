package com.inc.vo;

public class UserVo {
	private String id, password, name, phoneNum, addr, email;

	public UserVo(String id, String password, String name, String phoneNum, String addr, String email) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.phoneNum = phoneNum;
		this.addr = addr;
		this.email = email;
	}

	public UserVo() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
