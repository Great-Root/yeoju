package com.yeoju.root.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@GetMapping("permission")
	public String permission(Model model) {
		
		return "admin/permission";
		}
	@GetMapping("adminjoin")
	public String adminjoin() {
		return "admin/adminjoin";
		}
	@GetMapping("admindel")
	public String admindel(Model model) {
		as.adminList(model);
		return "admin/admindel";
		}
	@GetMapping("adminmodify")
	public String adminmodify() {
		return "admin/adminmodify";
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
