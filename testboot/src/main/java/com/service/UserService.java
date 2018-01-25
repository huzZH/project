package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.User;
import com.dao.UserDao;

@Service
public class UserService {

	@Resource
	private UserDao userDao;

	/**
	 * 根据用户ID查找用户
	 * 
	 * @param userId
	 * @return
	 */
	public User getUserById(Integer userId) {

		return userDao.getUserById(userId);
	}
}
