package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bean.User;
import com.service.UserService;

@RestController
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value="/home")
	public User getUser() {
		int userId = 1;
		User user = userService.getUserById(userId);
		System.out.println(user.toString());
		return user;
	}
}
