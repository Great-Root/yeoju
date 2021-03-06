package com.yeoju.root.goods.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.yeoju.root.common.dto.GoodsCommentsDTO;
import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.HeartDTO;
import com.yeoju.root.common.dto.SearchDTO;

public interface GoodsService {
	
	//01.상품목록
	public List<GoodsDTO> listGoods(SearchDTO search);

	//02.상품상세
	public GoodsDTO detailGoods(int goodsId);
		
	//03.상품수정
	public boolean updateGoods(GoodsDTO dto);
		
	//04.상품삭제
	public void deleteGoods(int goodsId);
		
	//05.상품추가
	public boolean insertGoods(GoodsDTO dto);
	
	//06.상품이미지 삭제를 위한 이미지파일 정보
	public String imgFileName(int goodsId);
	
	//07.조회수 카운트
	public void viewCount(int goodsId);

	//댓글 조회
	public List<GoodsCommentsDTO> redaReply(int goods_id);
	public boolean heart(HeartDTO dto);
	public int heartTotalCnt(int goodsId);
	public boolean isheart(HeartDTO dto);
	

	public boolean isYours(String loginUser, int goodsId);

	public void soldOut(int goodsId);

	public boolean isSoldOut(int goodsId);

	
	
}
