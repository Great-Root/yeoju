package com.yeoju.root.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.yeoju.root.common.dto.QnaBoardDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;
import com.yeoju.root.mybatis.QnaBoardDAO;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired QnaBoardDAO dao;
	
	@Override
	public void QnABoardList(Model model) {
		model.addAttribute("QnABoardList",dao.QnABoardList());
		
	}
	public void QnABoardView(int writeNo,Model model) {
		QnaBoardDTO list = dao.QnABoardView(writeNo);

		model.addAttribute("personalData", list);
		upHit(writeNo);
	}
	public void upHit(int writeNo) {
		dao.upHit(writeNo);
	}
	@Override
	public void addReply(QnaBoardRepDTO dto) {
		dao.addReply(dto);
		
	}
	@Override
	public List<QnaBoardRepDTO> getRepList(int write_group) {
		return dao.getRepList(write_group);
	}
}
