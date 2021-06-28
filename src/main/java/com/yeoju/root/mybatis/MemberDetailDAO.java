package com.yeoju.root.mybatis;

import java.util.ArrayList;

import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.MemberDetailDTO;

public interface MemberDetailDAO {

	ArrayList<MemberDetailDTO> detailList(String userId);
	
	public int modify(MemberDTO dto);
	
	
	public int delete(String userId);
	
	
	// Member Detail 추가하기
	public void insertDetail(MemberDTO dto);
	
	//Member Detail 수정하기
	public int modifyDetail(MemberDTO dto);

	// Member Detail 삭제하기
	public int deleteDetail(String userId);
	
	// Member Detail 확인하기
	public int cnt(String userId);
}
