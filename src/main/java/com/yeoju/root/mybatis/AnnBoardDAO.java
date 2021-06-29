package com.yeoju.root.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yeoju.root.common.dto.AnnBoardDTO;


public interface AnnBoardDAO {
	public ArrayList<AnnBoardDTO>  AnnBoardList(@Param("s") int start,@Param("e") int end);
	public void AnnwriteSave(AnnBoardDTO dto);

	public AnnBoardDTO annBoardView(int writeNo);

	public void AnnBoardDelete(int writeNo);

	public void modify(AnnBoardDTO dto);

	public int selectBoardCount();

	

}
