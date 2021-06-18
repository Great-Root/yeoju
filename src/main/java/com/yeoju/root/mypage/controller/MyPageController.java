package com.yeoju.root.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mypage.service.MyPageService;

@Controller
@RequestMapping("mypage")
public class MyPageController implements MemberSessionName{
	
	@Autowired MyPageService mps;

	@ResponseBody
	@GetMapping(value="/sellGoods", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> sellGoods(HttpSession session){
		return mps.sellGoods((String)session.getAttribute(LOGIN));
	}
	@ResponseBody
	@GetMapping(value="/heartPage", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> heartPage(HttpSession session){
		return mps.heartPage((String)session.getAttribute(LOGIN));
	}
	@GetMapping("/memberModify/{userId}")
	public String memebrModify(@PathVariable String userId, Model model) {
		model.addAttribute("modifyInfo", mps.getUserInfo(userId));
		return "mypage/memberModify";
	}
	
}
