package com.project.mango.menu;

import java.util.List;

import com.project.mango.cart.CartVO;
import com.project.mango.restaurant.RestaurantVO;

import lombok.Data;

@Data
public class MenuVO {

	private Long menuNum;
	private Long restaurantNum;
	private String name;
	private Long price;
	private String detail;

	//등록할 때 사용
	private List<MenuVO> menuVOList;
	//수정할 때 사용
	private List<MenuVO> menuVOList2;
	
	private MenuFileVO menuFileVO;
	
	private RestaurantVO restaurantVO;
	
	private List<CartVO> cartVOs;
}
