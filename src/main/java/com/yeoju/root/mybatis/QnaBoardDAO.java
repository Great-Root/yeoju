package com.yeoju.root.mybatis;

import java.util.List;


import com.yeoju.root.common.dto.QnaBoardDTO;

public interface QnaBoardDAO {
	public List<QnaBoardDTO> QnABoardList();
	public QnaBoardDTO QnABoardView(int writeNo);
}
