package com.spring.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.BillingAddress;
import com.spring.model.Customer;
import com.spring.model.ShippingAddress;
import com.spring.model.UserDetail;
import com.spring.services.CustomerService;


@Controller
public class RegisterController {

	@Autowired
	private CustomerService customerService;
	
	public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}


	//--------  To display registration form when the user makes the request by the url : /customer/registration (get) -------//

	@RequestMapping("/registration")
	public ModelAndView getRegistrationForm(){
		Customer customer=new Customer();
		UserDetail userDetail=new UserDetail();
		BillingAddress billingAddress=new BillingAddress();
		ShippingAddress shippingAddress=new ShippingAddress();
		
		customer.setUserDetail(userDetail);
		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);
		
		return new ModelAndView("registration","customer",customer);
		
	}

	//------------  to insert the data ----------------//

	@RequestMapping(value="/registration",method=RequestMethod.POST)
	public String registerCustomer(@Valid @ModelAttribute(value="customer")Customer customer,
			BindingResult result,Model model){
		if(result.hasErrors())
			return "registration";
		//get value entered by uesr in registration form
		String username=customer.getUserDetail().getUsername();
		List<Customer> customerList=customerService.getAllCustomers();
		for(Customer c:customerList){
			if(username.equals(c.getUserDetail().getUsername()))
			{
				model.addAttribute("duplicateUname","Username already exists");
				return "registration";
			}
			if(customer.getCustomerEmail().equals(c.getCustomerEmail())){
				model.addAttribute("duplicateEmail","Email Id already exists");
				return "registration";
			}
		}

		customerService.addCustomer(customer);
		model.addAttribute("registrationSuccess","Registered Successfully. Login using username and password");
		return "login";
	}

}
