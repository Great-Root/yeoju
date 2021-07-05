package com.yeoju.root.admin.controller;

import java.sql.Date;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yeoju.root.admin.service.AdminService;
import com.yeoju.root.board.service.BoardService;
import com.yeoju.root.common.dto.AdminDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;
import com.yeoju.root.member.service.MemberService;
import com.yeoju.root.member.session_name.MemberSessionName;

@Controller
@RequestMapping("admin")
public class AdminController implements MemberSessionName{
	String recentAct;
	@Autowired AdminService as;
	@Autowired MemberService ms;
	@Autowired BoardService bs;
	@GetMapping
	public String adminLogin() {
		return "admin/adminlogin";
	}
	@GetMapping("adminlogin")
	public String adminlogin() {
		return "admin/adminlogin";
	}
	@PostMapping("admin_check")
	public String user_check(HttpServletRequest request, RedirectAttributes rs ) {
		int result = as.admin_check(request);
		if(result == 0) {
			rs.addAttribute("id", request.getParameter("id"));
			return "redirect:/admin/successlogin";
		}
		rs.addFlashAttribute("result",result);
		return "redirect:adminlogin";
	}
	
	@RequestMapping("/successlogin")
	public String successLogin(@RequestParam String id,
								HttpSession session
								) {
		
		session.setAttribute(LOGIN, id);
		session.setAttribute(GRADE, "1");
	
			
		return "admin/successlogin";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session,HttpServletRequest request) {
			session.invalidate();
		return "redirect:/";
	}	
	
	@GetMapping("adminlist")
	public String adminlist(Model model) {
		as.adminList(model);
		return "admin/adminlist";
		}
	@GetMapping("adminjoin_form")
	public String adminjoin_form() {
		return "admin/adminjoin";
		}
	@PostMapping("adminjoin")
	public String adminjoin(AdminDTO dto) {
		int result = as.adminJoin(dto);
		if(result==1) {
			return "redirect:adminlist";
		}
		return "redirect:adminjoin_form";
	}
	@GetMapping("admindel")
	public String admindel(Model model) {
		as.adminList(model);
		return "admin/admindel";
		}
	@PostMapping("admindelete")
	public String admindelete(AdminDTO dto) {
		int result = as.adminDelete(dto);
		if(result==1) {
			return "redirect:adminlist";
		}
		return "redirect:admindel";
	}
	
	@GetMapping("adminmodify_form")
	public String adminmodify_form() {
		return "admin/adminmodify";
		}
	@PostMapping("adminmodify")
	public String adminmodify(@RequestParam String id,@RequestParam String pw,@RequestParam(required=false) String tel,AdminDTO dto) {
	 int result=as.adminModify(id,pw,tel,dto);
		if(result==1) {
			return "redirect:adminlist";
		}
		return "redirect:adminmodify_form";
		}
	@GetMapping("memmanagement")
	public String memmanagement(HttpSession session,Model model,
			@RequestParam(value="num",required = false,defaultValue = "1") int num) {
		recentAct="회원 관리";
		String id=(String)session.getAttribute(LOGIN);
		as.recentAct(recentAct,id);
		ms.memberList(model,num);
		return "admin/memmanagement";
		}
	@GetMapping("memberdetail")
	public String memberdetail(@RequestParam String userId,HttpSession session,Model model) {
		session.setAttribute(MANAGE, userId);
		ms.memberInfo(model,userId); 
		ms.detailList(model,userId);
		return "admin/memberdetail";
	}
	@GetMapping("commanagement")
	public String commanagement(HttpSession session,Model model,
			@RequestParam(value="qnanum",required = false,defaultValue = "1") int qnanum) {
		recentAct="커뮤니티 관리";
		String adminId=(String)session.getAttribute(LOGIN);
		as.recentAct(recentAct,adminId);
		bs.QnABoardList(model,qnanum);
		return "admin/commanagement";
		}
	@GetMapping("qnaview")
	public String qnaview(@RequestParam int writeNo, Model model,HttpSession session) {

		session.setAttribute("writeNo", writeNo);
		bs.QnABoardView(writeNo,model);
		return "admin/qnaview";
	}

	@GetMapping("annview")
	public String annview(@RequestParam int writeNo, Model model,HttpSession session) {
		session.setAttribute("writeNo", writeNo);
		bs.annBoardView(writeNo,model);
		return "admin/annview";
	}
	
	@GetMapping("/AnnwriteForm")
	public String writeForm(Model model) {
		return "admin/AnnwriteForm";
	}
	@PostMapping("writeSave")
	public String writeSave(MultipartHttpServletRequest mul,
							HttpServletRequest request
							,Model model) throws Exception{
		bs.AnnwriteSave(mul, request);
		return "redirect:commanagementann";
	}
	@GetMapping("commanagementann")
	public String commanagementann(Model model,@RequestParam(value="annnum",required = false,defaultValue = "1") int annnum) {
		bs.AnnBoardList(model,annnum);
		return "admin/commanagementann";
		}
	@PostMapping(value="addReply", produces = "application/json; charset=utf-8")
	public void addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
		QnaBoardRepDTO dto = new QnaBoardRepDTO();
		dto.setUserid( (String)session.getAttribute(LOGIN));
		dto.setWrite_group( Integer.parseInt((String)map.get("write_no")) );
		dto.setTitle((String)map.get("title"));
		dto.setContent((String)map.get("content"));
		
		bs.addReply(dto);
	}
	@GetMapping(value="replyData/{write_group}",produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<QnaBoardRepDTO> replyData(@PathVariable int write_group){
		return bs.getRepList(write_group);
	}
	@PostMapping("AnnBoardDelete")
	public String AnnBoardDelete(@RequestParam int writeNo) {
		System.out.println(writeNo);
		bs.AnnBoardDelete(writeNo);
		return "redirect:commanagementann";
	}
	@GetMapping("AnnModifyForm")
	public String AnnModifyForm(@RequestParam int writeNo, Model model) {
		bs.annBoardView(writeNo,model);
		return "admin/AnnModifyForm";
	}
	@PostMapping("modify")
	public String modify(MultipartHttpServletRequest mul,
						HttpServletRequest request )throws Exception {
		bs.Annmodify(mul, request);
		return "redirect:commanagementann";
	}
}