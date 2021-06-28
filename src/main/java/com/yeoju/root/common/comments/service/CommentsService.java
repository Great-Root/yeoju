package com.yeoju.root.common.comments.service;

import com.yeoju.root.common.dto.GoodsCommentsDTO;

public interface CommentsService {

		//댓글 추가
		public int insertComments(GoodsCommentsDTO dto);
		//댓글 수정
		public boolean updateComments(GoodsCommentsDTO dto);
		//댓글 삭제
		public int deleteComments(int commentId);
}
