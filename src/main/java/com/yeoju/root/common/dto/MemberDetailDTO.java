package com.yeoju.root.common.dto;

import java.sql.Date;

public class MemberDetailDTO {

	    // 도 / 시 
	    protected String addr1;

	    // 구 / 동 
	    protected String addr2;

	    // 상세주소 
	    protected String addr3;

	    // 0 : 여성 1 : 남성 
	    protected Integer gender;

	    // 생년월일 
	    protected Date birth;

	    protected String name;

	    protected String userId;

	    public String getAddr1() {
	        return addr1;
	    }

	    public void setAddr1(String addr1) {
	        this.addr1 = addr1;
	    }

	    public String getAddr2() {
	        return addr2;
	    }

	    public void setAddr2(String addr2) {
	        this.addr2 = addr2;
	    }

	    public String getAddr3() {
	        return addr3;
	    }

	    public void setAddr3(String addr3) {
	        this.addr3 = addr3;
	    }

	    public Integer getGender() {
	        return gender;
	    }

	    public void setGender(Integer gender) {
	        this.gender = gender;
	    }

	    public Date getBirth() {
	        return birth;
	    }

	    public void setBirth(Date birth) {
	        this.birth = birth;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getUserId() {
	        return userId;
	    }

	    public void setUserId(String userId) {
	        this.userId = userId;
	    }
	
}
