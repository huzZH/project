package com;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.bean.User;
import com.service.UserService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringTest {

	@Autowired
	private UserService userService;
	
	@Test
	public void getUserTest() {
		int userId = 1;
		User user = userService.getUserById(userId);
		System.out.println(user.toString());
	}
}
