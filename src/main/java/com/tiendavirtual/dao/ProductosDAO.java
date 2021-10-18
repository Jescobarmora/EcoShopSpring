package com.tiendavirtual.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tiendavirtual.dto.Producto;
import com.tiendavirtual.dto.Usuario;

public class ProductosDAO {

	public void insertarProducto(Producto prov) {
		ConexionBD conex = new ConexionBD();
		try {
			Statement estatuto = conex.getConexionBD().createStatement();
			estatuto.executeUpdate("INSERT INTO productos(codigo_producto,ivacompra,nombre_producto,precio_compra,precio_venta,proveedores_NIT) VALUES (" + prov.getCodigo_producto() + "," + prov.getIvacompra()
					+ ",'" + prov.getNombre_producto() + "','" + prov.getPrecio_compra() + "'," + prov.getPrecio_venta()+ ","+prov.getProovedores_NIT()+ ")");
			estatuto.close();
			//conex.desconectar();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}
	public void FileUpload(File archivo) {
          try {
              FileReader fr = new FileReader(archivo);
              BufferedReader br = new BufferedReader(fr);
              String linea = "";
              while ((linea = br.readLine()) != null) {
                  String[] tokens = linea.split(",");
                  //(long codigo_producto, double ivacompra, double precio_compra, double precio_venta, String nitproveedor, String nombre_producto)
                  Producto p = new Producto(Long.parseLong(tokens[0]),Float.parseFloat(tokens[1]) ,(tokens[2]),Float.parseFloat(tokens[3]), Float.parseFloat(tokens[4]), Long.parseLong(tokens[5]));
                  insertarProducto(p);
              }
              br.close();
              fr.close();
          } catch (FileNotFoundException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }
      }
	
	
	public ArrayList<Producto> buscarProductos(long codigo_producto) {
        
        ConexionBD cnx=new ConexionBD();
        Connection cn = cnx.getConexionBD();
        ArrayList<Producto> array= new ArrayList<>();
        if (cn != null) {
            try {
            	
                String atributos = "codigo_producto,ivacompra,nombre_producto,precio_compra,precio_venta,proveedores_NIT";
            	String query="";
                //por si hay espacio vacio simplemente muestra toda la base de datos
            	if (!(codigo_producto==-1))
	                query = "SELECT " + atributos + " FROM productos "
	                        + "WHERE codigo_producto=" + codigo_producto;
                else
                	query = "SELECT " + atributos + " FROM productos";
                Statement sentencia = cn.createStatement();
                ResultSet resultado = sentencia.executeQuery(query);
                while(resultado.next())
                {
                Producto pro = new Producto();
            	pro.setCodigo_producto(Long.parseLong(resultado.getString(1))); //Desde 1 siempre
                pro.setIvacompra(Float.parseFloat(resultado.getString(2)));
                pro.setNombre_producto(resultado.getString(3));
                pro.setPrecio_compra(Float.parseFloat(resultado.getString(4)));
                pro.setPrecio_venta(Float.parseFloat(resultado.getString(5)));
                pro.setProovedores_NIT(Long.parseLong(resultado.getString(6)));
                array.add(pro);}
            } catch (SQLException e) {
            	System.out.println("Mensaje "+e);
            }

        } else {
            System.out.println("Error de conexión");
        }
        
        return array;
    }
}
