package com.yeoju.root.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yeoju.root.common.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO user_check(String id);
	public int check_id(String userId) throws Exception;
	public int join_member(MemberDTO dto) throws Exception;
	public int join_memberdetail(MemberDTO dto) throws Exception;
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getUserSessionId(String sessionId);
	public String find_id(String email) throws Exception;

	public int update_pw(MemberDTO member) throws Exception;
	public int check_email(String email) throws Exception;
	public int approval_member(MemberDTO dto) throws Exception;
	public int recent_date(String userId) throws Exception;
	public int updatePw(MemberDTO dto) throws Exception;


	public ArrayList<MemberDTO> memberInfo(String userId);
	// 회원정보 가져오기
	public MemberDTO getUserInfo(String userId);
	public int selectBoardCount();
	public ArrayList<MemberDTO> memberList(@Param("s") int start,@Param("e") int end);

}
