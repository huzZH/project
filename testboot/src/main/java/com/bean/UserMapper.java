package com.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet result, int arg1) throws SQLException {
		User user = new User();
		user.setId(result.getInt(1));
		user.setName(result.getString(2));
		user.setAge(result.getInt(3));
		user.setAddress(result.getString(4));
		return user;
	}

}
