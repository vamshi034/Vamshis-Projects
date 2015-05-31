package org.vamshi.action;

import org.vamshi.DAO.UserDAO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CreateUserAction extends ActionSupport{
	private String newUserId;
	private String newPassword;
	private double newBalance;
	
	public String execute() {
		UserDAO newUser = new UserDAO();
		if((boolean) newUser.getUserPojoDetails(this.getNewUserId(), this.getNewPassword()).get(0)){
			
		}
		newUser.createUser(this.getNewUserId(),this.getNewPassword(), this.getNewBalance());//Creating new User
		/* Verify if new user created (returns boolean)*/
		if((boolean) newUser.getUserPojoDetails(this.getNewUserId(), this.getNewPassword()).get(0)){ 
			return "success";
		}else{
			return "failure";
		}
	}

	
	public double getNewBalance() {
		return newBalance;
	}

	public void setNewBalance(double newBalance) {
		this.newBalance = newBalance;
	}


	public String getNewUserId() {
		return newUserId;
	}

	public void setNewUserId(String newUserId) {
		this.newUserId = newUserId;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public void validate(){
		UserDAO user = new UserDAO();
		if(!user.verifyUserName(this.getNewUserId())){
			addFieldError("newUserId", "This User Name is already taken, please try another.");
		}
	} 



}