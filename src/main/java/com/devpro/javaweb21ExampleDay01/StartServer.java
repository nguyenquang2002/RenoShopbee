package com.devpro.javaweb21ExampleDay01;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/** 
 * Cú pháp chạy 1 ứng dụng Spring-boot
 * 1. Class phải có annotation với @SpringBootApplication
 * 2. Trong hàm main có SpringApplication.run(StartSever.class, args);
 * @author QUANG
 * 
 */

@SpringBootApplication

public class StartServer {
	public static void main(String[] args) {
		SpringApplication.run(StartServer.class, args);
	}
}
