package com.yeoju.root.mybatis;

import java.util.Map;

import com.yeoju.root.common.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO user_check(String id);
	public int register(MemberDTO dto);
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getUserSessionId(String sessionId);
	public String find_id(String email) throws Exception;
	// 회원정보 가져오기
	public MemberDTO getUserInfo(String userId);

}
