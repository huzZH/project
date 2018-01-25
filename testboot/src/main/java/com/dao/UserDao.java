package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.User;
import com.bean.UserMapper;

@Repository
public class UserDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	/**
	 * 根据ID查找用户
	 * 
	 * @param userId
	 * @return
	 */
	public User getUserById(Integer userId) {
		String sql = "select id, name, age, address from user";
		List<User> userList = jdbcTemplate.query(sql, new UserMapper());
		User user = null;
		if (userList.size() > 0) {
			user = userList.get(0);
		}
		return user;
	}
}
