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

}
