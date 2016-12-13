package com.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.CartDao;
import com.spring.model.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;

	public Cart getCartByCartId(int cartId) {
		return cartDao.getCartByCartId(cartId);
	}

	public void update(Cart cart) {
         cartDao.update(cart);		
	}
}
