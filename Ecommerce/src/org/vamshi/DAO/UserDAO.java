package org.vamshi.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.vamshi.DTO.CartPojo;
import org.vamshi.DTO.UserPojo;

public class UserDAO {
	
	Configuration configuration = new Configuration().configure();
	StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
	applySettings(configuration.getProperties());
	SessionFactory factory = configuration.buildSessionFactory(builder.build());
	Session session = factory.openSession();
	
	
	public void createUser(String userId, String password, double balance){
		try {
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			UserPojo newUser = new UserPojo();
			newUser.setUserName(userId);
			newUser.setPassword(password);
			newUser.setBalance(balance); 
			newUser.setCartBalance(0);
			session.save(newUser);
			transaction.commit();			
		} catch(HibernateException e){
			e.printStackTrace();
		} finally{
			session.close();
		}
	}
	
	//Validation method when creating new user.
	//Returns true if userName entered is unique, allowing user to create user.
	@SuppressWarnings("finally")
	public boolean verifyUserName(String userName){
		boolean ans = false;
		try{
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("FROM UserPojo WHERE USER_NAME = :temp");
			query.setParameter("temp", userName);
			@SuppressWarnings("unchecked")
			List<?> result = query.list();
			//If DB search for userName returns nothing, set ans to true.
			if(result.size()==0){
				ans = true;
			}
			transaction.commit();
		} catch(HibernateException e){
			e.printStackTrace();
		} finally{
			session.close();
			return ans;
		}
	}
	
	//Returns true if login credentials match DB.
	@SuppressWarnings("finally")
	public boolean loginVerification(String userName, String password){
		boolean ans = false;
		try{
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("FROM UserPojo WHERE USER_NAME = :temp");
			query.setParameter("temp", userName);
			List<?> result = query.list(); 
			UserPojo user = (UserPojo) result.get(0); //List should only have one item.
			if(user.getUserName().equals("") && user.getPassword().equals("")){
				ans = true;
			}
			if(user.getUserName().equals(userName) && user.getPassword().equals(password)){
				ans = true;
			}
			transaction.commit();
		} catch(HibernateException e){
			e.printStackTrace();
		} finally{
			session.close();
			return ans;
		}
	}
	
	//Returned List is length 2
	//Position 0: If the user was created and saved to DB successfully.
	//Position 1: User's Primary Key from UserPojo table.
	@SuppressWarnings("finally")
	public ArrayList<Object> getUserPojoDetails(String userId, String password){
		ArrayList<Object> answer = new ArrayList<Object>();
		boolean response = false;  //True if user credentials match DB.
		int userIdNum = 0;
		try {
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("from UserPojo where USER_NAME = :verifyName");
			query.setParameter("verifyName", userId);
			List<?> result = query.list();
			UserPojo user = (UserPojo) result.get(0);//result list always should be max 1 length
			if(user.getPassword().equals(password)){	//Validation check for unique names at user creation.
				response = true;
				userIdNum = user.getId();
			} else {
				response = false;
			}
			transaction.commit();
		} catch(HibernateException e){
			e.printStackTrace();
		} finally{
			answer.add(response);
			answer.add(userIdNum); //This is so you can add userId number to the session upon login.
			session.close();
			return answer;
		}
	}
		
	@SuppressWarnings("unchecked")
	public void checkout(int userIdNumber){
		try{
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			//Getting user to get access to user's balance.
			Query query = session.createQuery("from UserPojo where USER_ID = :userNum");
			query.setParameter("userNum", userIdNumber);
			List<UserPojo> userList = query.list();
			//Getting all cart objects belonging to current user.
			Query query2 = session.createQuery("from CartPojo where USER_ID = :userNumber");
			query2.setParameter("userNumber", userIdNumber);
			List<CartPojo> result = query2.list(); //list of cartpojos
			//Summing up all cart items 
			double cartTotal = 0;
			for(CartPojo item:result){
				cartTotal = cartTotal + item.getItemPrice();
			}
			double newBalance = userList.get(0).getBalance() - cartTotal;
			//Update the user's balance.
			Query updateBalance = session.createQuery("UPDATE UserPojo set balance = :newBal WHERE USER_ID = :number");
			updateBalance.setParameter("newBal", newBalance);
			updateBalance.setParameter("number", userIdNumber);
			updateBalance.executeUpdate();
						
			//Clear the User's cart.
			Query deleteCart = session.createQuery("DELETE FROM CartPojo WHERE USER_ID = :uniqueNum");
			deleteCart.setParameter("uniqueNum", userIdNumber);
			deleteCart.executeUpdate();
			transaction.commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	@SuppressWarnings({ "finally", "unchecked" })
	public double getCurrentBalance(String userId){
		double currentBal = 0;
		try{
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("from UserPojo where USER_NAME = :verifyName");
			query.setParameter("verifyName", userId);
			List<UserPojo> result = query.list();
			currentBal = (result.get(0)).getBalance();
			transaction.commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
			return currentBal;
		}
	}	
}