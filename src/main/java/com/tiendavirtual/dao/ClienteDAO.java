package com.tiendavirtual.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tiendavirtual.dto.Cliente;

public class ClienteDAO {

	public void insertarCliente(Cliente client) {
		ConexionBD connection = new ConexionBD();
		try {
			Statement stmt = connection.getConexionBD().createStatement(); // nuevo getConexionBD
			stmt.executeUpdate(
					"INSERT INTO clientes(cedula_cliente,nombre_cliente,direccion_cliente,telefono_cliente,email_cliente) VALUES ("
							+ client.getCedula() + "," + "'" + client.getNombre() + "'" + "," + "'"
							+ client.getDireccion() + "'" + "," + "'" + client.getTelefono() + "'" + "," + "'"
							+ client.getEmail() + "'" + ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Cliente> consultarCliente(long cedula) {

		ConexionBD cnx = new ConexionBD();
		Connection cn = cnx.getConexionBD();
		ArrayList<Cliente> arrayc = new ArrayList<>();
		if (cn != null) {
			try {

				String atributos = "cedula_cliente,nombre_cliente,direccion_cliente,telefono_cliente,email_cliente";
				String query = "";
				// por si hay espacio vacio simplemente muestra toda la base de datos
				if (!(cedula == -1))
					query = "SELECT " + atributos + " FROM clientes " + "WHERE cedula_cliente=" + cedula;
				else
					query = "SELECT " + atributos + " FROM clientes";
				Statement sentencia = cn.createStatement();
				ResultSet resultado = sentencia.executeQuery(query);
				while (resultado.next()) {
					Cliente client = new Cliente();
					client.setCedula(resultado.getLong(1));
					client.setNombre(resultado.getString(2)); // Desde 0 seria tomar el id
					client.setDireccion(resultado.getString(3));
					client.setTelefono(resultado.getString(4));
					client.setEmail(resultado.getString(5));
					arrayc.add(client);
				}
			} catch (SQLException e) {
				System.out.println("Mensaje " + e);
			}

		} else {
			System.out.println("Error de conexión");
		}

		return arrayc;
	}

	public void actualizarCliente(Cliente client) {
	    ConexionBD cnx=new ConexionBD();
	    Connection cn = cnx.getConexionBD();	
	    if (cn != null) {
	    	String modificarR = "cedula_cliente=" + client.getCedula() + ",nombre_cliente='" + client.getNombre() + "',direccion_cliente='" + client.getDireccion() +"',telefono_cliente='" + client.getTelefono() + "',email_cliente='" + client.getEmail() +  "'";
	        String query = "UPDATE clientes"
	                + " SET " + modificarR
	                + " WHERE cedula_cliente=" + client.getCedula();
	        try {
	            PreparedStatement consultaDB = cn.prepareStatement(query);
	            consultaDB.execute();
	            consultaDB.close();
	        } catch (SQLException e) {
	        }
	    } else {
	    }

	}

	public void eliminarCliente(long cedula) {
        ConexionBD cnx=new ConexionBD();
        Connection cn = cnx.getConexionBD();
        if (cn != null) {
            String query = "DELETE FROM clientes WHERE cedula_cliente=" + cedula;
            try {
                PreparedStatement consultaBD = cn.prepareStatement(query);
                consultaBD.execute();
                consultaBD.close();

            } catch (Exception e) {
                System.out.println("Error...." + e.getMessage());
            }

        } else {
        }
    }
}
