package com.techblog.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import com.techblog.entities.Caterogies;
import com.techblog.entities.MyMessages;
import com.techblog.entities.Post;
import com.techblog.entities.User;
import com.techblog.service.TechBlogService;

@Controller
public class Controllers {

	// private static Logger log = Logger.getLogger(Controllers.class);

	@Autowired
	TechBlogService techBlogService;

	@Autowired
	ModelAndView modelAndView;

	
	// Registering user
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView userRegistration(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {
		System.out.println(user.toString());
		String check = request.getParameter("check");
		if (check == null) {
			System.out.println("Please Check Terms & Condition");
		} else {
			techBlogService.save(user);
		}
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	// Validating login of User
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView userLoging(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletRequest request) {
		User user = techBlogService.loginUser(email, password);
		/* List<Caterogies> list = techBlogService.getAllCaterogries(); */
		
		try {
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);
				/* modelAndView.addObject("list", list); */
				modelAndView.setViewName("profile_page");
			} else {
				MyMessages msg = new MyMessages("Invalid User!! Please try again", "error", "alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				modelAndView.setViewName("login_page");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return modelAndView;
	}
	
	//This method is user logout
	@RequestMapping(value = "/logout")
	public ModelAndView userLogout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		MyMessages m = new MyMessages("Logout Successfully", "success", "alert-success");
		session.setAttribute("msg", m);
		modelAndView.setViewName("login_page");

		return modelAndView;
	}
	
	// Updating the User using Fetching the User From DB
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public ModelAndView userUpdate(@RequestParam long id, @ModelAttribute User user, HttpServletRequest request ) {
		try {
			techBlogService.updateUser(user, id);
			HttpSession session = request.getSession();
			User u = techBlogService.getUser(user);
			session.setAttribute("currentUser", u);
			modelAndView.setViewName("profile_page");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Profile not Updated");
		}
		return modelAndView;
	}
	
	
	//Getting categories from DB
	@RequestMapping(value = "/getCat", method = RequestMethod.GET) 
	public ModelAndView getCaterogies(HttpServletRequest request    ) {
			List<Caterogies> list = techBlogService.getAllCaterogries();
			
			for (Caterogies c : list) {
				System.out.println(c.getName());
			}
			modelAndView.addObject("list", list);
			modelAndView.setViewName("profile_page");
			return modelAndView;
	}
	
	//Saving post in DATABASE
	@RequestMapping(value = "/addPost", method = RequestMethod.POST)
	public ModelAndView getPostData(@RequestParam long id, @ModelAttribute("postform") Post post, SessionStatus status,
			WebRequest request, HttpSession session) {

		techBlogService.saveBlogPost(post, id);
		
		/*
		 * status.setComplete(); request.removeAttribute("post",
		 * WebRequest.SCOPE_SESSION);
		 */
		System.out.println("POST session removed");
		//modelAndView.setViewName("profile_page");
		return modelAndView;
	}
	
	//Fetching All Post From Database
	@RequestMapping(value = "/getAllPost", method = RequestMethod.GET)
	public ModelAndView getPost() {
		List<Post> post = techBlogService.getAllPost();
		
		for (Post p : post) {
			System.out.println(p.getTitle() + " " + p.getId() + " " + p.getLink());
		}
		modelAndView.addObject("post", post);
		modelAndView.setViewName("profile_page");
		return modelAndView;
}
	
	
	
	

}
