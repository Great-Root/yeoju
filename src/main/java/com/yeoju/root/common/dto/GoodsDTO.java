package com.yeoju.root.common.dto;

import java.sql.Date;

public class GoodsDTO {

	private Integer goodsId;

	private String goodsName;

	private String goodsInfo;

	private String goodsPrice;

	// 등록한 사람
	private String userId;

	// sysdate
	private Date regDate;

	// 0:판매중 1:매진
	private Integer soldOut;

	// 판매갯수 기본값 : 1
	private Integer howMany;

	// 이미지 경로(최대 5개))
	private String img;

	// 카테고리 코드
	private String categoryCode;

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsInfo() {
		return goodsInfo;
	}

	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}

	public String getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Integer getSoldOut() {
		return soldOut;
	}

	public void setSoldOut(Integer soldOut) {
		this.soldOut = soldOut;
	}

	public Integer getHowMany() {
		return howMany;
	}

	public void setHowMany(Integer howMany) {
		this.howMany = howMany;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	// Goods 모델 복사
	public void CopyData(GoodsDTO param) {
		this.goodsId = param.getGoodsId();
		this.goodsName = param.getGoodsName();
		this.goodsInfo = param.getGoodsInfo();
		this.goodsPrice = param.getGoodsPrice();
		this.userId = param.getUserId();
		this.regDate = param.getRegDate();
		this.soldOut = param.getSoldOut();
		this.howMany = param.getHowMany();
		this.img = param.getImg();
		this.categoryCode = param.getCategoryCode();
	}

}
