package com.devpro.javaweb21ExampleDay01.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//1. Báo cho Spring MVC biết đây là cấu hình
//2. Tạo instance của configuration này <=> MVCConf mvc = new MVCConf();
//mvc được lưu vào spring-container(kiểu dữ liệu list, map)
@Configuration
public class MVCConf implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "D:/upload/");
	}
	
	// @Bean báo spring biết cần tạo instance
	// ViewResolver vr = mvc.viewResolver();
	// vr sẽ được lưu vào trong spring-container(kiểu dữ liệu List, Map)
	// spring mvc sẽ sử dụng vr để biết folder chứa view
	@Bean
	public ViewResolver ViewResolver() {
		
		// Class InternalResourceViewResolver implements ViewResolver
		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		// thiết lập view engine
		bean.setViewClass(JstlView.class);

		// Đường dẫn thư mực gốc chứa Views.
		bean.setPrefix("/WEB-INF/views/");

		// Tên đuôi của View
		bean.setSuffix(".jsp");

		return bean;
	}
}
