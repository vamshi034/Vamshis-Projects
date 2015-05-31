package org.vamshi.DTO;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class UserPojo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="USER_ID")
	private int id;
	@Column(name="USER_NAME")
	private String userName;
	private String password;
	private double balance;
	private double cartBalance;
	@OneToMany(mappedBy="user")
	private Collection<CartPojo> cart = new ArrayList<CartPojo>();	
	
	public double getCartBalance() {
		return cartBalance;
	}

	public void setCartBalance(double cartBalance) {
		this.cartBalance = cartBalance;
	}

	public Collection<CartPojo> getCart() {
		return cart;
	}

	public void setCart(Collection<CartPojo> cart) {
		this.cart = cart;
	}

	public double getBalance() {
		return balance;
	}
	
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}