package com.techblog.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import org.springframework.stereotype.Component;

@Entity
@Component
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", updatable = false, nullable = false)
	private Long id;

	private String title;

	private String content;

	private String code;
	
	private String link;

	@ManyToOne
	private Caterogies caterogies;

	@ManyToOne
	private User user; 

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", content=" + content + ", code=" + code + ", link=" + link
				+ ", caterogies=" + caterogies + ", user=" + user + "]";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Caterogies getCaterogies() {
		return caterogies;
	}

	public void setCaterogies(Caterogies caterogies) {
		this.caterogies = caterogies;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
