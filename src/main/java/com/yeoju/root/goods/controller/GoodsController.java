package com.yeoju.root.goods.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.goods.service.GoodsService;

@Controller
@RequestMapping("goods")
public class GoodsController {
	@Autowired
	GoodsService gs;
	
	//1. 상품 전체 목록 - 메인페이지 쪽에서?
	@ResponseBody
	@RequestMapping("/list.do")
	public List<GoodsDTO> list() {
		return gs.listGoods();
	}
//	//2. 상품 상세보기
//	//@RequestMapping("/detail/{goodsId}")
//	@RequestMapping("detail/{goodsId}")
//	public ModelAndView detail(@PathVariable("goodsId")int goodsId,ModelAndView mav) {
//		mav.setViewName("/goodsDetail");
//		mav.addObject("dto",goodsService.detailGoods(goodsId));
//		return mav;
//	}
	
	//3.상품등록 페이지 매핑
	@RequestMapping("write.do")
	public String write() { 
		return "/goods/goodsWrite";
	}
	
//	//4.상품등록 처리 매핑
//	@RequestMapping("insert.do")
//	public String insert(GoodsDTO dto) {
//		String filename="";
//		//첨부파일 (상품사진) 이 있으면 넣기
//		if(!dto.getImg().isEmpty()) {
//			filename=dto.getImg();
//			
//			String path = "";
//		try {
//			new File(path).mkdirs();//디렉토리 생성
//			//임시디렉토리(서버)에 저장된 파일을 지정된 디렉토리로 전송
//			dto.getImg().transferTo(new File(path+filename));
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		dto.setGoodsUrl(filename);
//		GoodsService.insertGoods(dto);
//	}
//	return "redirect:/goods/edit.do";			
//}
//	
//	//5. 상품 수정(편집) 페이지 매핑
//	@RequestMapping("edit/{goodsId}")
//	public ModelAndView edit(@PathVariable("goodsId")int goodsId, ModelAndView mav) {
//		mav.setViewName("/goodsEdit");
//		mav.addObject("dto", goodsService.detailGoods(goodsId));
//		return mav;
//	}
//	
//	//6.상품 수정(편집) 처리 매핑
//	@RequestMapping("update.do")
//	public String update(GoodsDTO dto) {
//		String filename="";
//		//첨부파일(상품사진)이 변경되면
//		if(!dto.getImg().isEmpty()) {
//			filename=dto.getImg().getOriginalFilename();
//			//개발디렉토리 - 파일 업로드 경로
//		String path = "";	
//		try {
//			new File(path).mkdirs(); //디렉토리 생성
//			dto.getImg().transferTo(new File(path+filename));
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		dto.setGoodsUrl(filename);
//		//첨부파일이 변경되지 않으면
//		}else {
//			//기존의 파일명
//			GoodsDTO dto2 = GoodsService.detailGoods(dto.getGoodsId());
//			dto.setGoodsUrl(dto2.getGoodsUrl());
//		}
//		goodsService.updateGoods(dto);
//		return "redirect:/goods/list.do";
//	}
	
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
}
