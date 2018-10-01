package com.user.info.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.user.info.dao.UserInfoDAO;
import com.user.info.model.UserAddress;

@Service("userInfoService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	private UserInfoDAO userInfoDAO;
	
	@Override
	public Map<String, Object> isValidUser(String networkId) throws Exception {
		return userInfoDAO.isValidUser(networkId);
		
	}

	@Override
	public String updateUserInfo(UserAddress userAddressObj) throws Exception {
		return userInfoDAO.updateUserInfo(userAddressObj);
	}

}
