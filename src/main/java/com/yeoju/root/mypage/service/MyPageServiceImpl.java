package com.yeoju.root.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.mybatis.GoodsDAO;
import com.yeoju.root.mybatis.MemberDAO;
import com.yeoju.root.mybatis.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired MemberDAO mdao;
	@Autowired GoodsDAO gdao;
	
	@Override
	public ArrayList<GoodsDTO> sellGoods(String userId){
		return gdao.sellGoods(userId);
	}

	@Override
	public ArrayList<GoodsDTO> heartPage(String userId) {
		return gdao.heartPage(userId);
	}

	@Override
	public MemberDTO getUserInfo(String userId) {
		return mdao.getUserInfo(userId);
	}

}
