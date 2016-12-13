 package com.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Book;

@Repository
public class BookDaoImpl implements BookDao {
	
	@Autowired
	private SessionFactory sessionFactory;
			
	//------------- DAO Implementation of getAllBooks() method to display list when login -------------//
	
		public List<Book> getAllBooks() {
			Session session=sessionFactory.openSession();
			List<Book> books=session.createQuery("from Book").list();
			session.close();// close the session.
			
			return books;

		}
		
	//------------- DAO Implementation of getBookByIsbn() method to get book by it's ID -------------//

		public Book getBookByIsbn(int i) {
			//reading the record from the table
		  Session session=sessionFactory.openSession();
		  //select * from book where isbn=i
		  //if we call get method,Record doesnot exist it will return null
		  //if we call load, if the record doesnt exist it will throw exception
		  Book book=(Book)session.get(Book.class, i);  
		  session.close();
 		  return book;
		}
		
	//-------- DAO Implementation of deleteBook() method to delete selected book from list using it's ID -------//
	
		public void deleteBook(int isbn) {
			Session session=sessionFactory.openSession();
			//select * from book where isbn=?
			Book book=(Book)session.get(Book.class, isbn);
			//delete from book where isbn=?
			session.delete(book);
			//commit the changes
			//changes to the database will become permanent
			session.flush();
			//closing the connection with the database.
			session.close();//close the session
			
			
		}
		
	//-------- DAO Implementation of addBook() method to add new book in list  -------//

		public void addBook(Book book) {
			Session session=sessionFactory.openSession();
			session.save(book);
			session.close();	
	    }
	
	//-------- DAO Implementation of editBook() method to edit book information from list  -------//

		public void editBook(Book book) {
			Session session=sessionFactory.openSession();
			//update bookapp set ....where isbn=?
			session.update(book);
			session.flush();
			session.close();
	    }

	//---------  DAO Implementation of displayAllBooks() method to display list ---------//

		public List<Book> displayAllBooks() {
			Session session=sessionFactory.openSession();
			List<Book> books=session.createQuery("from Book").list();
			session.close();// close the session.
			
			return books;		
			
		}

	}

