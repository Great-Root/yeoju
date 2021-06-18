package com.yeoju.root.mypage.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

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

	@Override
	public MemberDTO modify(MemberDTO dto) throws Exception {
		dao.modify(dto);
		dao.modifydetail(dto);
		return mdao.user_check(dto.getUserId());
	}

	@Override
	public boolean delete(MemberDTO dto, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(dao.delete(dto) != 1) {
			out.println("<script>");
			out.println("alert('회원탈퇴 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return false;
		}else {
			dao.deletedetail(dto);
			return true;
		}
	}
	
}
