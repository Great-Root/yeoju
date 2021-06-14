package com.care.root.goods.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeoju.root.common.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
//	
//	@Inject
//	SqlSession sqlSession;
//	
//	//01. 상품목록
//	@Override 
//	public List<GoodsDTO> listGoods(){
//		return sqlSession.selectList("goods.listGoods");
//	}
//	//02. 상품상세
//	@Override
//	public GoodsDTO detailGoods(int goodsId) {
//		return sqlSession.selectOne("goods.detailGoods",goodsId);
//	}
//	//03.상품수정
//	@Override
//	public void updateGoods(GoodsDTO dto) {
//		sqlSession.update("goods.updateGoods",dto);
//	}
//	//04.상품삭제
//	@Override
//	public void deleteGoods(int goodsId) {
//		sqlSession.delete("goods.deleteGoods", goodsId);
//	}
//	//05.상품추가
//	@Override
//	public void insertGoods(GoodsDTO dto) {
//		sqlSession.insert("goods.insertGoods",dto);
//	}
//	//06.상품이미지 삭제를 위한 이미지파일 정보
//	@Override
//	public String fileInfo(int goodsId) {
//		return sqlSession.selectOne("goods.fileInfo", goodsId);
//	}
//	
}
