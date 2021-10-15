package com.tiendavirtual.dto;

public class Ventas {

	private int idventa;
	private long codigo_producto_fk;
	private int cantidad;
	private long cedula_cliente_fk,cedula_usuario_fk;
	public Ventas(int idventa, long codigo_producto_fk, int cantidad, long cedula_cliente_fk, long cedula_usuario_fk) {
		super();
		this.idventa = idventa;
		this.codigo_producto_fk = codigo_producto_fk;
		this.cantidad = cantidad;
		this.cedula_cliente_fk = cedula_cliente_fk;
		this.cedula_usuario_fk = cedula_usuario_fk;
	}
	public int getIdventa() {
		return idventa;
	}
	public void setIdventa(int idventa) {
		this.idventa = idventa;
	}
	public long getCodigo_producto_fk() {
		return codigo_producto_fk;
	}
	public void setCodigo_producto_fk(long codigo_producto_fk) {
		this.codigo_producto_fk = codigo_producto_fk;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public long getCedula_cliente_fk() {
		return cedula_cliente_fk;
	}
	public void setCedula_cliente_fk(long cedula_cliente_fk) {
		this.cedula_cliente_fk = cedula_cliente_fk;
	}
	public long getCedula_usuario_fk() {
		return cedula_usuario_fk;
	}
	public void setCedula_usuario_fk(long cedula_usuario_fk) {
		this.cedula_usuario_fk = cedula_usuario_fk;
	}
	@Override
	public String toString() {
		return "Ventas [idventa=" + idventa + ", codigo_producto_fk=" + codigo_producto_fk + ", cantidad=" + cantidad
				+ ", cedula_cliente_fk=" + cedula_cliente_fk + ", cedula_usuario_fk=" + cedula_usuario_fk + "]";
	}
	
	
	
	
}
