package com.yeoju.root.member.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.yeoju.root.common.dto.MemberDTO;


public interface MemberService {
	public int user_check(HttpServletRequest request);
	public int register(MemberDTO dto);
	public void keepLogin(String sessionId, Date limitDate, String id);
	public MemberDTO getUserSessionId(String sessionId);
	public String find_id(HttpServletResponse response, String email) throws Exception;
	public void memberList(Model model);
	public void memberInfo(Model model,String userId);
	public void detailList(Model model, String userId);
}
