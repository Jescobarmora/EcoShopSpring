package com.tiendavirtual.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.tiendavirtual.dto.Admin;

public class AdminDAO {
	
	public boolean VerificarAdministrador (Admin admi) {
        ConexionBD cnx=new ConexionBD();
        Connection cn = cnx.getConexionBD();
        if (cn != null) {
            try {
                String atributos = "user, pass";
            	String query="";
                query = "SELECT " + atributos + " FROM admi WHERE user='" + admi.getUser() + "' AND pass='" + admi.getPassw() + "'" ;
                Statement sentencia = cn.createStatement();
                ResultSet resultado = sentencia.executeQuery(query);
                resultado.next();
                if (resultado.getString(1).equals(admi.getUser())  && resultado.getString(2).equals(admi.getPassw()) ) {
                	return true;
                }else {
                	return false;
                }
            } catch (SQLException e) {
            	System.out.println("Mensaje "+e);
            }

        } else {
            System.out.println("Error de conexión");
        }
       return false;
    }

}
