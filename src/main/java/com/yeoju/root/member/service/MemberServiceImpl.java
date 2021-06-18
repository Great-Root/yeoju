package com.yeoju.root.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.mybatis.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberDAO dao;
	
	public int user_check(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDTO dto = dao.user_check(request.getParameter("userId"));
		
		if(dto != null) {//아이디가 존재하는 경우
			if(request.getParameter("pw").equals(dto.getPw())) {//비밀번호가 일치하는 경우
				dao.recent_date(dto.getUserId());
				return 0;
			}else {//비밀번호가 일치하지 않는 경우
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
		}else{//아이디가 없는 경우
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		return 1;
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
	public void check_id(String userId, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(dao.check_id(userId));
		out.close();
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(dao.check_email(email));
		out.close();
	}
	
	
	@Override
	public int join_member(MemberDTO dto, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(dao.check_id(dto.getUserId())==1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}else if(dao.check_email(dto.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}else {
			System.out.println(dto.getUserId());
			dao.join_member(dto);
			dao.join_memberdetail(dto);
			return 1;
		}
	}




	@Override
	public void sendEmail(MemberDTO dto, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "hek3199@gmail.com";
		String hostSMTPpwd = "imshipass";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "hek3199@gmail.com";
		String fromName = "여주마켓 비밀번호 변경";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "여주마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += dto.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += dto.getPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = dto.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	




	@Override
	public void findPw(HttpServletRequest request, HttpServletResponse response, MemberDTO dto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberDTO ck = dao.user_check(dto.getUserId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(dao.user_check(dto.getUserId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!dto.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			dto.setPw(pw);
			// 비밀번호 변경
			dao.updatePw(dto);
			// 비밀번호 변경 메일 발송
			sendEmail(dto, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}





}
	
	


