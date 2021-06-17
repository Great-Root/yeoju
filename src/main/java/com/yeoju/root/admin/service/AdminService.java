package com.yeoju.root.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yeoju.root.common.dto.AdminDTO;

public interface AdminService {
	public void adminList(Model model);
	public int adminJoin(AdminDTO dto);
	public void adminDel(Model model);
	public int adminDelete(AdminDTO dto);
	public int adminModify(String id,String pw,String tel,AdminDTO dto);
	public int admin_check(HttpServletRequest request);
	public void recentAct(String recentAct,String id);
	public void QnABoardList(Model model);
	public void QnABoardView(int writeNo,Model model);
	
}	
