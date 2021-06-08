package com.yeoju.root.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
	@GetMapping("adminlist")
	public String adminlist() {
		return "admin/adminlist";
		}
	@GetMapping("adminjoin")
	public String adminjoin() {
		return "admin/adminjoin";
		}
	@GetMapping("admindel")
	public String admindel() {
		return "admin/admindel";
		}
	@GetMapping("adminmodify")
	public String adminmodify() {
		return "admin/adminmodify";
		}
	@GetMapping("permission")
	public String permission() {
		return "admin/permission";
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
