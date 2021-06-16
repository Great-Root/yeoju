package com.yeoju.root.mybatis;

import java.util.Map;

import com.yeoju.root.common.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO user_check(String id);
	public int check_id(String userId) throws Exception;
	//public int register(MemberDTO dto) throws Exception;
	public int join_member(MemberDTO dto) throws Exception;
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getUserSessionId(String sessionId);
	public String find_id(String email) throws Exception;
	public int update_pw(MemberDTO member) throws Exception;
	public int check_email(String email) throws Exception;
	public int approval_member(MemberDTO dto) throws Exception;
	public int recent_date(String userId) throws Exception;
	public int updatePw(MemberDTO dto) throws Exception;
}
