package com.yeoju.root.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.mypage.service.MyPageService;

@Controller
@RequestMapping("mypage")
public class MyPageController {
	
	@Autowired MyPageService mps;

	@ResponseBody
	@GetMapping(value="/sellGoods", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> sellGoods(){
		return mps.sellGoods();
	}
	@ResponseBody
	@GetMapping(value="/heartPage", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> heartPage(){
		return mps.heartPage();
	}
	@GetMapping("/memberModify/{userId}")
	public String memebrModify(@PathVariable String userId, Model model) {
		model.addAttribute("modifyInfo", mps.getUserInfo(userId));
		return "mypage/memberModify";
	}
	
}
