package com.yeoju.root.common.dto;

import java.sql.Date;

public class AdminDTO {
	private String id;

	private String pw;

	private String tel;
	
	private int grade;
	
	private Date regDate;
	
	private Date recentDate;
	
	private int recentAct;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}



	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getRecentDate() {
		return recentDate;
	}

	public void setRecentDate(Date recentDate) {
		this.recentDate = recentDate;
	}

	public int getRecentAct() {
		return recentAct;
	}

	public void setRecentAct(int recentAct) {
		this.recentAct = recentAct;
	}
	

	
}
