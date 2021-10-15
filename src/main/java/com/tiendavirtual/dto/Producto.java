package com.tiendavirtual.dto;

public class Producto {
	long codigo_producto;
	double ivacompra;
	String nombre_producto;
	double precio_compra,precio_venta;
	long proovedores_NIT;
	public Producto(long codigo_producto, double ivacompra, String nombre_producto, double precio_compra,
			double precio_venta, long proovedores_NIT) {
		super();
		this.codigo_producto = codigo_producto;
		this.ivacompra = ivacompra;
		this.nombre_producto = nombre_producto;
		this.precio_compra = precio_compra;
		this.precio_venta = precio_venta;
		this.proovedores_NIT = proovedores_NIT;
	}
	public long getCodigo_producto() {
		return codigo_producto;
	}
	public void setCodigo_producto(long codigo_producto) {
		this.codigo_producto = codigo_producto;
	}
	public double getIvacompra() {
		return ivacompra;
	}
	public void setIvacompra(double ivacompra) {
		this.ivacompra = ivacompra;
	}
	public String getNombre_producto() {
		return nombre_producto;
	}
	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}
	public double getPrecio_compra() {
		return precio_compra;
	}
	public void setPrecio_compra(double precio_compra) {
		this.precio_compra = precio_compra;
	}
	public double getPrecio_venta() {
		return precio_venta;
	}
	public void setPrecio_venta(double precio_venta) {
		this.precio_venta = precio_venta;
	}
	public long getProovedores_NIT() {
		return proovedores_NIT;
	}
	public void setProovedores_NIT(long proovedores_NIT) {
		this.proovedores_NIT = proovedores_NIT;
	}
	@Override
	public String toString() {
		return "Producto [codigo_producto=" + codigo_producto + ", ivacompra=" + ivacompra + ", nombre_producto="
				+ nombre_producto + ", precio_compra=" + precio_compra + ", precio_venta=" + precio_venta
				+ ", proovedores_NIT=" + proovedores_NIT + "]";
	}
	
	
	
}
