package com.jspmvc3;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UserController {

	@Autowired
	EntityManager em;
	
//	To redirect the page to create page 
	@RequestMapping("/createpage")
	public ModelAndView createPage() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("create.jsp");
		return mav;
	}
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index.jsp");
		return mav;
		
	}
	
//	To save all the user info
	@RequestMapping("/save")
	public ModelAndView saveUser( @RequestParam String name ,@RequestParam String city,@RequestParam String email,@RequestParam String password,@RequestParam String phone ) {
		
		User u  = new User();
		u.setCity(city);
		u.setEmail(email);
		u.setName(name);
		u.setPassword(password);
		u.setPhone(phone);
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.merge(u);
		et.commit();
		Query q = em.createQuery("from User");
		List<User> users = q.getResultList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AllUserPage.jsp");
		mav.addObject("msg","User create Succesfully ");
		mav.addObject("users",users);
		return mav;
	}
	
//	To see all the user
	@RequestMapping("/alluser")
	public ModelAndView findAllUser() {
		ModelAndView mav = new ModelAndView();
	
		Query q = em.createQuery("from User");
		List<User> users = q.getResultList();
		mav.setViewName("AllUserPage.jsp");
		mav.addObject("users",users);
		return mav;
	}
	
//	To delete the entity
	@RequestMapping("/delete")
	public ModelAndView deleteUserByID(@RequestParam int id) {
	
		User user = em.find(User.class, id);
		ModelAndView mav = new ModelAndView();
		
		if(user!=null) {
			EntityTransaction etEntityTransaction  = em.getTransaction();
			etEntityTransaction.begin();
			em.remove(user);
			etEntityTransaction.commit();
			Query q = em.createQuery("from User");
			List<User> users = q.getResultList();
			mav.addObject("users",users);
			mav.setViewName("AllUserPage.jsp");
			mav.addObject("msg","User delete Succesfully ");
			return mav;
		}	
		Query q = em.createQuery("from User");
		List<User> users = q.getResultList();
		mav.addObject("users",users);
		mav.setViewName("AllUserPage.jsp");
		mav.addObject("msg","Unable delete the user,... Invalide User Id");
		return mav;
	}
	
//	TO redirect to the update page 
		@RequestMapping("/updatepage")
		public ModelAndView updatepage(@RequestParam int id)
		{
			ModelAndView mav = new ModelAndView();
			User users = em.find(User.class, id);
			mav.setViewName("update.jsp");
			mav.addObject("users",users);	
			return mav;
			
		}
		
//		To update the given row 
		@RequestMapping("/update")
		public ModelAndView update(@RequestParam int id, @RequestParam String name ,@RequestParam String city,@RequestParam String email,@RequestParam String password,@RequestParam String phone ) {
			ModelAndView mav  = new ModelAndView();
			User user = em.find(User.class, id);
			user.setName(name);
			user.setCity(city);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(phone);
			
			EntityTransaction et = em.getTransaction();
			et.begin();
			em.merge(user);
			et.commit();
			
			Query q =em.createQuery("from User");
			List<User> users = q.getResultList();
			mav.addObject("users",users);
			mav.setViewName("AllUserPage.jsp");
			return mav;
			
		}
		
//		To search the given entity 
		@RequestMapping("/search")
		public ModelAndView search(@RequestParam String sq )
		{
			Query q = em.createQuery("from User");
			List<User> ul = q.getResultList();
			ArrayList<User> users = new ArrayList<User>();
			
			for(User  u: ul) {
				if( (u.getId() + "").equalsIgnoreCase(sq) || u.getName().equalsIgnoreCase(sq) || u.getCity().equalsIgnoreCase(sq) || u.getEmail().equalsIgnoreCase(sq) || u.getPhone().equalsIgnoreCase(sq) || u.getPassword().equalsIgnoreCase(sq)) {	
					users.add(u);
				}
			}
			ModelAndView mav = new ModelAndView();
			mav.setViewName("AllUserPage.jsp");
			mav.addObject("users",users);
			mav.addObject("msg","Search entry ");
			return mav;
		}
}
