package com.yeoju.root.category;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yeoju.root.common.dto.CategoryDTO;
import com.yeoju.root.mybatis.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	private CategoryDAO dao;
	
	//카테고리
	@Override
	public List<CategoryDTO> category() throws Exception{
		return dao.category();
	}
}
