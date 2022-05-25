package com.project.mango.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.order.PaymentDetailVO;
import com.project.mango.order.PaymentVO;

@Mapper
public interface CartMapper {

	// cartList
	public List<CartVO> cartList(CartVO cartVO) throws Exception;
	
	// cartListDelete
	public int cartListDelete(Long caNum) throws Exception;
	
	// cartOrder
	public CartVO cartOrder(Long cartNum) throws Exception;
	
	// order
	public int order(PaymentVO paymentVO) throws Exception;
	
	// detailOrder
	public int detailOrder(PaymentDetailVO paymentDetailVO) throws Exception;
	
}