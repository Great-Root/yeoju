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
	
	public int modify(MemberDTO dto) throws Exception;
	
	public int modifydetail(MemberDTO dto) throws Exception;
	
	public int delete(MemberDTO dto) throws Exception;
	
	public int deletedetail(MemberDTO dto) throws Exception;
}
