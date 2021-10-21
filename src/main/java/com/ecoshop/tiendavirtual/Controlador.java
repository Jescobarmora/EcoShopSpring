package com.ecoshop.tiendavirtual;

import java.io.File;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tiendavirtual.dao.AdminDAO;
import com.tiendavirtual.dao.ClienteDAO;
import com.tiendavirtual.dao.ProductosDAO;
import com.tiendavirtual.dao.ProveedorDAO;
import com.tiendavirtual.dao.UsuarioDAO;
import com.tiendavirtual.dao.VentasDAO;
import com.tiendavirtual.dto.Admin;
import com.tiendavirtual.dto.Cliente;
import com.tiendavirtual.dto.Producto;
import com.tiendavirtual.dto.Proveedor;
import com.tiendavirtual.dto.Usuario;
import com.tiendavirtual.dto.Ventas;

@RestController
public class Controlador {
	/*------------------------------------------- Admin --------------------------------------------------*/
	
	/*------------------------------------------- Usuarios --------------------------------------------------*/

	
	@RequestMapping("/verificarAdmi")
	public boolean VerificarAdministrador (Admin admin) {
		String a=admin.getUser();
		String b=admin.getPassw();
		AdminDAO dao = new AdminDAO();
		return dao.VerificarAdministrador(admin);
	}
	
	@RequestMapping("/crearUsuario")
	public String insertarUsuario(Usuario user) {
		UsuarioDAO dao = new UsuarioDAO();
		dao.insertarUsuario(user);

		return "Microservicio de insercion de usuario";// esto al final es un response
	}

	@RequestMapping("/actualizarUsuario")
	public String modificarUsuario(Usuario user) {
		UsuarioDAO dao = new UsuarioDAO();
		dao.modificarUsuario(user);

		return "Microservicio para modificar usuario";// esto al final es un response
	}

	@RequestMapping("/buscarUsuario")
	public ArrayList<Usuario> buscarUsuario(long cedula) {

		UsuarioDAO dao = new UsuarioDAO();
		ArrayList<Usuario> usuarios = dao.buscarUsuario(cedula);
		return usuarios;// esto al final es un response
	}

	@RequestMapping("/eliminarUsuario")
	public String borrarUsuario(long cedula) {
		UsuarioDAO dao = new UsuarioDAO();
		dao.eliminarUsuario(cedula);
		return "Microservicio para borrar el usuario";// esto al final es un response
	}

	/*------------------------------------------- Clientes --------------------------------------------------*/
	@RequestMapping("/crearCliente")
	public String insertarCliente(Cliente client) {
		ClienteDAO dao = new ClienteDAO();
		dao.insertarCliente(client);

		return "Microservicio de insercion de cliente";// esto al final es un response
	}

	@RequestMapping("/actualizarCliente")
	public String actualizarCliente(Cliente client) {
		ClienteDAO dao = new ClienteDAO();
		dao.actualizarCliente(client);

		return "Microservicio para actualizar cliente";// esto al final es un response
	}

	@RequestMapping("/buscarCliente")
	public ArrayList<Cliente> consultarCliente(long cedula) {

		ClienteDAO dao = new ClienteDAO();
		ArrayList<Cliente> clientes = dao.consultarCliente(cedula);
		return clientes;// esto al final es un response
	}

	@RequestMapping("/eliminarCliente")
	public String eliminarCliente(long cedula) {
		ClienteDAO dao = new ClienteDAO();
		dao.eliminarCliente(cedula);
		return "Microservicio para borrar el cliente";// esto al final es un response
	}

	/*------------------------------------------- Proveedor --------------------------------------------------*/
	@RequestMapping("/registrarProveedor")
	public String registrarProveedor(Proveedor p) {
		ProveedorDAO dao = new ProveedorDAO();
		dao.insertProveedor(p);
		return "Proveedor Registrado";
	}

	@RequestMapping("/consultarProveedores")
	public ArrayList<Proveedor> consultarProveedores(String nit) {
		ProveedorDAO dao = new ProveedorDAO();
		return dao.consultarProveedores(nit);
	}

	@RequestMapping("/actualizarProveedor")
	public String actualizarProveedor(Proveedor proveedor) {
		ProveedorDAO dao = new ProveedorDAO();
		dao.actualizarProveedor(proveedor);

		return "Microservicio para actualizar proveedor";// esto al final es un response
	}

	@RequestMapping("/eliminarProveedor")
	public String eliminarProveedor(long NIT) {
		ProveedorDAO dao = new ProveedorDAO();
		dao.eliminarProveedor(NIT);
		return "Microservicio para borrar el proveedor";// esto al final es un response
	}

	/*------------------------------------------- Producto --------------------------------------------------*/

	@PostMapping("/cargarProducto")
	public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file) {
		System.out.println("IM IN");
		String fileName = file.getOriginalFilename();
		System.out.println("IM IN2");
		try {
			File fl = new File("C:\\ArchivosRecibidos\\" + fileName);
			System.out.println("IM IN3");
			file.transferTo(fl);
			System.out.println("IM IN4");
			ProductosDAO dao = new ProductosDAO();
			System.out.println("IM IN5");
			dao.FileUpload(fl);
			System.out.println("IM IN6");
		} catch (Exception e) {
			System.out.println("IM IN7");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
		System.out.println("IM IN8");
		return ResponseEntity.ok("Archivo cargado con exito.");
	}
	
	@RequestMapping("/consultarProducto")
	public ArrayList<Producto> consultarProducto(long codigo_producto) {
		ProductosDAO dao = new ProductosDAO();
		ArrayList<Producto> productos = dao.buscarProductos(codigo_producto);
		return productos;// esto al final es un response
	}

	/*------------------------------------------- Ventas --------------------------------------------------*/
	@RequestMapping("/consultarVentas")
	public ArrayList<String> consultarVentas(String tipo) {
		VentasDAO dao = new VentasDAO();
		return dao.consultarConsolidado(tipo);
	}
	
	@RequestMapping("/insertarVentas")
	public String insertarVentas(Ventas p) {
		VentasDAO dao = new VentasDAO();
		dao.insertVentas(p);
		return "Venta Registrada";
	}

}