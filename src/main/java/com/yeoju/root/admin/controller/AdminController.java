package com.yeoju.root.admin.controller;

import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yeoju.root.admin.service.AdminService;
import com.yeoju.root.common.dto.AdminDTO;
import com.yeoju.root.member.session_name.MemberSessionName;

@Controller
@RequestMapping("admin")
public class AdminController implements MemberSessionName{
	String recentAct;
	@Autowired AdminService as;
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
	public String logout(HttpSession session) {
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
	
	@GetMapping("commanagementann")
	public String commanagementann() {
		return "admin/commanagementann";
		}
	@GetMapping("memmanagement")
	public String memmanagement(@RequestParam(required=false) String id) {
		recentAct="회원 관리";
		as.recentAct(recentAct,id);
		return "admin/memmanagement";
		}

	@GetMapping("commanagement")
	public String commanagement(@RequestParam(required=false) String id) {
		recentAct="커뮤니티 관리";
		as.recentAct(recentAct,id);
		return "admin/commanagement";
		}

}
