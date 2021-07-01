package com.yeoju.root.common.dto;

public class SearchDTO {
	private int pageNo;
	private String keyword;
	private String searchOption;
	private String soldOutView;
	private String categoryCode;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSoldOutView() {
		return soldOutView;
	}
	public void setSoldOutView(String soldOutView) {
		this.soldOutView = soldOutView;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	@Override
	public String toString() {
		return "SearchDTO [pageNo=" + pageNo + ", keyword=" + keyword + ", searchOption=" + searchOption
				+ ", soldOutView=" + soldOutView + ", categoryCode=" + categoryCode + "]";
	}
	
}
