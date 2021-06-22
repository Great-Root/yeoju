package com.yeoju.root.mybatis;

import java.util.List;

import com.yeoju.root.common.dto.CategoryDTO;

public interface CategoryDAO {

	//카테고리
	public List<CategoryDTO> category() throws Exception;
}
