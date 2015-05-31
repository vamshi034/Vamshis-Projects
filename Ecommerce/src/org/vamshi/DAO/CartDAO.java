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

public class CartDAO {
	
	Configuration configuration = new Configuration().configure();
	StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
	applySettings(configuration.getProperties());
	SessionFactory factory = configuration.buildSessionFactory(builder.build());
	Session session = factory.openSession();
	
	//Adding an item to the cart
	public void addItemToCart(String userName, double itemPrice, String itemName){
		try{
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			CartPojo newItem = new CartPojo();
			Query query = session.createQuery("FROM UserPojo WHERE USER_NAME = :userName");
			query.setParameter("userName", userName);
			List<?> result = query.list();
			UserPojo user = (UserPojo) result.get(0);//result list always should be max 1 length.
			newItem.setItemName(itemName);
			newItem.setItemPrice(itemPrice);
			user.setCartBalance(user.getCartBalance()+itemPrice);
			newItem.setUser(user);//Passing the user object that this cart item will be linked to
			session.save(newItem);
			transaction.commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	@SuppressWarnings("finally")
	public String removeItemFromCart(int userIdNum, String name, int quantity){
		String response = "failure";
		try {
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("FROM CartPojo WHERE USER_ID = :number");
			query.setParameter("number", userIdNum); //Get all cart Items for user with provided ID number.
			@SuppressWarnings("unchecked")
			ArrayList<CartPojo> result = (ArrayList<CartPojo>) query.list();
			//Iterate through result set and remove the indicated number of items from cart.
			for(int i = 0; i<result.size();i++){
				if(quantity==0){
					response = "success";
					break;
				} else{
					if(result.get(i).getItemName().equals(name)){
							Query deleteQ = session.createQuery("DELETE FROM CartPojo WHERE CART_ID = :idNum");
							int idNumber = (int) result.get(i).getCartID();
							deleteQ.setParameter("idNum", idNumber);
							deleteQ.executeUpdate();
							quantity--;
						}
					}
			}
			if(quantity==0){
				response="success";
			}
			transaction.commit();
		} catch (HibernateException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			session.close();
			return response;
		}
	}
	
	@SuppressWarnings({ "unchecked", "finally" })
	public ArrayList<CartPojo> getCartItems(int userIdNum){
		ArrayList<CartPojo> result = new ArrayList<CartPojo>();
		try{
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("FROM CartPojo WHERE USER_ID = :number");
			query.setParameter("number", userIdNum); //Get all cart Items for user with provided ID number
			for(CartPojo x : (List<CartPojo>) query.list()){
				CartPojo item = new CartPojo();
				item.setItemName(x.getItemName());
				item.setItemPrice(x.getItemPrice());
				item.setUser(null);
				result.add(item);
			}
			System.out.println("Place holder check");
			transaction.commit();
		} catch(HibernateException e){
			e.printStackTrace();
		} finally{
			session.close();
			return result; 
		}
	}
}
