package com.yeoju.root.goods.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeoju.root.common.dto.GoodsCommentsDTO;
import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.HeartDTO;
import com.yeoju.root.common.dto.SearchDTO;
import com.yeoju.root.common.url.URL;
import com.yeoju.root.mybatis.CommentsDAO;
import com.yeoju.root.mybatis.GoodsDAO;

@Service
public class GoodsServiceImpl extends URL implements GoodsService {
	
	@Autowired
	GoodsDAO goodsDao;
	@Autowired
	CommentsDAO commentsDAO;
	@Autowired
	private GoodsDAO goodsMapper;
	
	//01.상품목록
	@Override
	public List<GoodsDTO> listGoods(SearchDTO search){
		return goodsDao.listGoods(search);
	}
	//02.상품상세
	//제품 상세 페이지에 댓글 기능이 들어가기 때문에 retrunDTO라는 변수에 GoodsDTO,CommentDTO를 넣어버림
		@Override
	public GoodsDTO detailGoods(int goodsId) {
		GoodsDTO returnDTO = new GoodsDTO();
		List<GoodsCommentsDTO> commentsDTO = new ArrayList<GoodsCommentsDTO>();
		
		returnDTO = goodsDao.detailGoods(goodsId);
		commentsDTO = commentsDAO.redaReply(goodsId);
		
		returnDTO.setGoodsCommentsList(commentsDTO);
		return returnDTO;
	}
	//03.상품추가
	@Override
	public boolean insertGoods(GoodsDTO dto) {
		return goodsDao.insertGoods(dto) == 1 ? true : false;
	}
	//04.상품수정
	@Override
	public boolean updateGoods(GoodsDTO dto) {
		return goodsDao.updateGoods(dto) == 1 ? true : false;
	}
	//05.상품삭제	
	@Override
	@Transactional
	public void deleteGoods(int goodsId) {
		goodsDao.deleteHeartAll(goodsId);
		goodsDao.deleteCommentAll(goodsId);
		goodsDao.deleteGoods(goodsId);
	}
	//06.상품이미지 삭제를 위한 이미지파일 정보
	@Override
	public String imgFileName(int goodsId) {
		return goodsDao.imgFileName(goodsId);
	}
	
	//07.조회수 카운트
	@Override
	public void viewCount(int goodsId) {
		goodsMapper.viewCount(goodsId);
	}

	//댓글 조회
	@Override
	public List<GoodsCommentsDTO> redaReply(int goods_id){
		return commentsDAO.redaReply(goods_id);
		
	};
	
	// 찜버튼 클릭
	@Override
	public boolean heart(HeartDTO dto) {
		boolean result;
		if(isheart(dto)){
			goodsDao.deleteHeart(dto);
			result = false;
		}else {
			goodsDao.insertHeart(dto);
			result = true;
		}
		return result;
	}
	
	// 해당상품 찜 총 갯수 구하기
	@Override
	public int heartTotalCnt(int goodsId) {
		return goodsDao.heartTotalCnt(goodsId);
	}
	
	// 찜버튼 활성화여부
	@Override
	public boolean isheart(HeartDTO dto) {
		return goodsDao.heartCnt(dto) == 0 ? false : true;
	}
	@Override
	public boolean isYours(String loginUser, int goodsId) {
		return goodsDao.getUserId(goodsId).equals(loginUser);
	}
	@Override
	public void soldOut(int goodsId) {
		if(goodsDao.isSoldOut(goodsId) == 0) {
			goodsDao.soldOut(goodsId,1);
		}else {
			goodsDao.soldOut(goodsId,0);
		}
	}
	@Override
	public boolean isSoldOut(int goodsId) {
		return goodsDao.isSoldOut(goodsId) == 0 ? false : true;
	}
}
