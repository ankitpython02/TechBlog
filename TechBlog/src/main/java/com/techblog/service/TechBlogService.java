package com.techblog.service;

import java.util.List;

import com.techblog.entities.Caterogies;
import com.techblog.entities.Post;
import com.techblog.entities.User;

public interface TechBlogService {

	// Registering user
	public boolean save(User user);

	// Validating login of User
	public User loginUser(String email, String password);

	// Updating the User
	public User updateUser(User user, Long id);

	// Fetching the User From DB
	public User getUser(User user);

	// Getting categories from DB
	public List<Caterogies> getAllCaterogries();

	// Saving post in DATABASE
	public Post saveBlogPost(Post post, Long id);

	// Fetching All Post From Database
	public List<Post> getAllPost();

	// Rest Web Service Method for getting User from their name
	public User getUserForRest(String name);

	// Rest Web Service Method for Updating User from their name
	public User updateUserFromRest(User user, String name);

	// Rest Web Service method used for saving the user in db
	public User saveUserFromRest(User user);

}
