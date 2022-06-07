package com.project.mango.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.mango.interceptor.CartInterceptor;
import com.project.mango.interceptor.ManagerInterceptor;
import com.project.mango.interceptor.OrderInterceptor;
import com.project.mango.interceptor.OwnerInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{

	@Autowired
	private ManagerInterceptor managerInterceptor;
	@Autowired
	private OwnerInterceptor ownerInterceptor;
	
	@Autowired
	private CartInterceptor cartInterceptor;
	
	@Autowired
	private OrderInterceptor orderInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//적용할 interceptor 등록
		registry.addInterceptor(managerInterceptor)
		//interceptor 사용할url
			.addPathPatterns("/manager/*");
		
		registry.addInterceptor(ownerInterceptor)
		.addPathPatterns("/owner/*");

		
		registry.addInterceptor(cartInterceptor)
				.addPathPatterns("/cart/*");
		
		registry.addInterceptor(orderInterceptor)
				.addPathPatterns("/cart/order")
				.addPathPatterns("/cart/kakaoPay")
				.addPathPatterns("/cart/tossPay")
				.addPathPatterns("/cart/orderComplete")
				.addPathPatterns("/cart/kakaoPayOrderComplete")
				.addPathPatterns("/cart/tossPayOrderComplete");
		
	}	

}
