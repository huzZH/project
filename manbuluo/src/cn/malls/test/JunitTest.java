package cn.malls.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.malls.bean.Account;
import cn.malls.service.AccountService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class JunitTest {

	@Autowired
	private AccountService accountService;
	@Test
	public void save() throws Exception{
		Account account = new Account();
	//	account.setId(2);
		account.setUsername("123");
		account.setPassword("1234");
		accountService.createAccount(account);
	}
	
	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss:SS");
		String format = sim.format(date);
		System.out.println(format);
		
	}
}
