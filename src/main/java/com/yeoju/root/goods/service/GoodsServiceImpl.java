package com.yeoju.root.goods.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.HeartDTO;
import com.yeoju.root.common.url.URL;
import com.yeoju.root.mybatis.GoodsDAO;

@Service
public class GoodsServiceImpl extends URL implements GoodsService {
	
	@Autowired
	GoodsDAO goodsDao;
	
	//01.상품목록
	@Override
	public List<GoodsDTO> listGoods(int pageNo){
		return goodsDao.listGoods(pageNo);
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
	public boolean updateGoods(GoodsDTO dto) {
		return goodsDao.updateGoods(dto) == 1 ? true : false;
	}
	//05.상품삭제	
	@Override
	public void deleteGoods(int goodsId) {
		goodsDao.deleteGoods(goodsId);
	}

	//06.상품이미지 삭제를 위한 이미지파일 정보
	@Override
	public String imgFileName(int goodsId) {
		return goodsDao.imgFileName(goodsId);
	}
	
	// 찜버튼 클릭
	@Override
	public boolean heart(HeartDTO dto) {
		boolean result;
		if(isheart(dto)){
			goodsDao.deleteHeart(dto);
			result = false;
		}else {
			goodsDao.insertHeart(dto);
			result = true;
		}
		return result;
	}
	
	// 해당상품 찜 총 갯수 구하기
	@Override
	public int heartTotalCnt(int goodsId) {
		return goodsDao.heartTotalCnt(goodsId);
	}
	
	// 찜버튼 활성화여부
	@Override
	public boolean isheart(HeartDTO dto) {
		return goodsDao.heartCnt(dto) == 0 ? false : true;
	}
}
