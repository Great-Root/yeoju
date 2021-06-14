package com.yeoju.root.admin.service;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeoju.root.common.dto.AdminDTO;
import com.yeoju.root.mybatis.admin.AdminMapper;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired AdminMapper mapper;
	@Override
	public void adminList(Model model) {
		ArrayList<AdminDTO> list = mapper.adminList();
		model.addAttribute("adminList", list);
		 
	}
	public void adminDel(Model model) {
		ArrayList<AdminDTO> list = mapper.adminList();
		model.addAttribute("adminDel", list);
		 
	}
	public int adminJoin(AdminDTO dto) {
		String id=dto.getId();
		String pw=dto.getPw();
		String tel=dto.getTel();
		dto.setId(id);
		dto.setPw(pw);
		dto.setTel(tel);
		try {
			return mapper.adminJoin(dto);
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public int adminModify(AdminDTO dto) {
		String id=dto.getId();
		String pw=dto.getPw();
		String tel=dto.getTel();
		dto.setId(id);
		dto.setPw(pw);
		dto.setTel(tel);
		try {
			return mapper.adminModify(dto);
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public int adminDelete(AdminDTO dto) {
		String id=dto.getId();
		dto.setId(id);
		try {
			return mapper.adminDelete(dto);
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
}
