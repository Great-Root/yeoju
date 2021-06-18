package com.yeoju.root.mypage.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;

public interface MyPageService {

	//판매중인 상품 리스트 가져오기
	public ArrayList<GoodsDTO> sellGoods();
	
	//상품 등록하기
	public void insertGoods(GoodsDTO dto);

	public ArrayList<GoodsDTO> heartPage();

	public MemberDTO getUserInfo(String userId);
	
	public MemberDTO modify(MemberDTO dto) throws Exception;
	
	public boolean delete(MemberDTO dto, HttpServletResponse response) throws Exception;
	
}
