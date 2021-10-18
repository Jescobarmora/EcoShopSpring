package com.tiendavirtual.dto;

public class Admin {
	 private String user;
	 private String passw;
	 
	public Admin(String user, String passw) {
		super();
		this.user = user;
		this.passw = passw;
	}
	
	public Admin() {}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassw() {
		return passw;
	}

	public void setPassw(String passw) {
		this.passw = passw;
	}

	@Override
	public String toString() {
		return "Admin [user=" + user + ", passw=" + passw + "]";
	}
	 
}
