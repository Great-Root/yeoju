package com.yeoju.root.mybatis;

import java.util.ArrayList;

import com.yeoju.root.common.dto.GoodsDTO;

public interface MyPageDAO {

	// 판매중인 상품 가져오기
	public ArrayList<GoodsDTO> sellGoods();

	// 상품 등록
	public void insertGoods(GoodsDTO dto);

	public ArrayList<GoodsDTO> heartPage();

}
