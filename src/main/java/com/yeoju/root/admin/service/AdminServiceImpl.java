package com.yeoju.root.admin.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yeoju.root.common.dto.AdminDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.MemberDetailDTO;
import com.yeoju.root.common.dto.QnaBoardDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;
import com.yeoju.root.mybatis.AdminMapper;
import com.yeoju.root.mybatis.QnaBoardDAO;
@Service
public class AdminServiceImpl implements AdminService {
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
	@Override
	public int admin_check(HttpServletRequest request) {
BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		AdminDTO dto = mapper.admin_check(request.getParameter("id"));
		if(dto != null) {
			if(encoder.matches(request.getParameter("pw"), dto.getPw()) ||
								request.getParameter("pw").equals(dto.getPw())) {
				return 0;
			}
		}
		return 1;
	}
	public int adminModify(String id,String pw,String tel,AdminDTO dto) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		Map<String, Object> map = new HashMap<String, Object>();
		pw = encoder.encode(dto.getPw());
		map.put("pw",pw);
		map.put("tel",tel);
		map.put("id", id);
		try {
		mapper.adminModify(map);
		return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	} 
	@Override
	public void recentAct(String recentAct,String adminId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recentAct",recentAct);
		map.put("id",adminId);
		try {
		mapper.recentAct(map);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
