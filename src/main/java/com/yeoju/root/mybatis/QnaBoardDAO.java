package com.yeoju.root.mybatis;

import java.util.List;


import com.yeoju.root.common.dto.QnaBoardDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;

public interface QnaBoardDAO {
	public List<QnaBoardDTO> QnABoardList();
	public QnaBoardDTO QnABoardView(int writeNo);
	public void upHit(int writeNo);
	public void addReply(QnaBoardRepDTO dto);
	public List<QnaBoardRepDTO> getRepList(int write_group);
	public void writeSave(QnaBoardDTO dto);
	public void QnaBoardDelete(int writeNo);
}
