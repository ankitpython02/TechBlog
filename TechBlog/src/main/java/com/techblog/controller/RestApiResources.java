package com.techblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import com.techblog.entities.User;
import com.techblog.service.TechBlogService;

@RestController
public class RestApiResources {

	@Autowired
	TechBlogService techBlogService;

	// Rest Web Service Method for getting User from their name
	@RequestMapping(value = "/user/{userName}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public User getUserForRest(@PathVariable("userName") String userName) {

		return techBlogService.getUserForRest(userName);

	}

	// Rest Web Service Method for Updating User from their name
	@RequestMapping(value = "/user/{userName}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> updateUserFromRest(@PathVariable("userName") String userName,
			@RequestBody User user) {
		try {

			techBlogService.updateUserFromRest(user, userName);

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Boolean>(true, HttpStatus.NOT_FOUND);
		}

		HttpHeaders httpheaders = new HttpHeaders();
		httpheaders.add("key1", "Value1");
		httpheaders.add("key2", "Value2");

		return new ResponseEntity<Boolean>(true, httpheaders, HttpStatus.OK);
	}

	// Rest Web Service method used for saving the user in db
	@RequestMapping(value = "/user", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> saveUserFromRest(@RequestBody User user) {
		try {

			techBlogService.saveUserFromRest(user);

		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpHeaders httpheaders = new HttpHeaders();
		httpheaders.add("Location", ServletUriComponentsBuilder.fromCurrentRequest().path("/{name}")
				.buildAndExpand(user.getName()).toUri().toString());

		return new ResponseEntity<Boolean>(true, httpheaders, HttpStatus.CREATED);
	}

}
