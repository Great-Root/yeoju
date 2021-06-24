package com.yeoju.root.common.dto;

import java.sql.Date;

public class HeartDTO {
	private String userId;
	private int goodsId;
	private Date regDate;
	
	
	public HeartDTO(String userId, int goodsId) {
		this.userId = userId;
		this.goodsId = goodsId;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
