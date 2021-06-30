package com.yeoju.root.common.dto;

public class goodsResultDTO {
	// 전부 팔면 벌수 있는금액
	private int totalMoney;
	// 지금까지 판매한 금액
	private int getMoney;
	// 내가 찜한 갯수
	private int heartNum;
	// 찜한갯수에서 이미 판매된 갯수
	private int soldoutNum;
	// 찜한갯수에서 판매중인 갯수
	private int sellingNum;
	// 찜한 상품 구매에 필요한 금액
	private int needMoney;
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getGetMoney() {
		return getMoney;
	}
	public void setGetMoney(int getMoney) {
		this.getMoney = getMoney;
	}
	public int getHeartNum() {
		return heartNum;
	}
	public void setHeartNum(int heartNum) {
		this.heartNum = heartNum;
	}
	public int getSoldoutNum() {
		return soldoutNum;
	}
	public void setSoldoutNum(int soldoutNum) {
		this.soldoutNum = soldoutNum;
	}
	public int getSellingNum() {
		return sellingNum;
	}
	public void setSellingNum(int sellingNum) {
		this.sellingNum = sellingNum;
	}
	public int getNeedMoney() {
		return needMoney;
	}
	public void setNeedMoney(int needMoney) {
		this.needMoney = needMoney;
	}
	
}
