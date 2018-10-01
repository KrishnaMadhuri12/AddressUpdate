package com.user.info.dao;

import java.util.Map;

import com.user.info.model.UserAddress;

public interface UserInfoDAO {

	Map<String, Object> isValidUser(String networkId) throws Exception;

	String updateUserInfo(UserAddress userAddressObj) throws Exception;
}
