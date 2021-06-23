package com.yeoju.root.mybatis;

import java.util.ArrayList;

import com.yeoju.root.common.dto.MemberDetailDTO;

public interface MemberDetailDAO {

	ArrayList<MemberDetailDTO> detailList(String userId);

}
