package com.yeoju.root.goods.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.url.URL;
import com.yeoju.root.goods.service.GoodsService;
import com.yeoju.root.member.session_name.MemberSessionName;

@Controller
@RequestMapping("goods")
public class GoodsController extends URL implements MemberSessionName{
	@Autowired
	GoodsService gs;
	
	//1. 상품 전체 목록 - 메인페이지 쪽에서?
	@ResponseBody
	@RequestMapping("/list.do")
	public List<GoodsDTO> list() {
		System.out.println("확인작업");
		return gs.listGoods();
	}
	//2. 상품 상세보기
	@RequestMapping("detail/{goodsId}")
	public String detail(@PathVariable("goodsId")int goodsId, Model model) {
		model.addAttribute("dto",gs.detailGoods(goodsId));
		return "goods/goodsDetail";
	}
	
	//3.상품등록 페이지 매핑
	@RequestMapping("write.do")
	public String write() { 
		return "/goods/goodsWrite";
	}
	
	//4.상품등록 처리 매핑
	@RequestMapping("insert.do")
	public String insert(MultipartHttpServletRequest mul, HttpSession session) {
		String goodsName = mul.getParameter("goodsName");
		String goodsPrice = mul.getParameter("goodsPrice");
		String goodsInfo = mul.getParameter("goodsInfo");
		String userId = (String) session.getAttribute(LOGIN);
		MultipartFile file = mul.getFile("img");
		String saveImgName = gs.fileProcess(file,userId);
		String url = "";
		if(!saveImgName.equals("NO")) {
			GoodsDTO dto = new GoodsDTO();
			dto.setGoodsName(goodsName);
			dto.setGoodsPrice(Integer.parseInt(goodsPrice));
			dto.setGoodsInfo(goodsInfo);
			dto.setImg(saveImgName);
			dto.setUserId(userId);
			gs.insertGoods(dto);
			System.out.println(dto.toString());
			url = "redirect:/";
		}else {
			url = "redirect:/goods/write.do";
		}
		return url;			
	}
	
	//5. 상품 수정(편집) 페이지 매핑
	@RequestMapping("edit/{goodsId}")
	public String edit(@PathVariable("goodsId")int goodsId,Model model) {
		model.addAttribute("dto", gs.detailGoods(goodsId));
		return "goods/goodsEdit";
	}
	
	//6.상품 수정(편집) 처리 매핑
	@RequestMapping("update.do")
	public String update(MultipartHttpServletRequest mul, HttpSession session) {
		String goodsName = mul.getParameter("goodsName");
		String goodsPrice = mul.getParameter("goodsPrice");
		String goodsInfo = mul.getParameter("goodsInfo");
		String goodsId = mul.getParameter("goodsId");
		String userId = (String) session.getAttribute(LOGIN);
		MultipartFile file = mul.getFile("img");
		String saveImgName = gs.fileProcess(file,userId);
		String url = "";
		if(!saveImgName.equals("NO")) {
			GoodsDTO dto = new GoodsDTO();
			dto.setGoodsId(Integer.parseInt(goodsId));
			dto.setGoodsName(goodsName);
			dto.setGoodsPrice(Integer.parseInt(goodsPrice));
			dto.setGoodsInfo(goodsInfo);
			dto.setImg(saveImgName);
			dto.setUserId(userId);
			gs.updateGoods(dto);
			url = "redirect:/goods/detail/"+goodsId;
		}else {
			url = "redirect:/goods/write.do";
		}
		return url;
	}
	
	//7.상품 삭제 처리 매핑
//	@RequestMapping("delete.do")
//	public String delete(@RequestParam int goodsId) {
//		//상품 이미지 정보
//		String filename = goodsService.fileInfo(goodsId);
//		String path="";
//		//상품 이미지 삭제
//		if(filename !=null) {
//			File file = new File(path+filename);
//			//파일이 존재하면
//			if(file.exists()) {
//				file.delete();//파일 삭제
//			}
//		}
//		//레코드 삭제
//		goodsService.deleteGoods(goodsId);
//		return "redirect:/goods/list.do";
//	}
	//8.상품 이미지 출력
	@GetMapping("img/{userId}")
	public void img(@PathVariable String userId,@RequestParam String fileName,
			HttpServletResponse response) throws Exception {
	response.addHeader("Content-disposition", "attachment; fileName="+fileName);
	String path = getImgURL(userId, fileName);
	File file = new File(path);
	FileInputStream in = new FileInputStream(file);
	FileCopyUtils.copy(in, response.getOutputStream());
	in.close();
}
}
