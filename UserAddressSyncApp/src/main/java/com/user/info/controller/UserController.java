package com.user.info.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.user.info.model.UserAddress;
import com.user.info.service.UserInfoService;

@Controller
@RequestMapping("/")
public class UserController {

	@Autowired
	private UserInfoService userInfoService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "index";
	}

	@RequestMapping(value = "/checkUser/{networkId}", method = RequestMethod.GET)
	public @ResponseBody String checkUser(@PathVariable("networkId") String networkId) {
		String status = "";
		Gson gson = new GsonBuilder().create();
		Map<String, Object> userObj = null;
		try {
			userObj = userInfoService.isValidUser(networkId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		status = gson.toJson(userObj);
		return status;
	}

	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	public @ResponseBody String updateUserInfo(@RequestBody UserAddress userAddressObj) {
		String status = "INVALID";
		try {
			status = userInfoService.updateUserInfo(userAddressObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
