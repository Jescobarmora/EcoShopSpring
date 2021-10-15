package com.tiendavirtual.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
	//parametros base datos
//	private String bd = "ecoshop";
//	private String login = "root";
//	private String passw = "admin";
//	private String url = "jdbc:mysql://localhost/" + bd;
	
	private String bd = "Grupo02EcoShop";
	private String login = "admin";
	private String passw = "MisionTIC2022GRUPO02";
	private String url = "jdbc:mysql://misiontic2022grupo02.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/" + bd;
	
	public Connection getConexionBD() {
		Connection connection = null;//conexion base de datos
		try {
			//Class.forName("com.mysql.cj.jdbc.Driver");
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection(url, login, passw);
			if (connection != null) {
				System.out.println("Conexion a base de datos " + bd + " OK\n");
				
			}
		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return connection;
	}
}