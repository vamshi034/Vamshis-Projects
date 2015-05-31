package org.vamshi.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.vamshi.DAO.CartDAO;
import org.vamshi.DAO.UserDAO;
import org.vamshi.DTO.CartPojo;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;

public class BuisnessAction implements SessionAware{
	private String itemName;
	private double price;
	private int removeQuantity;
	private ArrayList<CartPojo> cartJson;
	private double userBalanceJson;
	private SessionMap<String, Object> sessionMap;
	
	public String addToCart(){
		CartDAO newCartItem = new CartDAO();
		newCartItem.addItemToCart((String) sessionMap.get("userName"), this.getPrice(), this.getItemName());
		return "success";
	}
	
	public String removeCartItem(){
		CartDAO cartItem = new CartDAO();
		return cartItem.removeItemFromCart((int) sessionMap.get("userIdNum"), this.getItemName(), this.getRemoveQuantity());
	}
	
	@SuppressWarnings("finally")
	public String getCartItems(){
		CartDAO cartList = new CartDAO();
		try{
			ArrayList<CartPojo> list = cartList.getCartItems((int) sessionMap.get("userIdNum"));
			System.out.println("CartID: "+list.get(0).getCartID()+"ItemName: "+list.get(0).getCartID());
			this.setCartJson(list);
			System.out.println("\n");
			System.out.println("\n");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			System.out.println(this.getCartJson());
			return "success";
		}
	}
	
	public String checkout(){
		UserDAO user = new UserDAO();
		user.checkout((int) sessionMap.get("userIdNum"));
		return "success";
	}
	
	@SuppressWarnings("finally")
	public String getUserBalance(){
		UserDAO user = new UserDAO();
		try{
			this.setUserBalanceJson(user.getCurrentBalance((String)sessionMap.get("userName")));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return "success";
		}
	}
	
//-------------------------------------------------------
		
	public void setSession(Map<String, Object> map){
		this.sessionMap = (SessionMap<String, Object>) map;
	}
	
	public double getUserBalanceJson() {
		return userBalanceJson;
	}

	public void setUserBalanceJson(double userBalanceJson) {
		this.userBalanceJson = userBalanceJson;
	}

	public SessionMap<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(SessionMap<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	public void setCartJson(ArrayList<CartPojo> cartJson) {
		this.cartJson = cartJson;
	}
	
	public ArrayList<CartPojo> getCartJson() {
		return cartJson;
	}

	public int getRemoveQuantity() {
		return removeQuantity;
	}

	public void setRemoveQuantity(int removeQuantity) {
		this.removeQuantity = removeQuantity;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
}
