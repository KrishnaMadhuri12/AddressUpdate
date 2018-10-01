package com.user.info.service;

import java.util.Map;

import com.user.info.model.UserAddress;

public interface UserInfoService {

	Map<String, Object> isValidUser(String networkId) throws Exception;

	String updateUserInfo(UserAddress userAddressObj) throws Exception;
	
}
