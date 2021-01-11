package com.techblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.techblog.dao.TechBlogDao;
import com.techblog.entities.Caterogies;
import com.techblog.entities.Post;
import com.techblog.entities.User;

public class TechBlogServiceImp implements TechBlogService {

	@Autowired
	TechBlogDao techBlogDao;

	public TechBlogDao getTechBlogDao() {
		return techBlogDao;
	}

	public void setTechBlogDao(TechBlogDao techBlogDao) {
		this.techBlogDao = techBlogDao;
	}

	// Registering user
	public boolean save(User user) {

		return techBlogDao.save(user);
	}

	// Validating login of User
	public User loginUser(String email, String password) {
		return techBlogDao.loginUser(email, password);
	}

	// Updating the User
	public User updateUser(User user, Long id) {

		return techBlogDao.updateUser(user, id);
	}

	// Fetching the User From DB
	public User getUser(User user) {

		return techBlogDao.getUser(user);
	}

	// Getting categories from DB
	public List<Caterogies> getAllCaterogries() {

		return techBlogDao.getAllCaterogries();
	}

	// Saving post in DATABASE
	public Post saveBlogPost(Post post, Long id) {

		return techBlogDao.saveBlogPost(post, id);
	}

	// Fetching All Post From Database
	public List<Post> getAllPost() {
		return techBlogDao.getAllPost();
	}

	// Rest Web Service Method for getting User from their name
	public User getUserForRest(String name) {

		return techBlogDao.getUserForRest(name);
	}

	// Rest Web Service Method for Updating User from their name
	public User updateUserFromRest(User user, String name) {

		return techBlogDao.updateUserFromRest(user, name);
	}

	// Rest Web Service method used for saving the user in db
	public User saveUserFromRest(User user) {
		return techBlogDao.saveUserFromRest(user);
	}

}
