package com.yeoju.root.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.mybatis.MemberDAO;
import com.yeoju.root.mybatis.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired MyPageDAO dao;
	@Autowired MemberDAO mdao;
	
	@Override
	public ArrayList<GoodsDTO> sellGoods(){
		return dao.sellGoods();
	}

	@Override
	public void insertGoods(GoodsDTO dto) {
		dao.insertGoods(dto);
	}

	@Override
	public ArrayList<GoodsDTO> heartPage() {
		return dao.heartPage();
	}

	@Override
	public MemberDTO getUserInfo(String userId) {
		return mdao.getUserInfo(userId);
	}
	
}
