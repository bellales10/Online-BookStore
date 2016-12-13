package com.spring.dao;

import java.io.IOException;

import com.spring.model.Cart;

public interface CartDao {

	Cart getCartByCartId(int cartId);
	void update(Cart cart);
	Cart validate(int cartId) throws IOException;

}
