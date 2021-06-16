package com.yeoju.root.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yeoju.root.common.dto.GoodsDTO;

public interface GoodsDAO {
	
	//01.상품목록
	public List<GoodsDTO> listGoods();
	
//	//02.상품상세
//	//GoodsDTO detailGoods(int goodsId);
//	public GoodsDTO detailGoods(int goodsId);
//	
//	//03.상품수정
//	//void updateGoods(GoodsDTO dto);
//	public void updateGoods(GoodsDTO dto);
//	
//	//04.상품삭제
//	//void deleteGoods(int goodsId);
//	public void deleteGoods(int goodsId);
//	
//	//05.상품추가
//	public void insertGoods(GoodsDTO dto);
//	
//	//06.상품이미지 삭제를 위한 이미지파일 정보
//	public String fileInfo(int goodsId);
//	

}
