package com.yeoju.root.member.service;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.yeoju.root.common.dto.AdminDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.MemberDetailDTO;
import com.yeoju.root.mybatis.MemberDAO;
import com.yeoju.root.mybatis.MemberDetailDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberDAO dao;
	@Autowired MemberDetailDAO detaildao;
	
	public int user_check(HttpServletRequest request) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberDTO dto = dao.user_check(request.getParameter("userId"));
		if(dto != null) {
			if(encoder.matches(request.getParameter("pw"), dto.getPw()) ||
								request.getParameter("pw").equals(dto.getPw())) {
				return 0;
			}
		}
		return 1;
		
	}
	@Override
	public int register(MemberDTO dto) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("비밀번호 변경 전 : "+dto.getPw());
		String pw = encoder.encode(dto.getPw());
		System.out.println("암호화 후 : "+pw);
	
		dto.setPw(pw);
		dto.setLimitTime(new Date(System.currentTimeMillis()));
		dto.setSessionId("nan");
				
		System.out.println("userId : "+dto.getUserId());
		System.out.println("pw : "+dto.getPw());
		System.out.println("Tel : "+dto.getTel());
		try {
			return dao.register(dto);
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public void keepLogin(String sessionId, Date limitDate, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("userId", userId);
		dao.keepLogin(map);
	}
	
	@Override
	public MemberDTO getUserSessionId(String sessionId) {
		return dao.getUserSessionId(sessionId);
	}
	
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userId = dao.find_id(email);
		
		if (userId == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return userId;
		}
	}
	@Override
	public void memberList(Model model) {
		ArrayList<MemberDTO> list = dao.memberList();
		model.addAttribute("memberList", list);
		
	}
	public void memberInfo(Model model,String userId) {
		ArrayList<MemberDTO> list = dao.memberInfo(userId);
		model.addAttribute("memberInfo", list);
		
	}
	@Override
	public void detailList(Model model, String userId) {
		ArrayList<MemberDetailDTO> list = detaildao.detailList(userId);
		model.addAttribute("detailList", list);
		
	}
	
	

}

