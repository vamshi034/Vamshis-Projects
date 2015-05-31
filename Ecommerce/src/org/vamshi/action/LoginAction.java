package org.vamshi.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.vamshi.DAO.UserDAO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware{

	private String userId;
	private String password;
	private String currentUser; 
	private SessionMap<String, Object> sessionMap;

	
	public String login()
	{
		
		UserDAO user = new UserDAO();
		/*userDetails first index is a boolean indicating if the login was successful
		 * if it was successful, second index is userID number (PK in UserPojo table */
		ArrayList<Object> userDetails = user.getUserPojoDetails(this.getUserId(), this.getPassword());
		if((boolean) userDetails.get(0)){
			sessionMap.put("userName", this.getUserId());
			sessionMap.put("userIdNum", (int) userDetails.get(1));
			return "success";
		} else{
			return "failure";
		}
	}
	

	//Why does this method suddenly give value to the sessionMap variable
	//It's not being called anywhere, so how is it defining sessionMap (which is null by default).
	@Override
	public void setSession(Map<String, Object> map){
		this.sessionMap = (SessionMap<String, Object>) map;
	}
	
	public String logout(){
		if(this.sessionMap.get("userName")!=null){
			this.sessionMap.invalidate();
		}
		return "success";
	}
	
	public SessionMap<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(SessionMap<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}
	
	public void validate(){
		UserDAO user = new UserDAO();
		if(!user.loginVerification(this.getUserId(), this.getPassword())){
			addFieldError("userId", "Login Credentials are incorrect, please try again.");
		}
	}
}