package com.spring.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.model.CustomerOrder;

@Repository
@Transactional
public class CustomerOrderDaoImpl implements CustomerOrderDao {

    @Autowired
    private SessionFactory sessionFactory;

	//---------  DAO Implementation of addCustomerOrder() method to add customer details in order table ---------//

    public void addCustomerOrder(CustomerOrder customerOrder){
        Session session = sessionFactory.openSession();
        session.saveOrUpdate(customerOrder);
        session.flush();
    }
	
}
