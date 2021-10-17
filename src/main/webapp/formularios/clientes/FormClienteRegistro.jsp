<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="../../css/admin_in.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function enviarDatos() {
		var valido = validar();
		if (valido) {
			//alert("Los datos son validos");
			var cedula = document.getElementById("txtCedula").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var direccion = document.getElementById("txtDirec").value.trim();
			var telefono = document.getElementById("txtTel").value.trim();
			var email = document.getElementById("txtEmail").value.trim();

			var mensajero = new XMLHttpRequest();
			var url = '/TiendaVirtualGrupo02Ecoshop/crearCliente';
			var params = "cedula=" + cedula + "&" + "nombre=" + nombre + "&" +"direccion=" + direccion + "&" +
			"telefono=" + telefono + "&" + "email=" + email;
			mensajero.open('POST', url, true);

			//Send the proper header information along with the request
			mensajero.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');

			mensajero.onreadystatechange = function() {//Call a function when the state changes.
				if (mensajero.readyState == 4 && mensajero.status == 200) {
					//alert("datos enviados mensaje desde el server");
					//alert(mensajero.responseText);
					var myDiv = document.getElementById("dvTabla");
					myDiv.innerHTML = "<b>"+"Mensaje "+mensajero.responseText+"</b>";
				}
			}
			mensajero.send(params);
		} else {
			alert("Los datos NO son validos");
		}
	}
	function validar() {
		let cedula = document.getElementById("txtCedula").value.trim();
		let nombre = document.getElementById("txtNombre").value.trim();
		let direccion = document.getElementById("txtDirec").value.trim();
		let telefono = document.getElementById("txtTel").value.trim();
		let email = document.getElementById("txtEmail").value.trim()

		if (cedula.length == 0 ||nombre.length == 0 ||direccion.length == 0 ||telefono.length == 0 ||email.length == 0  ) {
			alert("No puede estar vacio.");
			return false;
		}
		 else {
			return true;
		}

	}
</script>
</head>
<body>
	<main>
		<h1>Registro del cliente</h1>
		<table>
			<tr>
				<td><label>Cedula:</label></td>
				<td><input type="number" id="txtCedula"></td>
			</tr>
			<tr>
				<td><label>Nombre Completo:</label></td>
				<td><input type="text" id="txtNombre"> </td>
			</tr>
			<tr>
				<td><label>Direccion:</label></td>
				<td><input type="text" id="txtDirec"> </td>
			</tr>
			<tr>
				<td><label>Telefono:</label></td>
				<td><input type="number" id="txtTel"> </td>
			</tr>
			<tr>
				<td><label>Email:</label></td>
				<td><input type="email" id="txtEmail"></td>
			</tr>
			
		</table>
			<br> <br> 
			<button onclick="enviarDatos()">Registrar cliente</button>
			<a class="back" href="../../admin.html">Atras</a>
			<br><br>
		<div id="dvTabla"></div>
		
	</main>
</body>
</html>