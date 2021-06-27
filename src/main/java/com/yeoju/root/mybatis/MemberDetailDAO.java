package com.yeoju.root.mybatis;

import java.util.ArrayList;

import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.MemberDetailDTO;

public interface MemberDetailDAO {

	ArrayList<MemberDetailDTO> detailList(String userId);
	
	public int modify(MemberDTO dto) throws Exception;
	
	
	public int delete(MemberDTO dto) throws Exception;
	
	
	// Member Detail 추가하기
	public void insertDetail(MemberDTO dto);
	
	//Member Detail 수정하기
	public int modifyDetail(MemberDTO dto) throws Exception;

	// Member Detail 삭제하기
	public int deleteDetail(MemberDTO dto) throws Exception;
	
	// Member Detail 확인하기
	public int cnt(String userId);
}
