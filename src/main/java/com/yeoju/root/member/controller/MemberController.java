package com.yeoju.root.member.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yeoju.root.board.service.BoardService;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;
import com.yeoju.root.member.service.MemberService;
import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mybatis.MemberDAO;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{
	
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired BoardService bs;
	@Autowired MemberService ms;
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto) {
		int result = ms.register(dto);
		if(result == 1) {
			return "redirect:login"; //성공
		}
		return "redirect:registerPage";//실패
	}
	
	@GetMapping("registerPage")
	public String registerpage() {
		return "member/register";
	}
	
	@PostMapping("/user_check")
	public String user_check(HttpServletRequest request, RedirectAttributes rs ) {
		int result = ms.user_check(request);
		if(result == 0) {
			rs.addAttribute("userId", request.getParameter("userId"));
			rs.addAttribute("autoLogin", request.getParameter("autoLogin"));
			return "redirect:/member/successLogin";
		}
		rs.addFlashAttribute("result",result);
		return "redirect:login";
	}
	
	
	@RequestMapping("/successLogin")
	public String successLogin(@RequestParam String userId,
			@RequestParam( value="autoLogin", required = false) String autoLogin,
								HttpSession session,
								HttpServletResponse response) {
		session.setAttribute(LOGIN, userId);
		session.setAttribute(GRADE, "0");
		System.out.println("id "+userId);
		if(autoLogin != null) {
			int limitTime = 60*60*24*90; //90일
			Cookie loginCookie = new Cookie("loginCookie", session.getId() );
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date());
			cal.add(Calendar.MONTH, 3);
			
			Date limitDate = new Date(cal.getTimeInMillis());
			ms.keepLogin(session.getId(), limitDate, userId);
		}
		return "member/successLogin";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session , HttpServletResponse response,
			@CookieValue(value="loginCookie", required = false) Cookie loginCookie) {
		if(session.getAttribute(LOGIN) != null) {
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				ms.keepLogin("nan", new Date(System.currentTimeMillis()),
									(String)session.getAttribute(LOGIN));
			}
			session.invalidate();
		}
		return "redirect:/";
	}	
	
	
	// 아이디 찾기 폼
		@RequestMapping("/find_id_form.do")
		public String find_id_form() throws Exception{
			return "/member/find_id_form";
		}
		
	// 아이디 찾기
		@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
		public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model model) throws Exception{
			model.addAttribute("userId", ms.find_id(response, email));
			return "/member/find_id";
		}
		@GetMapping("/qnaBoardView")
		public String qnaBoardView(Model model) {
			bs.QnABoardList(model);
			return "member/qnaBoardView";
		}
		@GetMapping("/writeForm")
		public String writeForm(Model model) {
			return "board/writeForm";
		}
		@PostMapping("writeSave")
		public String writeSave(MultipartHttpServletRequest mul,
								HttpServletRequest request
								,Model model) throws Exception{
			bs.writeSave(mul, request);
			return "redirect:qnaBoardView";
		}
		@GetMapping("qnaview")
		public String qnaview(@RequestParam int writeNo, Model model,HttpSession session) {
		
			session.setAttribute("writeNo", writeNo);
			bs.upHit(writeNo);
			bs.QnABoardView(writeNo,model);
			return "member/qnaview";
		}
		@GetMapping("QnABoardDelete")
		public String QnABoardDelete(@RequestParam int writeNo) {
			System.out.println(writeNo);
			bs.QnABoardDelete(writeNo);
			return "redirect:qnaBoardView";
		}
		@GetMapping(value="replyData/{write_group}",produces = "application/json; charset=utf-8")
		@ResponseBody
		public List<QnaBoardRepDTO> replyData(@PathVariable int write_group){
			return bs.getRepList(write_group);
		}
}
