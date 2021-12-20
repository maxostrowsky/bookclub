package com.codingdojo.bookClub.Controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.bookClub.Models.Book;
import com.codingdojo.bookClub.Models.LoginUser;
import com.codingdojo.bookClub.Models.User;
import com.codingdojo.bookClub.Service.UserService;

@Controller
public class UserController {
		
	@Autowired
	UserService userServ;
	
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/dashboard";
    }
	
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/dashboard";
    }
    
    @GetMapping("/dashboard")
    public String dashboard(@ModelAttribute("book")Book book, Model model, HttpSession session) {
    	List<Book> books = userServ.allBook();
    	model.addAttribute("books", books);
    	model.addAttribute("user", userServ.findOneUserById((Long) session.getAttribute("user_id")));
    	return "dashboard.jsp";
    }
    
    @GetMapping("/logout")
    public String home(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    @GetMapping ("/book/new")
    public String addBookForm(@ModelAttribute("book")Book book, Model model) {
    	return "newBook.jsp";
    }
    
    @PostMapping("/book/add")
    public String addBookProcess(@Valid @ModelAttribute("book")Book book, BindingResult result, Model model) {
    	if(result.hasErrors()) {
    		return "newBook.jsp";
    	} else {
    		userServ.saveBook(book);
    		return "redirect:/dashboard";
    	}
    }
    
	@GetMapping("/book/{id}")
	public String showBook(@PathVariable("id")Long id, Model model) {
		Book book = userServ.oneBook(id);
		model.addAttribute("book", book);
		return "showBook.jsp";
	}
	
	@GetMapping("/book/edit/{id}")
	public String editBookForm(@PathVariable("id") Long id, Model model) {
		Book book = userServ.oneBook(id);
		model.addAttribute("book", book);
		return "editBook.jsp";
	}
	
	@PutMapping("/book/edit/{id}")
	public String editBookProcess(@Valid @ModelAttribute("book")Book book,  BindingResult result, Model model) {
		if(result.hasErrors()) {
			return"editBook.jsp";
		} else {
			userServ.updateBook(book);
			return "redirect:/dashboard";
		}
	}
	
	@DeleteMapping("/book/delete/{id}")
	public String deleteBook(@PathVariable("id")Long id) {
		userServ.deleteBook(id);
		return "redirect:/dashboard";
	}
    
}
