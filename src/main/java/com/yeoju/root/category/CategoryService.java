package com.yeoju.root.category;

import java.util.List;

import com.yeoju.root.common.dto.CategoryDTO;

public interface CategoryService {
	
	//카테고리
	public List<CategoryDTO> category() throws Exception;
}
