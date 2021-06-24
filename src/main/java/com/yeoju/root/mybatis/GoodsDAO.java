package com.yeoju.root.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yeoju.root.common.dto.GoodsDTO;

public interface GoodsDAO {
	
	//01.상품목록
	public List<GoodsDTO> listGoods(int pageNo);
	
	//02.상품상세
	public GoodsDTO detailGoods(int goodsId);
	
	//03.상품수정
	public int updateGoods(GoodsDTO dto);
	
	//04.상품삭제
	public void deleteGoods(int goodsId);
	
	//05.상품추가
	public int insertGoods(GoodsDTO dto);

	//06.상품이미지 삭제를 위한 이미지파일 정보
	public String imgFileName(int goodsId);
	
	// 판매중인 상품 가져오기
	public ArrayList<GoodsDTO> sellGoods(String userId);
	
	// 찜한 상품 가져오기
	public ArrayList<GoodsDTO> heartPage(String userId);


	//07.전체목록 01.써도되는지?
	public List<GoodsDTO> listAll(String searchOption, String keyword) throws Exception;

	//08.게시글 갯수
	public int countArticle(String searchOption, String keyword) throws Exception;

	
	

}
