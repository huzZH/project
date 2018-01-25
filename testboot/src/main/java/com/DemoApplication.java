package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class DemoApplication {

	@RequestMapping("/")
	String home() {
		return "Hellrld!";
	}

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
		/*
		 * SpringApplication app = new SpringApplication(DemoApplication.class);
		 * app.setBannerMode(Banner.Mode.OFF); app.run(args);
		 */
	}
}
