package com.yeoju.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yeoju.root.common.dto.QnaBoardRepDTO;

public interface BoardService {

	public void QnABoardView(int writeNo, Model model);

	public void QnABoardList(Model model);
	public void upHit(int writeNo);

	public void addReply(QnaBoardRepDTO dto);

	public List<QnaBoardRepDTO> getRepList(int write_group);

	public void writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);

	public void QnABoardDelete(int writeNo);
}
