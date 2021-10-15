package com.tiendavirtual.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.tiendavirtual.dto.Ventas;

public class VentasDAO {
	
	
	public void insertVentas(Ventas ven) {
		ConexionBD conex = new ConexionBD();
		try {
			Statement estatuto = conex.getConexionBD().createStatement();
			estatuto.executeUpdate("INSERT INTO ventas(codigo_producto_fk, cantidad, cedula_cliente_fk,cedula_usuario_fk) VALUES (" + ven.getCodigo_producto_fk() + ", " + ven.getCantidad()
					+ "," + ven.getCedula_cliente_fk() +","+ven.getCedula_usuario_fk()+")");
			estatuto.close();
			

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public ArrayList <String> consultarConsolidado(String tipo) {
		ArrayList<String> registros = new ArrayList<String>();
		ConexionBD conex = new ConexionBD();

		String sql = "";
		String etiquetaCOl="";
		String etiquetaFIL="";
		if (tipo.trim().equals("producto")) {
			sql = "SELECT codigo_producto_fk AS Item, SUM(cantidad) AS Unidades\r\n"
					+ "FROM ventas\r\n"
					+ "GROUP BY codigo_producto_fk\r\n"
					+ "ORDER BY codigo_producto_fk;";
			etiquetaCOl="Codigo del producto";
			etiquetaFIL="Cantidad de productos comprados";
			
		} else if (tipo.trim().equals("cliente")){
			sql = "SELECT cedula_cliente_fk AS Item, SUM(cantidad) AS Unidades\r\n"
					+ "FROM ventas\r\n"
					+ "GROUP BY cedula_cliente_fk\r\n"
					+ "ORDER BY cedula_cliente_fk;";
			etiquetaCOl="Cedula del cliente";
			etiquetaFIL="Cantidad de productos comprados";
		}

		try {
			Statement consulta = conex.getConexionBD().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				registros.add(res.getString("Item")+";"+res.getInt("unidades"));

			}
			res.close();
			consulta.close();
			

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar el Proveedor\n" + e);
		}
		return registros;
	}
}
