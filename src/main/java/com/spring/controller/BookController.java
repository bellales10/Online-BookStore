package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Book;
import com.spring.model.Category;
import com.spring.services.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;

	//-------------    display the list of Books in JSON format	-----------//
	
	@RequestMapping("/getBooksList")
	public @ResponseBody List<Book> getBooksListInJSON(){  //@responseBody- convert java object into JSON format
		return bookService.getAllBooks();
	}

	//-------------    display the list of Books ----------//

	@RequestMapping("/getAllBooks")
	public ModelAndView getAllProducts(){
		List<Book> books = bookService.getAllBooks();
		return new ModelAndView("bookList","books",books);
	}
	
	//-------------    display the list of Books ----------//

	@RequestMapping("/displayList")
	public ModelAndView getbookList(){
		List<Book> books = bookService.displayAllBooks();
		return new ModelAndView("displayBookList","books",books);
	}
	
	//-------------    display the Book detail by their id or ISBN   -----------//

	@RequestMapping("getBookByIsbn/{isbn}")
	public ModelAndView getBookByIsbn(@PathVariable(value="isbn") int isbn){
		Book b=bookService.getBookByIsbn(isbn);
		return new ModelAndView("bookPage","bookObj",b);
	}
	
	//-------------   Delete selected Book from Book list or table	-----------//

	@RequestMapping("/admin/book/delete/{isbn}")
	public String deleteBook(@PathVariable(value="isbn") int isbn){
		Path path=Paths.get("C:/Users/Danish/project/Hibernate/src/main/webapp/WEB-INF/resources/images/" + isbn + ".jpg");
		if(Files.exists(path))
				{
			           try {
						Files.delete(path);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		bookService.deleteBook(isbn);
		//http://localhost:8080/appname/getAllBooks
		return "redirect:/getAllBooks";
	}

	//-------------  Get Book Form to add Book in Book list using GET Method  -----------//

	@RequestMapping(value="/admin/book/addBook",method=RequestMethod.GET)
	public String getBookForm(Model model){
		Book book=new Book();
		Category category=new Category();
		category.setCid(1);
		//New Arrivals
		//set the category as 1 for the Book book
		book.setCategory(category);
		model.addAttribute("bookFormObj",book);
		return "bookForm";
	}

	//-------------  Add New Book In Book List using HTTP POST Method   -----------//

	@RequestMapping(value="/admin/book/addBook",method=RequestMethod.POST)
	public String addBook( @Valid @ModelAttribute(value="bookFormObj")  Book book,BindingResult result){
		if(result.hasErrors())
			return "bookForm";
		bookService.addBook(book);
	MultipartFile image=book.getBookImage();
		if(image!=null && !image.isEmpty()){
		Path path=Paths.get("C:/Users/Danish/project/Hibernate/src/main/webapp/WEB-INF/resources/images/" 
		+ book.getIsbn() + ".jpg");
		try {
			image.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
	 		// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		return "redirect:/getAllBooks";
  }

	//-----------  get editForm to Edit the details of selected Book from Book list using GET method	-----------//

	@RequestMapping("/admin/book/editBook/{isbn}")
	public ModelAndView getEditForm(@PathVariable(value="isbn")  int isbn){
		//First read the record which has to be updated
		//select * from book where isbn=?
		//Populate the form with already existing value
		Book book=this.bookService.getBookByIsbn(isbn);
		return new ModelAndView("editBookForm","editBookObj",book);
	}
	
	//-------------  Edit the details of selected Book from Book list using POST method	-----------//

	@RequestMapping(value="/admin/book/editBook",method=RequestMethod.POST)
	public String editBook(@ModelAttribute(value="editBookObj") Book book){
	    bookService.editBook(book);
	    return "redirect:/getAllBooks";
	}

}   

