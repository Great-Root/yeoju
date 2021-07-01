package com.yeoju.root.common.comments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeoju.root.common.dto.GoodsCommentsDTO;
import com.yeoju.root.mybatis.CommentsDAO;

@Service
public class CommentsServiceImpl implements CommentsService{

	@Autowired
	CommentsDAO commentsDAO;
	
	//댓글 추가
	@Override
	public int insertComments(GoodsCommentsDTO dto) {
		
		GoodsCommentsDTO commentDTO = commentsDAO.selectCommentSeq();
		dto.setCommentId(commentDTO.getCommentId());
		commentsDAO.insertComments(dto);
		
		return commentDTO.getCommentId();
	}
	 
	//대댓글 추가
	@Override
	public int insertComments2(GoodsCommentsDTO dto) {
		
		GoodsCommentsDTO commentDTO = commentsDAO.selectCommentSeq2();
		dto.setCommentId2(commentDTO.getCommentId2());
		commentsDAO.insertComments2(dto);
		
		return commentDTO.getCommentId2();
	}

	//댓글 수정
	@Override
	public boolean updateComments(GoodsCommentsDTO dto) {
		
		return commentsDAO.updateComments(dto) == 1 ? true : false;
	}

	//댓글 삭제
	@Override
	public int deleteComments(int commentId) {
		
		return commentsDAO.deleteComments(commentId);
		
	}

	@Override
	public int deleteComments2(int commentId) {
		// TODO Auto-generated method stub
		return commentsDAO.deleteComments(commentId);
	}

}
