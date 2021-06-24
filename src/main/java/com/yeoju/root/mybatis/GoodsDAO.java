package com.yeoju.root.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.HeartDTO;

public interface GoodsDAO {
	
	//01.상품목록
	public List<GoodsDTO> listGoods(
			@Param("pageNo") int pageNo, 
			@Param("searchOption") String searchOption, 
			@Param("keyword")String keyword
			) throws Exception;
	
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
	public ArrayList<GoodsDTO> sellGoods(	@Param("userId") String userId, 
											@Param("pageNo") int pageNo		);
	
	// 찜한 상품 가져오기
	public ArrayList<GoodsDTO> heartPage(String userId);

	public ArrayList<GoodsDTO> heartPage(	@Param("userId") String userId, 
											@Param("pageNo") int pageNo		);
	
	// 로그인 사용자가 해당상품을 찜했는지 여부확인
	public int heartCnt(HeartDTO dto);
	
	// 해당 상품의 찜 전체 갯수
	public int heartTotalCnt(int goodsId);

	// 찜등록
	public void insertHeart(HeartDTO dto);

	// 찜삭제
	public void deleteHeart(HeartDTO dto);
	

}
