package com.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Cart;
import com.spring.model.CartItem;

@Repository
public class CartItemDaoImpl implements CartItemDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addCartItem(CartItem cartItem) {
 		Session session=sessionFactory.openSession();
 		session.saveOrUpdate(cartItem);
 		session.flush();
 		session.close();
 		
	}
	
	public void removeCartItem(int cartItemId) {
		Session session=sessionFactory.openSession();
		CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId);
		session.delete(cartItem);
		Cart cart=cartItem.getCart();
		List<CartItem> cartItems=cart.getCartItem();
		cartItems.remove(cartItem);
		session.flush();
		session.close();
	}

	public void removeAllCartItems(Cart cart) {
		List<CartItem> cartItems=cart.getCartItem();
		for(CartItem cartItem:cartItems){
			removeCartItem(cartItem.getCartItemId());
		}
	}
}
