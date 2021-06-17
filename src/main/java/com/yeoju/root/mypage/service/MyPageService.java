package com.yeoju.root.mypage.service;

import java.util.ArrayList;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;

public interface MyPageService {

	//판매중인 상품 리스트 가져오기
	public ArrayList<GoodsDTO> sellGoods(String userId);
	
	public ArrayList<GoodsDTO> heartPage(String userId);

	public MemberDTO getUserInfo(String userId);
	
}
