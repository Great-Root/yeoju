package com.yeoju.root.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;

import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mypage.service.MyPageService;

@Controller
@RequestMapping("mypage")
public class MyPageController implements MemberSessionName{
	
	@Autowired MyPageService mps;

	@ResponseBody
	@GetMapping(value="/sellGoods", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> sellGoods(@RequestParam int pageNo, HttpSession session){
		return mps.sellGoods((String)session.getAttribute(LOGIN),pageNo);
	}
	@ResponseBody
	@GetMapping(value="/heartPage", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> heartPage(@RequestParam int pageNo, HttpSession session){
		return mps.heartPage((String)session.getAttribute(LOGIN),pageNo);
	}
	@GetMapping("/memberModify")
	public String memebrModify(@RequestParam String userId, Model model) {
		MemberDTO dto = mps.getUserInfo(userId);
		dto.toString();
		model.addAttribute("modifyInfo", dto);
		return "mypage/memberModifyForm";
	}
	@PostMapping("/modify")
	public void modifyMember(MemberDTO dto, HttpServletResponse response) throws Exception{
		mps.modify(dto, response);
	}
	@GetMapping("/delete/{userId}")
	public String delete(@PathVariable String userId, Model model) {
		model.addAttribute("deleteInfo", mps.getUserInfo(userId));
		return "mypage/deleteForm";
	}
	@PostMapping("/delete.do")
	public String delete(@ModelAttribute MemberDTO dto, HttpSession session, HttpServletResponse response) throws Exception{
		if(mps.delete(dto, response)) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
}
