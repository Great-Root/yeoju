package com.yeoju.root.member.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.yeoju.root.common.dto.MemberDTO;


public interface MemberService {
	public int user_check(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void check_id(String userId, HttpServletResponse response) throws Exception;
	public void check_email(String email, HttpServletResponse response) throws Exception;
	//public int register(MemberDTO dto, HttpServletResponse response) throws Exception;
	public int join_member(MemberDTO dto, HttpServletResponse response) throws Exception;
	public void keepLogin(String sessionId, Date limitDate, String id);
	public MemberDTO getUserSessionId(String sessionId);
	public String find_id(HttpServletResponse response, String email) throws Exception;
	//이메일발송
	public void sendEmail(MemberDTO dto, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletRequest request, HttpServletResponse response, MemberDTO dto) throws Exception;
	
	//메일 발송
//	public String create_key() throws Exception;
//	public void send_mail(MemberDTO member) throws Exception;
//	public void approval_member(MemberDTO member, HttpServletResponse response) throws Exception;
	public void memberList(Model model);
	public void memberInfo(Model model,String userId);
	public void detailList(Model model, String userId);
}
