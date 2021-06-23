package com.yeoju.root.mypage.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

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
	@Autowired MyPageDAO mydao;
	
	@Override
	public ArrayList<GoodsDTO> sellGoods(String userId, int pageNo){
		System.out.println(userId +" : "+ pageNo);
		return gdao.sellGoods(userId,pageNo);
	}

	@Override
	public ArrayList<GoodsDTO> heartPage(String userId, int pageNo) {
		System.out.println(userId +" : "+pageNo);
		return gdao.heartPage(userId,pageNo);
	}

	@Override
	public MemberDTO getUserInfo(String userId) {
		return mdao.getUserInfo(userId);
	}

	@Override
	public MemberDTO modify(MemberDTO dto) throws Exception {
		mydao.modify(dto);
		mydao.modifydetail(dto);
		return mdao.user_check(dto.getUserId());
	}

	@Override
	public boolean delete(MemberDTO dto, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(mydao.delete(dto) != 1) {
			out.println("<script>");
			out.println("alert('회원탈퇴 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return false;
		}else {
			mydao.deletedetail(dto);
			return true;
		}
	}
	
}
