package com.tiendavirtual.dto;

public class Usuario {
	private String nombre;
	private String password;
	private long cedula;
	private String email;
	private String nombreusuario;
	
	//http://localhost:8080/actualizarUsuario?nombre=Jeronimo&password=Pops&cedula=261819&email=ffff@ffff&nombreusuario=Kilombo
	public Usuario(String nombre, String password, long cedula, String email, String nombreusuario) {
		super();
		this.nombre = nombre;
		this.password = password;
		this.cedula = cedula;
		this.email = email;
		this.nombreusuario = nombreusuario;
	}
	public Usuario() {}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public long getCedula() {
		return cedula;
	}


	public void setCedula(long cedula) {
		this.cedula = cedula;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNombreusuario() {
		return nombreusuario;
	}


	public void setNombreusuario(String nombreusuario) {
		this.nombreusuario = nombreusuario;
	}


	@Override
	public String toString() {
		return "Usuario [nombre=" + nombre + ", password=" + password + ", cedula=" + cedula + ", email=" + email
				+ ", nombreusuario=" + nombreusuario + "]";
	}
	
	

}
