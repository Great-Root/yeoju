package com.yeoju.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yeoju.root.common.dto.QnaBoardRepDTO;

public interface BoardService {

	public void QnABoardView(int writeNo, Model model);

	public void QnABoardList(Model model,int qnanum);

	public void addReply(QnaBoardRepDTO dto);

	public List<QnaBoardRepDTO> getRepList(int write_group);

	public void writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void QnABoardDelete(int writeNo);

	public void AnnBoardList(Model model,int annnum);

	public void AnnwriteSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void annBoardView(int writeNo, Model model);

	public void AnnBoardDelete(int writeNo);

	public void modify(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void Annmodify(MultipartHttpServletRequest mul, HttpServletRequest request);
}
