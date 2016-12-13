package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.Cart;
import com.spring.model.Customer;
import com.spring.model.CustomerOrder;
import com.spring.services.CartService;
import com.spring.services.CustomerOrderService;


@Controller
public class OrderController {

	@Autowired 
	private CustomerOrderService orderService;
	@Autowired
	private CartService cartService;

	@RequestMapping("/order/{cartId}")
	public String createOrder(@PathVariable("cartId") int cartId ){
		
		CustomerOrder customerOrder=new CustomerOrder();
		Cart cart=cartService.getCartByCartId(cartId);      //update cartId for CustomerOrder-set cartId
		
		customerOrder.setCart(cart);
		Customer customer=cart.getCustomer(); 
		customerOrder.setCustomer(customer);     //set customerId
		customerOrder.setBillingAddress(customer.getBillingAddress());     //set billingAddressId
		customerOrder.setShippingAddress(customer.getShippingAddress());   //set shippingAddressId
		
		orderService.addCustomerOrder(customerOrder);
		
		return "redirect:/checkout?cartId=" + cartId;
		
	}
	
}	
	
