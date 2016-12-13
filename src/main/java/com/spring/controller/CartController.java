package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.Cart;
import com.spring.model.Customer;
import com.spring.services.CartService;
import com.spring.services.CustomerService;

@Controller
public class CartController {
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CartService cartService;
	
   //--------- get cartId for displaying cart page  ----------//
	
	@RequestMapping("/cart/getCartId")
	public String getCartId(Model model){
		
		User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String username=user.getUsername();
		Customer customer=customerService.getCustomerByUsername(username);
		
		model.addAttribute("cartId",customer.getCart().getCartId());
		return "cart";
	}
	
	@RequestMapping("/cart/getCart/{cartId}")
	public @ResponseBody Cart getCartItems(
			@PathVariable(value="cartId") int cartId){
		return cartService.getCartByCartId(cartId);
	}


}
