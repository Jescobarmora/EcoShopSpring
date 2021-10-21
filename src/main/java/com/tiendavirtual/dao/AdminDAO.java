package com.tiendavirtual.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.tiendavirtual.dto.Admin;

public class AdminDAO {
	
	public boolean VerificarAdministrador (Admin admi) {

		ConexionBD cnx=new ConexionBD();
            try {
                String atributos = "nombre, password";
            	String query="";
            	String nombre=admi.getUser();
            	String password=admi.getPassw();
                query = "SELECT " + atributos + " FROM usuarios WHERE nombre='" + nombre + "' AND password='" + password + "'" ;
                Statement sentencia = cnx.getConexionBD().createStatement();;
                ResultSet resul = sentencia.executeQuery(query);
                if (resul.next()) {
                if (resul.getString("nombre").equals(nombre)  && resul.getString("password").equals(password) ) {
                	return true;
                }else {
                	return false;
                }}
            } catch (SQLException e) {
            	System.out.println("Mensaje "+e);
            }

        
       return false;
    }

}
