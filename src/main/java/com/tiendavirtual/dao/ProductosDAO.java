package com.tiendavirtual.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import com.tiendavirtual.dto.Producto;

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
}
