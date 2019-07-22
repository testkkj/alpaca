package com.alpaca.member;

import java.sql.Date;

public class memberVO {

	private String id;
	private String passWord;
	private String email;
	private String tel;
	private Date date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "memberVO [id=" + id + ", passWord=" + passWord + ", email=" + email + ", tel=" + tel + ", date=" + date
				+ "]";
	}

}
