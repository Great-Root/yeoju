package com.yeoju.root.mybatis;

import java.util.ArrayList;
import java.util.Map;

import com.yeoju.root.common.dto.AdminDTO;


public interface AdminMapper {
	public ArrayList<AdminDTO> adminList();

	public int adminJoin(AdminDTO dto);

	public int adminDelete(AdminDTO dto);

	public void adminModify(Map<String, Object> map);

	public AdminDTO admin_check(String parameter);
	
	public void recentAct(Map<String, Object> map);
}
