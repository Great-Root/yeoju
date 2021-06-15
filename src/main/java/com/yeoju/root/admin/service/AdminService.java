package com.yeoju.root.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.yeoju.root.common.dto.AdminDTO;

public interface AdminService {
	public void adminList(Model model);
	public int adminJoin(AdminDTO dto);
	public void adminDel(Model model);
	public int adminDelete(AdminDTO dto);
	public int adminModify(String id,String pw,String tel,AdminDTO dto);
	public int admin_check(HttpServletRequest request);

}
