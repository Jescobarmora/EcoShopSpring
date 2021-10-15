package com.tiendavirtual.dto;
//?cedula=212&nombre=juanito&direccion=endo2&telefono=2123&email=jojr@asd
public class Cliente {
	private String nombre,direccion,telefono,email;
	private long cedula;
	public Cliente(long cedula,String nombre, String direccion, String telefono, String email) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.telefono = telefono;
		this.email = email;
		this.cedula = cedula;
	}
	public Cliente() {}
	
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
	public long getCedula() {
		return cedula;
	}
	public void setCedula(long cedula) {
		this.cedula = cedula;
	}
	
	@Override
	public String toString() {
		return "Cliente [nombre=" + nombre + ", direccion=" + direccion + ", telefono=" + telefono + ", email=" + email
				+ ", cedula=" + cedula + "]";
	}
	
}
