package com.yeoju.root.common.dto;

public class ProfileDTO {
	private String userId;
	private String imgName;
	private long imgSize;
	private String imgType;
	private byte[] imgData;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public long getImgSize() {
		return imgSize;
	}
	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	public byte[] getImgData() {
		return imgData;
	}
	public void setImgData(byte[] imgData) {
		this.imgData = imgData;
	}
	@Override
	public String toString() {
		return "ProfileDTO [userId=" + userId + ", imgName=" + imgName + ", imgSize=" + imgSize + ", imgType=" + imgType
				+ ", imgData=" + imgData.length + "]";
	}
}
