package com.yeoju.root.mypage.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.yeoju.root.common.components.Components;
import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.ProfileDTO;
import com.yeoju.root.common.dto.goodsResultDTO;
import com.yeoju.root.goods.controller.GoodsController;
import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mybatis.GoodsDAO;
import com.yeoju.root.mybatis.MemberDAO;
import com.yeoju.root.mybatis.MemberDetailDAO;
import com.yeoju.root.mybatis.ProfileDAO;

@Service
public class MyPageServiceImpl implements MyPageService, MemberSessionName{

	@Autowired Components comp;
	@Autowired MemberDAO mdao;
	@Autowired GoodsDAO gdao;
	@Autowired MemberDetailDAO mdDAO;
	@Autowired ProfileDAO pDAO;
	@Autowired GoodsController gc;
	
	@Override
	public ArrayList<GoodsDTO> sellGoods(String userId, int pageNo){
		return gdao.sellGoods(userId,pageNo);
	}

	@Override
	public ArrayList<GoodsDTO> heartPage(String userId, int pageNo) {
		return gdao.heartPage(userId,pageNo);
	}
	@Override
	public ArrayList<GoodsDTO> soldoutGoods(String userId, int pageNo) {
		return gdao.soldoutGoods(userId,pageNo);
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
	@Transactional
	public void delete(String pw, HttpServletResponse response, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			String loginUser = (String)session.getAttribute(LOGIN);
			ArrayList<Integer> list = gdao.getUserTotalGoods(loginUser);
			for (Integer goodsId : list) {
				gdao.deleteAllHeartGoodsId(goodsId);
				gc.delete(goodsId);
			}
			MemberDTO dto = mdao.getUserInfo(loginUser);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(encoder.matches(pw, dto.getPw())) {
				gdao.deleteAllHeart(loginUser);
				pDAO.deleteProfileImg(loginUser);
				if(mdDAO.cnt(loginUser) != 0) {
					mdDAO.deleteDetail(loginUser);
				}
				mdDAO.delete(loginUser);
				comp.sendAlertAndReplace(response, "회원탈퇴 완료", request.getContextPath()+"/member/logout");
			}else {
				comp.sendAlertAndBack(response, "회원탈퇴 실패 : 비밀번호가 일치하지 않습니다");
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			comp.sendAlertAndBack(response, "회원탈퇴 실패 : 에러가 났습니다");
			e.printStackTrace();
		}
	}
	
	@Override
	public void setProfileImg(MultipartFile file, HttpSession session) {
		if(!file.isEmpty() && file.getContentType().contains("image")) {
			String loginUser = (String) session.getAttribute(LOGIN);
			String originalFileName = file.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			String uuid = UUID.randomUUID().toString();	//UUID 구하기
			ProfileDTO dto = new ProfileDTO();
			dto.setUserId(loginUser);
			dto.setImgName(uuid);
			dto.setImgSize(file.getSize());
			dto.setImgType(ext);
			try {
				dto.setImgData(file.getBytes());
				if(pDAO.imgCount(loginUser) != 0) {
					pDAO.deleteProfileImg(loginUser);
				}
				pDAO.insertProfileImg(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public File getProfileImg(String userId) {
		File file = null;
		if(pDAO.imgCount(userId) != 0) {
			ProfileDTO dto = pDAO.getProfileImg(userId);
			if(dto.getImgName() != null) {
				try {
					file = File.createTempFile(dto.getImgName(), dto.getImgType());
					FileUtils.writeByteArrayToFile(file, dto.getImgData());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return file;
	}
	@Override
	public goodsResultDTO getGoodsResult(String userId) {
		goodsResultDTO dto = new goodsResultDTO();
		dto.setTotalMoney(gdao.getTotalMoney(userId));
		dto.setGetMoney(gdao.getGetMoney(userId));
		dto.setHeartNum(gdao.getHeartNum(userId));
		dto.setSoldoutNum(gdao.getSoldoutNum(userId));
		dto.setSellingNum(gdao.getSellingNum(userId));
		dto.setNeedMoney(gdao.getNeedMoney(userId));
		return dto;
	}
	
}
