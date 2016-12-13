package com.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Cart;
import com.spring.model.Customer;
import com.spring.model.UserCredential;
import com.spring.model.UserDetail;


@Repository
public class CustomerDaoImpl implements CustomerDao{
	
@Autowired
private SessionFactory sessionFactory;

//---------  DAO Implementation of addCustomer() method to add customer details in each table when user login  --------//

	public void addCustomer(Customer customer) {
		Session session = sessionFactory.openSession();
	
		UserCredential user=new UserCredential();
		String username=customer.getUserDetail().getUsername();
		user.setUsername(username);
		user.setRole("ROLE_USER");
		
		UserDetail userDetail=customer.getUserDetail();
		userDetail.setEnabled(true);
		
		Cart cart = new Cart();//new cart
		//if we omit this statement, then it will insert null for customerid in cart
		//to set the customerid in cart table
		cart.setCustomer(customer); 
		//It is to set CartId for Customer table
		customer.setCart(cart);//set the cart to the customer
		

		session.saveOrUpdate(customer);
		session.saveOrUpdate(user);
		session.saveOrUpdate(cart);
		session.flush();
          session.close();
	}


	public List<Customer> getAllCustomers() {
			Session session=sessionFactory.openSession();
			List<Customer> customer=session.createQuery("from Customer").list();
			return customer;
		}

   	public Customer getCustomerByUsername(String username) {
		Session  session=sessionFactory.openSession();
		Query query=session.createQuery("from UserDetail where username = ?");
		query.setString(0, username);
		UserDetail user=(UserDetail)query.uniqueResult();
		Customer customer=user.getCustomer();
		return customer;
	}

}
