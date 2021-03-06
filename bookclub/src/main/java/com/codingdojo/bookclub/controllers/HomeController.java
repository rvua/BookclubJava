package com.codingdojo.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
    private UserService userServ;
	@Autowired
	private BookService bookServ;
//    public HomeController(BookService bookServ) {
//    	this.bookServ = bookServ;
//    }
	// This route renders the form for login and reg
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    // This route is the action for submitting the registration form
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        // This calls on the register method in service - sends in the newUser info and the results from the BindingResult 
    	userServ.register(newUser, result);
        // If we have any errors we stay on that page and display the errors
    	if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
    	// If everything is good, set the UseId in session
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/dashboard";
    }
    
    // This route is the action for submitting the login form
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
    	User user = userServ.login(newLogin, result);
        // If we have any errors we stay on the page and display errors
    	if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    	// If no errors, set the UserId in session
        session.setAttribute("user_id", user.getId());
        return "redirect:/dashboard";
    }
    
    // Method for Logging Out 
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("user_id");
    	return "redirect:/";
    }
    
	
	//@RequestMapping("/") 
	//public String index() {
		//return "index.jsp";
	//}

	@RequestMapping("/dashboard") 
	public String dashboard(Model model, HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			Long user_id = (Long) session.getAttribute("user_id");
			model.addAttribute("user", userServ.oneUser(user_id));
			model.addAttribute("books", bookServ.allBooks());
			return "dashboard.jsp";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/newBook") 
	public String newBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		Long user_id = (Long) session.getAttribute("user_id");
		model.addAttribute("user", userServ.oneUser(user_id));
		return "newBook.jsp";
	}
	
	@RequestMapping("/processBook")
	public String processBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Error");
			return "newBook.jsp";
		}
		bookServ.create(book);
		return "redirect:/dashboard";
	}
	
	@RequestMapping("/oneBook/{id}") 
	public String oneBook(@PathVariable("id") Long id, Model model) {
		model.addAttribute("book", bookServ.oneBook(id));
		return "oneBook.jsp";
	}
	
	@RequestMapping("/editBook/{id}") 
	public String editBook(@PathVariable("id") Long id, Model model) {
		Book book = bookServ.oneBook(id);
		model.addAttribute("book", book);
		return "editBook.jsp";
	}
	
	@RequestMapping(value="/editingBook/{id}", method=RequestMethod.PUT)
	public String editingBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "editBook.jsp";
		} else {
			bookServ.editBook(book);
			return "redirect:/dashboard";
		}
	}
	
}
