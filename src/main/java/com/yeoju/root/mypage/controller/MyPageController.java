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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
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
		return "mypage/memberModifyForm";
	}
	@PostMapping(value = "/modify")
	public String modifyMember(@ModelAttribute MemberDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception{
		session.setAttribute("dto", mps.modify(dto));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:/";
	}
	@GetMapping("/delete")
	public String deleteForm() {
		return "mypage/delete";
	}
	@PostMapping("/delete.do")
	public String delete(@ModelAttribute MemberDTO dto, HttpSession session, HttpServletResponse response) throws Exception{
		if(mps.delete(dto, response)) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
}
