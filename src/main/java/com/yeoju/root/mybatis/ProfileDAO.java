package com.yeoju.root.mybatis;

import com.yeoju.root.common.dto.ProfileDTO;

public interface ProfileDAO {

	public void insertProfileImg(ProfileDTO dto);

	public ProfileDTO getProfileImg(String userId);
	
	public int imgCount(String userId);

	public void deleteProfileImg(String userId);
}
