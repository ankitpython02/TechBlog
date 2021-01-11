package com.techblog.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import com.techblog.entities.Caterogies;
import com.techblog.entities.Post;
import com.techblog.entities.User;

public class TechBlogDaoImp implements TechBlogDao {

	// private static Logger log = Logger.getLogger(TechBlogDaoImp.class);

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// Registering user
	public Boolean save(User user) {
		Boolean f = false;
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(user);
			tx.commit();
			session.close();
			f = true;
		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return f;

	}

	// Validating login of User
	public User loginUser(String email, String password) {
		User user = null;
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from User u where u.email=:email and u.password=:password";
		try {
			Query query = (Query) session.createQuery(hql);
			query.setParameter("email", email);
			query.setParameter("password", password);
			user = (User) query.uniqueResult();
			if (user != null) {
				System.out.println("Login Successfull");
				tx.commit();
				session.close();
			} else {

				System.out.println("User/Password Doesn't Match");
			}

		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();

		}

		return user;

	}

	// Updating the User
	public User updateUser(User user, Long id) {

		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "UPDATE User as u set name = :name, email = :email , password =:password , about = :about "
					+ "WHERE id = :uid";
			Query query = session.createQuery(hql);
			query.setParameter("name", user.getName());
			query.setParameter("email", user.getEmail());
			query.setParameter("password", user.getPassword());
			query.setParameter("about", user.getAbout());
			query.setParameter("uid", id);
			int result = query.executeUpdate();
			System.out.println("Profile Update " + result);
			tx.commit();
			session.close();
		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return user;
	}

	// Fetching the User From DB
	public User getUser(User user) {

		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from User as U WHERE id = :uid";
		try {

			Query query = session.createQuery(hql);
			query.setParameter("uid", user.getId());
			user = (User) query.uniqueResult();

			tx.commit();
			session.close();
		}

		catch (Exception e) {

			tx.rollback();
			session.close();
			e.printStackTrace();

		}
		return user;
	}

	// Getting categories from DB
	public List<Caterogies> getAllCaterogries() {
		List<Caterogies> list = new ArrayList<Caterogies>();
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String sqlQstring = "select c.* from POST_CATEROGIES c";
		try {
			SQLQuery query = session.createSQLQuery(sqlQstring);
			query.addEntity(Caterogies.class);
			List<Caterogies> categories = query.list();
			for (Caterogies c : categories) {
				list.add(c);
			}
		} catch (Exception e) {

			tx.rollback();
			session.close();
			e.printStackTrace();

		}
		return list;
	}

	// Saving post in DATABASE
	public Post saveBlogPost(Post post, Long id) {
		Caterogies cat = new Caterogies();
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String sqlQstring = "insert into post ( id , code , content , link , title , caterogies_id  , user_id ) "
				+ " values (:id , :code , :content , :link , :title , :caterogies_id , :user_id );";
		try {
			SQLQuery query = session.createSQLQuery(sqlQstring);
			query.setParameter("id", post.getId());
			query.setParameter("code", post.getCode());
			query.setParameter("content", post.getContent());
			query.setParameter("link", post.getLink());
			query.setParameter("title", post.getTitle());
			query.setParameter("caterogies_id", cat.getId());
			query.setParameter("user_id", id);
			query.executeUpdate();
			tx.commit();
			session.close();
		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();

		}
		return null;
	}

	// Fetching All Post From Database
	public List<Post> getAllPost() {
		List<Post> list = new ArrayList<Post>();
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from Post";
		try {
			Query query = session.createQuery(hql);
			List<Post> post = query.list();
			for (Post p : post) {
				list.add(p);
			}

		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}

		return list;
	}

	// Rest Web Service Method for getting User from their name
	public User getUserForRest(String name) {
		User u = new User();
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from User as U WHERE name = :uname";
		try {
			Query query = session.createQuery(hql);
			query.setParameter("uname", name);
			u = (User) query.uniqueResult();
			tx.commit();
			session.close();
		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();

		}

		return u;
	}

	// Rest Web Service Method for Updating User from their name
	public User updateUserFromRest(User user, String name) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "UPDATE User as u set email = :email , password =:password , about = :about "
					+ "WHERE name = :name";
			Query query = session.createQuery(hql);
			query.setParameter("email", user.getEmail());
			query.setParameter("password", user.getPassword());
			query.setParameter("about", user.getAbout());
			query.setParameter("name", name);
			int result = query.executeUpdate();
			System.out.println("Profile Update " + result);
			tx.commit();
			session.close();
		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return user;
	}

	// Rest Web Service method used for saving the user in db
	public User saveUserFromRest(User user) {

		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String sqlQstring = "insert into User ( name , password , email , gender , about ) "
				+ " values (:name , :password , :email , :gender , :about);";
		try {
			SQLQuery query = session.createSQLQuery(sqlQstring);
			query.setParameter("name", user.getName());
			query.setParameter("password", user.getPassword());
			query.setParameter("email", user.getEmail());
			query.setParameter("gender", user.getGender());
			query.setParameter("about", user.getAbout());
			query.executeUpdate();
			tx.commit();
			session.close();
		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();

		}
		return null;
	}

}
