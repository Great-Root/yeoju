package com.yeoju.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yeoju.root.common.dto.AnnBoardDTO;
import com.yeoju.root.common.dto.QnaBoardDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;
import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mybatis.AnnBoardDAO;
import com.yeoju.root.mybatis.QnaBoardDAO;
@Service
public class BoardServiceImpl implements BoardService,MemberSessionName{
	@Autowired QnaBoardDAO dao;
	@Autowired AnnBoardDAO Anndao;
	@Override
	public void QnABoardList(Model model) {
		model.addAttribute("QnABoardList",dao.QnABoardList());
		
	}
	@Override
	public void AnnBoardList(Model model) {
		model.addAttribute("AnnBoardList",Anndao.AnnBoardList());
		
	}
	public void QnABoardView(int writeNo,Model model) {
		QnaBoardDTO list = dao.QnABoardView(writeNo);

		model.addAttribute("personalData", list);
	}
	@Override
	public void annBoardView(int writeNo, Model model) {
		AnnBoardDTO list = Anndao.annBoardView(writeNo);
		model.addAttribute("personalData", list);
	}
	
	@Override
	public void addReply(QnaBoardRepDTO dto) {
		dao.addReply(dto);
		
	}
	@Override
	public List<QnaBoardRepDTO> getRepList(int write_group) {
		return dao.getRepList(write_group);
	}
	@Override
	public void AnnwriteSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		AnnBoardDTO dto=new AnnBoardDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		HttpSession session = request.getSession();
		dto.setUserid((String)session.getAttribute(LOGIN));
		
		Anndao.AnnwriteSave(dto);
	}
	
	public void writeSave(MultipartHttpServletRequest mul,
			HttpServletRequest request) {
		QnaBoardDTO dto = new QnaBoardDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		HttpSession session = request.getSession();
		dto.setUserid((String)session.getAttribute(LOGIN));
		
		dao.writeSave(dto);
		}
	@Override
	public void QnABoardDelete(int writeNo) {
		dao.QnABoardDelete(writeNo);
	}
	@Override
	public void AnnBoardDelete(int writeNo) {
		Anndao.AnnBoardDelete(writeNo);
		
	}
	@Override
	public void modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		QnaBoardDTO dto = new QnaBoardDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dao.modify(dto);
	}
	@Override
	public void Annmodify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		AnnBoardDTO dto =new AnnBoardDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		Anndao.modify(dto);
		
	}
	
}
