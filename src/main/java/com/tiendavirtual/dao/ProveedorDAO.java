package com.tiendavirtual.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.dto.Proveedor;

public class ProveedorDAO {

	public void insertProveedor(Proveedor prov) {
		ConexionBD conex = new ConexionBD();
		try {
			Statement estatuto = conex.getConexionBD().createStatement();
			estatuto.executeUpdate("INSERT INTO proveedores(NIT, nombre, direccion, telefono, email, sitioweb) VALUES ('" + prov.getNIT() + "', '" + prov.getNombre()
					+ "', '" + prov.getDireccion() + "', '" + prov.getTelefono() + "', '" + prov.getEmail() + "', '"
					+ prov.getSitioweb() + "')");
			estatuto.close();
			//conex.desconectar();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<Proveedor> consultarProveedores(String nit) {
		ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>();
		ConexionBD conex = new ConexionBD();

		String sql = "SELECT * FROM proveedores ";
		if (!nit.trim().equals("null")) {
			sql = sql + "WHERE NIT = '" + nit + "'";
		}

		try {
			Statement consulta = conex.getConexionBD().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				Proveedor prov = new Proveedor(res.getLong("NIT"), res.getString("nombre"),
						res.getString("direccion"), res.getString("telefono"), res.getString("email"),
						res.getString("sitioweb"));
				proveedores.add(prov);
			}
			res.close();
			consulta.close();
			//conex.desconectar();

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar la Persona\n" + e);
		}
		return proveedores;
	}

}