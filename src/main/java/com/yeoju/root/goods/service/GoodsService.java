package com.yeoju.root.goods.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.yeoju.root.common.dto.GoodsDTO;

public interface GoodsService {
	
	//01.상품목록
	public List<GoodsDTO> listGoods(int pageNo);

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

	//07.상품 게시글 전체 목록 => 검색옵션, 키워드 추가
	public List<GoodsDTO> listAll(String searchOption, String keyword) throws Exception;
	
	//08.게시글 갯수 
	int countArticle(String searchOption, String keyword) throws Exception;
}
