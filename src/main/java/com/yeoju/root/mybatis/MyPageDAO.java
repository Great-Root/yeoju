package com.yeoju.root.mybatis;

import java.util.ArrayList;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;

public interface MyPageDAO {

	// 판매중인 상품 가져오기
	public ArrayList<GoodsDTO> sellGoods();

	// 상품 등록
	public void insertGoods(GoodsDTO dto);
	
	// 찜한 상품 가져오기
	public ArrayList<GoodsDTO> heartPage();
	

}
