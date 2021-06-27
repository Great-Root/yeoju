package com.yeoju.root.common.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO extends MemberDetailDTO{

	private String userId;

	private String pw;

	// sysdate
	private Date regDate;

	// 이미지 경로
	private MultipartFile profileImg;

	// 이메일 주소
	private String email;
	
	//최근 활동일
	private Date recentDate;
	
	private Date limitTime;

	private String sessionId;

	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Date getRecentDate() {
		return recentDate;
	}

	public void setRecentDate(Date recentDate) {
		this.recentDate = recentDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public MultipartFile getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(MultipartFile profileImg) {
		this.profileImg = profileImg;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	// Member 모델 복사
	public void CopyData(MemberDTO param) {
		this.userId = param.getUserId();
		this.pw = param.getPw();
		this.regDate = param.getRegDate();
		this.profileImg = param.getProfileImg();
		this.email = param.getEmail();
		//Member Detail DTO
		this.addr1 = param.getAddr1();
        this.addr2 = param.getAddr2();
        this.addr3 = param.getAddr3();
        this.gender = param.getGender();
        this.birth = param.getBirth();
        this.name = param.getName();
        this.userId = param.getUserId();
        this.tel = param.getTel();
	}

	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", pw=" + pw + ", tel=" + tel + ", regDate=" + regDate + ", profileImg="
				+ profileImg + ", email=" + email + ", recentDate=" + recentDate + ", limitTime="
				+ limitTime + ", sessionId=" + sessionId + "]" +
				"\nMemberDetailDTO [addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", gender=" + gender
				+ ", birth=" + birth + ", name=" + name + ", userId=" + userId + "]";
	}
	

}
