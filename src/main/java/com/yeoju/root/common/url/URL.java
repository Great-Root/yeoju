package com.yeoju.root.common.url;

import java.io.File;

public class URL {
	//이미지 서버 경로
	protected static final String IMG_URL = "C:\\Spring\\yeoju\\";
	
//	protected static final String IMG_URL = "/home/ubuntu/img/";
	
	public String makeImgURL(String userId, String fileName) {
		String dirPath = IMG_URL+userId+"\\";
		new File(dirPath).mkdir();
		return dirPath+fileName;
	}
	
	public String getImgURL(String userId, String fileName) {
		return IMG_URL+userId+"\\"+fileName;
	}
}
