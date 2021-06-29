package com.yeoju.root.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yeoju.root.common.dto.QnaBoardDTO;
import com.yeoju.root.common.dto.QnaBoardRepDTO;

public interface QnaBoardDAO {
	public List<QnaBoardDTO> QnABoardList(@Param("s") int start,@Param("e") int end);
	public QnaBoardDTO QnABoardView(int writeNo);
	public void upHit(int writeNo);
	public void addReply(QnaBoardRepDTO dto);
	public List<QnaBoardRepDTO> getRepList(int write_group);
	public void writeSave(QnaBoardDTO dto);
	public void QnABoardDelete(int writeNo);
	public void modify(QnaBoardDTO dto);
	public int selectBoardCount();
}
