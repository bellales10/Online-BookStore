package com.spring.dao;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.model.Cart;
import com.spring.services.CustomerOrderService;

@Repository
@Transactional
public class CartDaoImpl implements CartDao {

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private CustomerOrderService orderService;

	//---------  DAO Implementation of getCartByCartId() method to get cart by it's cartId ---------//

	public Cart getCartByCartId(int cartId) {
		Session session=sessionFactory.openSession();
		Cart cart=(Cart)session.get(Cart.class, cartId);
		System.out.println(cart.getCartId()+""+cart.getCartItem());
		session.close();
		return cart;
		}
	
	//---------  DAO Implementation of update() method to update cart ---------//

		@Transactional
		public void update(Cart cart){
		int cartId = cart.getCartId();
		double grandTotal =orderService.getCustomerOrderGrandTotal(cartId);
		cart.setTotalPrice(grandTotal);
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(cart);
		session.getTransaction().commit();
		//session.flush();
		session.close();
		}
		
	//---------  DAO Implementation of validate() method to update cart when checkout (order) flow start  --------//

		@Transactional
		public Cart validate(int cartId) throws IOException{
		Cart cart = getCartByCartId(cartId);
		if(cart == null || cart.getCartItem().size() == 0){
		throw new IOException(cartId + "");
		}
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		update(cart);
		session.getTransaction().commit();
		return cart;
		}

		}