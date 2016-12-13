package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.spring.model.Book;
import com.spring.model.Cart;
import com.spring.model.CartItem;
import com.spring.model.Customer;
import com.spring.services.BookService;
import com.spring.services.CartItemService;
import com.spring.services.CartService;
import com.spring.services.CustomerService;

@Controller
public class CartItemController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private BookService bookService;
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private CartService cartService;
	
	//-----------------  Add Book in CartItem Table and display it on cart page ---------//
	
	@RequestMapping("/cart/add/{isbn}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void addCartItem(@PathVariable(value="isbn") int isbn){
		
		//Is to get the username of the customer
		//User object contains details about the user -username , password, activeuser or not
		
		User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String username=user.getUsername();
		Customer customer=customerService.getCustomerByUsername(username);
		
		System.out.println("Customer is " + customer.getCustomerEmail() );
		
		Cart cart = customer.getCart();
		
		Book book=bookService.getBookByIsbn(isbn);
		List<CartItem> cartItems=cart.getCartItem();
		
		for(int i=0;i<cartItems.size();i++){
			CartItem cartItem=cartItems.get(i);
			if(book.getIsbn()==cartItem.getBook().getIsbn()){
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				cartItem.setPrice(cartItem.getQuantity() * cartItem.getBook().getPrice());
				cartItemService.addCartItem(cartItem);
				return;
			}
		}
		CartItem cartItem=new CartItem();
		cartItem.setQuantity(1);
		cartItem.setBook(book);
		cartItem.setPrice(book.getPrice() * 1);
		cartItem.setCart(cart);
		cartItemService.addCartItem(cartItem);
			
	}
	
	//-----------  Remove particular CartItem from cart (remove) ----------//

	@RequestMapping("/cart/removecartitem/{cartItemId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeCartItem(@PathVariable(value="cartItemId") int cartItemId){
		cartItemService.removeCartItem(cartItemId);
	}

	//-----------  Remove All CartItems from cart (clear cart) ----------//

	@RequestMapping("/cart/removeAllItems/{cartId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeAllCartItems(@PathVariable(value="cartId") int cartId){
		Cart cart=cartService.getCartByCartId(cartId);
		cartItemService.removeAllCartItems(cart);
	}
}
