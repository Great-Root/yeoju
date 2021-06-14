package com.yeoju.root.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeoju.root.admin.service.AdminService;
import com.yeoju.root.common.dto.AdminDTO;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired AdminService as;
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
	@GetMapping("admindelete")
	public String admindelete(AdminDTO dto) {
		
		int result = as.adminDelete(dto);
		if(result==1) {
			return "redirect:adminlist";
		}
		return "redirect:adminjoin_form";
	}
	
	@GetMapping("adminmodify_form")
	public String adminmodify_form() {
		return "admin/adminmodify";
		}
	@GetMapping("adminmodify")
	public String adminmodify(AdminDTO dto) {
		int result = as.adminModify(dto);
		if(result==1) {
			return "redirect:adminlist";
		}
		return "redirect:adminmodify_form";
		}
	@GetMapping("commanagement")
	public String commanagement() {
		return "admin/commanagement";
		}
	@GetMapping("commanagementann")
	public String commanagementann() {
		return "admin/commanagementann";
		}
	@GetMapping("memmanagement")
	public String memmanagement() {
		return "admin/memmanagement";
		}
	@GetMapping("statistic")
	public String statistic() {
		return "admin/statistic";
		}
	
}
