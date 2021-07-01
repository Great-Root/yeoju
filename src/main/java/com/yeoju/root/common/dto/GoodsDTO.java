package com.yeoju.root.common.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class GoodsDTO extends CategoryDTO{

	private Integer goodsId;

	private String goodsName;

	private String goodsInfo;

	private int goodsPrice;
	
	//조회수 카운트
	private Integer viewCount;

	// 등록한 사람
	private String userId;

	// sysdate
	private Timestamp regDate;

	// 0:판매중 1:매진
	private Integer soldOut;

	// 판매갯수 기본값 : 1
	private Integer howMany;

	// 이미지 파일
	private MultipartFile imgFile;
	
	// 이미지 파일 이름
	private String imgFileName;

	// 카테고리 코드
	private String categoryCode;
	
	//댓글 리스트
	private List<GoodsCommentsDTO> goodsCommentsList;
	
	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public List<GoodsCommentsDTO> getGoodsCommentsList() {
		return goodsCommentsList;
	}

	public void setGoodsCommentsList(List<GoodsCommentsDTO> goodsCommentsList) {
		this.goodsCommentsList = goodsCommentsList;
	}

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

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
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

	public MultipartFile getImgFile() {
		return imgFile;
	}

	public void setImgFile(MultipartFile img) {
		this.imgFile = img;
	}
	
	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
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
		this.imgFile = param.getImgFile();
		this.imgFileName = param.getImgFileName();
		this.categoryCode = param.getCategoryCode();
		this.goodsCommentsList = param.getGoodsCommentsList();
	}

	@Override
	public String toString() {
		return "GoodsDTO [goodsId=" + goodsId + ", goodsName=" + goodsName + ", goodsInfo=" + goodsInfo
				+ ", goodsPrice=" + goodsPrice + ", userId=" + userId + ", regDate=" + regDate + ", soldOut=" + soldOut
				+ ", howMany=" + howMany + ", imgFile=" + imgFile + ", imgFileName=" + imgFileName
				+ ", categoryCode=" + categoryCode + ", goodsCommentsList=" + goodsCommentsList+ "]";
	}

}
