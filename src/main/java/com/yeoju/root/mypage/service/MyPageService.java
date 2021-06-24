package com.yeoju.root.mypage.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;

public interface MyPageService {

	//판매중인 상품 리스트 가져오기
	public ArrayList<GoodsDTO> sellGoods(String userId, int pageNo);
	
	public ArrayList<GoodsDTO> heartPage(String userId, int pageNo);

	public MemberDTO getUserInfo(String userId);
	
	public MemberDTO modify(MemberDTO dto) throws Exception;
	
	public boolean delete(MemberDTO dto, HttpServletResponse response) throws Exception;
	
}
