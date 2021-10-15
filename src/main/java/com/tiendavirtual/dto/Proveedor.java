package com.tiendavirtual.dto;

public class Proveedor {
	
	private long NIT;
	private String nombre;
	private String direccion;
	private String telefono;
	private String email;
	private String sitioweb;
	
	
	
	public Proveedor(long NIT, String nombre, String direccion, String telefono, String email, String sitioweb) {
		super();
		this.NIT = NIT;
		this.nombre = nombre;
		this.direccion = direccion;
		this.telefono = telefono;
		this.email = email;
		this.sitioweb = sitioweb;
	}
	
	public long getNIT() {
		return NIT;
	}
	public void setNIT(long NIT) {
		this.NIT = NIT;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSitioweb() {
		return sitioweb;
	}
	public void setSitioweb(String sitioweb) {
		this.sitioweb = sitioweb;
	}
	@Override
	public String toString() {
		return "Proveedor [NIT=" + NIT + ", nombre=" + nombre + ", direccion=" + direccion + ", telefono=" + telefono
				+ ", email=" + email + ", sitioweb=" + sitioweb + "]";
	}
	
	
	
}
