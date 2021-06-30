package com.yeoju.root.common.comments.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yeoju.root.common.comments.service.CommentsService;
import com.yeoju.root.common.dto.GoodsCommentsDTO;
import com.yeoju.root.goods.service.GoodsService;

@RestController
@RequestMapping("comments")
public class CommentsController {

	@Autowired
	CommentsService cs;
	
	@Autowired
	GoodsService gs;
	
	// 댓글 입력
	
	@GetMapping(value ="insertComment",produces="application/json; charset = utf-8")
	public int insertComment(GoodsCommentsDTO dto) {
		
		return cs.insertComments(dto);
	}
	
	@GetMapping(value ="insertComment2",produces="application/json; charset = utf-8")
	public int insertComment2(GoodsCommentsDTO dto) {
		
		return cs.insertComments2(dto);
	}
	//1. 댓글 리스트 
		@GetMapping("/commentslist")
		public List<GoodsCommentsDTO> commentsList(@RequestParam int goodsId) {
			System.out.println("확인작업");
			System.out.println("상품 번호는 ? "+goodsId);
			List<GoodsCommentsDTO> dto = new ArrayList<GoodsCommentsDTO>();
//			try {
//				dto = gs.redaReply(goodsId);
//			} catch(Exception e) {
//				e.getMessage();
//			}
			
			return dto;
		}
	// 댓글 수정
		
	// 댓글 삭제 
		@GetMapping(value ="deleteComment",produces="application/json; charset = utf-8")
	public int deleteComment(GoodsCommentsDTO dto) {
		System.out.println(dto.toString());
		return cs.deleteComments(dto.getCommentId());
		}
		//대댓글삭제
		@GetMapping(value ="deleteComment2",produces="application/json; charset = utf-8")
		public int deleteComment2(GoodsCommentsDTO dto) {
			System.out.println(dto.toString());
			return cs.deleteComments2(dto.getCommentId2());
	}
}
