package com.yeoju.root.goods.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.url.URL;
import com.yeoju.root.mybatis.GoodsDAO;

@Service
public class GoodsServiceImpl extends URL implements GoodsService {
	
	@Autowired
	GoodsDAO goodsDao;
	
	//01.상품목록
	@Override
	public List<GoodsDTO> listGoods(){
		return goodsDao.listGoods();
	}
	//02.상품상세
		@Override
	public GoodsDTO detailGoods(int goodsId) {
		return goodsDao.detailGoods(goodsId);
	}
	//03.상품추가
	@Override
	public boolean insertGoods(GoodsDTO dto) {
		return goodsDao.insertGoods(dto) == 1 ? true : false;
	}
	//04.상품수정
	@Override
	public void updateGoods(GoodsDTO dto) {
		goodsDao.updateGoods(dto);
	}
//	//05.상품삭제	
//	@Override
//	public void deleteGoods(int goodsId) {
//		goodsDao.deleteGoods(goodsId);
//	}
//
//	//06.상품이미지 삭제를 위한 이미지파일 정보
//	@Override
//	public String fileInfo(int goodsId) {
//		return goodsDao.fileInfo(goodsId);
//	}
//	
	@Override
	public String fileProcess(MultipartFile file,String userId) {
		String result = "NO";
		String[] type = file.getContentType().split("/");
		
		if(!file.isEmpty() && file.getContentType().contains("image")) {
			SimpleDateFormat sim = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calendar = Calendar.getInstance();
			String sysFileName = sim.format(calendar.getTime())+file.getOriginalFilename().replaceAll(" ", "").hashCode()+"."+type[1];
			// makeImgURL : URL클래스에서 사용자 디렉토리 생성후 URL값 생성
			String filePath = makeImgURL(userId, sysFileName);
			File saveFile = new File(filePath);
			try {
				file.transferTo(saveFile);
				result = sysFileName;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
