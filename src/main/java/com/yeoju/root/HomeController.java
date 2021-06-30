package com.yeoju.root;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.goods.service.GoodsService;
import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mypage.service.MyPageService;

@Controller
public class HomeController implements MemberSessionName{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired MyPageService mps;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			@RequestParam(required = false,defaultValue = "") String keyword,
			@RequestParam(required = false,defaultValue = "all") String searchOption,
			@RequestParam(required = false,defaultValue = "false") String soldOutView
			) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		//List<GoodsDTO> list = GoodsService.listGoods(0, searchOption,keyword);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("soldOutView", soldOutView);
//		model.addAttribute("category_h", soldOutView);
		return "index";
	}
	@GetMapping("/mypage")
	public String mypage(Model model,HttpSession session) {
		MemberDTO dto = mps.getUserInfo((String)session.getAttribute(LOGIN));
		model.addAttribute("userInfo", dto);
		model.addAttribute("result", mps.getGoodsResult(dto.getUserId()));
		return "mypage/mypage";
	}
	
}
