package com.yeoju.root.mypage.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeoju.root.common.components.Components;
import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.mybatis.GoodsDAO;
import com.yeoju.root.mybatis.MemberDAO;
import com.yeoju.root.mybatis.MemberDetailDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired Components comp;
	@Autowired MemberDAO mdao;
	@Autowired GoodsDAO gdao;
	@Autowired MemberDetailDAO mdDAO;
	
	@Override
	public ArrayList<GoodsDTO> sellGoods(String userId, int pageNo){
		return gdao.sellGoods(userId,pageNo);
	}

	@Override
	public ArrayList<GoodsDTO> heartPage(String userId, int pageNo) {
		return gdao.heartPage(userId,pageNo);
	}

	@Override
	public MemberDTO getUserInfo(String userId) {
		return mdao.getUserInfo(userId);
	}

	@Override
	public void modify(MemberDTO dto, HttpServletResponse response) throws Exception {
		if(mdDAO.modify(dto) == 1) {
			if(mdDAO.cnt(dto.getUserId()) == 0) {
				mdDAO.insertDetail(dto);
			}else {
				mdDAO.modifyDetail(dto);
			}
			comp.sendAlertAndHref(response, "회원정보를 성공적으로 수정하였습니다","/");
		}else {
			comp.sendAlertAndBack(response, "회원정보 수정에 실패했습니다");
		}
	}

	@Override
	public boolean delete(MemberDTO dto, HttpServletResponse response) throws Exception {
		if(mdDAO.deleteDetail(dto) != 1) {
			comp.sendAlertAndBack(response, "회원탈퇴 실패");
			return false;
		}else {
			if(mdDAO.delete(dto) != 1) {
				comp.sendAlertAndBack(response, "회원탈퇴 실패");
				return false;
			}else {
				
				return true;
			}
		}
	}
	
}
