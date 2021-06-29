package com.yeoju.root.common.url;

import java.io.File;
import java.util.List;

import com.yeoju.root.common.dto.GoodsDTO;

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

	public List<GoodsDTO> listGoods(int pageNo, String searchOption, String keyword) throws Exception {
		return null;
	}
}
