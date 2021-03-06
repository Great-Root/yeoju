package com.yeoju.root.member.controller;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.yeoju.root.board.service.BoardService;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;
import com.yeoju.root.member.login.NaverLoginBO;
import com.yeoju.root.member.service.MemberService;
import com.yeoju.root.member.session_name.MemberSessionName;
@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{
	
	@Autowired BoardService bs;
	@Autowired MemberService ms;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session, HttpServletRequest request) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("?????????:" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return session.getAttribute(LOGIN) == null ? "member/login" : "redirect:/";
	}
	 
		@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws Exception {
			System.out.println("????????? callback");
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			apiResult = naverLoginBO.getUserProfile(oauthToken); //String????????? json?????????
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			String nickname = (String)response_obj.get("nickname");
			String id = (String)response_obj.get("id");
			String email = (String)response_obj.get("email");
			System.out.println(nickname+id);
			MemberDTO dto = new MemberDTO();
			dto.setEmail(email);
			dto.setPw(id);
			ms.joinNaverLogin(dto, session);
			model.addAttribute("result", apiResult);
			System.out.println(apiResult);
			return "redirect:/";
		}
		
	// ?????? ?????? ??? ??????
	@RequestMapping(value = "/memberJoinForm.do")
	public String memberJoinForm(HttpSession session, HttpServletRequest request) throws Exception{
		return session.getAttribute(LOGIN) == null ? "member/memberJoinForm" : "redirect:/";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session , HttpServletResponse response, HttpServletRequest request,
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
	
	
	// ????????? ?????? ???
		@GetMapping("/find_id_form.do")
		public void find_id_form() throws Exception{
		}
		
	// ????????? ??????
		@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
		public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model model) throws Exception{
			model.addAttribute("userId", ms.find_id(response, email));
			return "member/find_id";
		}
		/* ???????????? ?????? */
		@RequestMapping(value = "/findpw", method = RequestMethod.GET)
		public void findPwGET() throws Exception{
		}
		@RequestMapping(value = "/findpw", method = RequestMethod.POST)
		public void findPwPOST(@ModelAttribute MemberDTO dto, HttpServletResponse response, HttpServletRequest request) throws Exception{
			ms.findPw(request, response, dto);
		}
		
		
		// ????????? ?????? ??????(AJAX)
		@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
		public void check_id(@RequestParam("userId") String userId, HttpServletResponse response) throws Exception{
			ms.check_id(userId, response);
		}
		
		@PostMapping("/user_check")
		public void user_check(	HttpServletRequest request, HttpServletResponse response) throws Exception {
			ms.user_check(request, response);
		}
		
		// ????????? ?????? ??????(AJAX)
		@RequestMapping(value = "/check_email.do", method = RequestMethod.POST)
		public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
			ms.check_email(email, response);
		}
		
		// ?????? ??????
		@RequestMapping(value = "/join_member.do", method = RequestMethod.POST)
		public void join_member(MemberDTO dto, HttpServletResponse response,HttpServletRequest request) throws Exception{
			ms.join_member(dto, response,request);
		}
	
		@GetMapping("/qnaBoardView")
		public String qnaBoardView(Model model,
				@RequestParam(value="qnanum",required = false,defaultValue = "1") int qnanum) {
			bs.QnABoardList(model,qnanum);
			return "member/qnaBoardView";
		}
		@GetMapping("/annBoardView")
		public String annBoardView(Model model,@RequestParam(value="annnum",required = false,defaultValue = "1")int annnum) {
			bs.AnnBoardList(model,annnum);
			return "member/annBoardView";
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
			bs.QnABoardView(writeNo,model);
			return "member/qnaview";
		}
		@GetMapping("QnaModifyForm")
		public String QnaModifyForm(@RequestParam int writeNo, Model model) {
			bs.QnABoardView(writeNo,model);
			return "board/QnaModifyForm";
		}
		@PostMapping("modify")
		public String modify(MultipartHttpServletRequest mul,
							HttpServletRequest request )throws Exception {
			bs.modify(mul, request);
			return "redirect:qnaBoardView";
		}
		@PostMapping("QnABoardDelete")
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
		@GetMapping("annview")
		public String annview(@RequestParam int writeNo, Model model,HttpSession session) {
			session.setAttribute("writeNo", writeNo);
			bs.annBoardView(writeNo,model);
			return "member/annview";
		}
}