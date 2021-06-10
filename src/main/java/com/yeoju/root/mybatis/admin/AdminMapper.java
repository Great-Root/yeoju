package com.yeoju.root.mybatis.admin;

import java.util.ArrayList;

import com.yeoju.root.common.dto.AdminDTO;

public interface AdminMapper {
	public ArrayList<AdminDTO> adminList();

	public int adminJoin(AdminDTO dto);

	public ArrayList<AdminDTO> admindel();
}
