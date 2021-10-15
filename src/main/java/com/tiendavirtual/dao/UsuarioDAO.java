package com.tiendavirtual.dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tiendavirtual.dto.Usuario;

public class UsuarioDAO {
    
    
	public void insertarUsuario(Usuario user) {
		ConexionBD connection= new ConexionBD();
		try {
			Statement stmt = connection.getConexionBD().createStatement(); //nuevo getConexionBD
			stmt.executeUpdate("INSERT INTO usuarios(`nombre`,`password`,`cedula_usuario`,`email_usuario`,`nombre_usuario`) VALUES (" + "'" + user.getNombre() + "'" + ","+ "'"+user.getPassword()+ "'" + ","+user.getCedula() +","+"'"+user.getEmail()+"'"+","+"'"+user.getNombreusuario()+"'"+")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Usuario> buscarUsuario(long cedula) {
        
        ConexionBD cnx=new ConexionBD();
        Connection cn = cnx.getConexionBD();
        ArrayList<Usuario> array= new ArrayList<>();
        if (cn != null) {
            try {
            	
                String atributos = "nombre,password,cedula_usuario,email_usuario,nombre_usuario";
            	String query="";
                //por si hay espacio vacio simplemente muestra toda la base de datos
            	if (!(cedula==-1))
	                query = "SELECT " + atributos + " FROM usuarios "
	                        + "WHERE cedula_usuario=" + cedula;
                else
                	query = "SELECT " + atributos + " FROM usuarios";
                Statement sentencia = cn.createStatement();
                ResultSet resultado = sentencia.executeQuery(query);
                while(resultado.next())
                {
                Usuario user = new Usuario();
            	user.setNombre(resultado.getString(1)); //Desde 0 seria tomar el id
                user.setPassword(resultado.getString(2));
                user.setCedula(resultado.getLong(3));
                user.setEmail(resultado.getString(4));
                user.setNombreusuario(resultado.getString(5));
                array.add(user);}
            } catch (SQLException e) {
            	System.out.println("Mensaje "+e);
            }

        } else {
            System.out.println("Error de conexión");
        }
        
        return array;
    }
	

	public void modificarUsuario(Usuario user) {
        ConexionBD cnx=new ConexionBD();
        Connection cn = cnx.getConexionBD();
        if (cn != null) {
        	String modificarR = "nombre='" + user.getNombre() + "',password='" + user.getPassword() + "',cedula_usuario=" + user.getCedula() + ",email_usuario='" + user.getEmail() + "',nombre_usuario='" + user.getNombreusuario() + "'";
            String query = "UPDATE usuarios"
                    + " SET " + modificarR
                    + " WHERE cedula_usuario=" + user.getCedula();
            try {
                PreparedStatement consultaDB = cn.prepareStatement(query);
                consultaDB.execute();
                consultaDB.close();
            } catch (SQLException e) {
            }
        } else {
        }

    }

	public void eliminarUsuario(long cedula) {
        ConexionBD cnx=new ConexionBD();
        Connection cn = cnx.getConexionBD();
        if (cn != null) {
            String query = "DELETE FROM usuarios WHERE cedula_usuario=" + cedula;
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
