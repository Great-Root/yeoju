package com.yeoju.root.mybatis;

import java.util.List;

import com.yeoju.root.common.dto.GoodsCommentsDTO;
import com.yeoju.root.common.dto.GoodsDTO;

public interface CommentsDAO {

	//댓글 조회
	public List<GoodsCommentsDTO> redaReply(int goods_id);
	//댓글 commentId 값 가져오기.
	public GoodsCommentsDTO selectCommentSeq();
	//대댓글 commentId2 값 가져오기.
	public GoodsCommentsDTO selectCommentSeq2();
	//댓글 추가
	public int insertComments(GoodsCommentsDTO dto);
	//댓글 추가
	public int insertComments2(GoodsCommentsDTO dto);
	//댓글 수정
	public int updateComments(GoodsCommentsDTO dto);
	//댓글 삭제
	public int deleteComments(int goodsId);
	//댓글 삭제
	public int deleteComments2(int goodsId);
} 
