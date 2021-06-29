package com.yeoju.root.mypage.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.ProfileDTO;
import com.yeoju.root.common.dto.goodsResultDTO;

public interface MyPageService {

	//판매중인 상품 리스트 가져오기
	public ArrayList<GoodsDTO> sellGoods(String userId, int pageNo);
	
	public ArrayList<GoodsDTO> heartPage(String userId, int pageNo);
	
	public ArrayList<GoodsDTO> soldoutGoods(String userId, int pageNo);

	public MemberDTO getUserInfo(String userId);
	
	public void modify(MemberDTO dto, HttpServletResponse response) throws Exception;
	
	public void delete(String pw, HttpServletResponse response, HttpServletRequest request);
	
	public void setProfileImg(MultipartFile file, HttpSession session);

	public File getProfileImg(String userId);

	public goodsResultDTO getGoodsResult(String userId);

	
}
