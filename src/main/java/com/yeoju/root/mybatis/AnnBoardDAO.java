package com.yeoju.root.mybatis;

import java.util.List;

import com.yeoju.root.common.dto.AnnBoardDTO;


public interface AnnBoardDAO {
	public List<AnnBoardDTO>  AnnBoardList();

	public void AnnwriteSave(AnnBoardDTO dto);

	public AnnBoardDTO annBoardView(int writeNo);

	public void AnnBoardDelete(int writeNo);

	public void modify(AnnBoardDTO dto);



}