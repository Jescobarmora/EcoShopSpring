<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function enviarDatos() {
		var valido = validar();
		if (valido) {
			alert("Los datos son validos");
			var nombre = document.getElementById("txtUser").value.trim();
			var password = document.getElementById("txtPass").value.trim();
			var cedula = document.getElementById("txtCedu").value.trim();
			var email = document.getElementById("txtEmail").value.trim();
			var nombreusuario = document.getElementById("txtNombre").value.trim();

			var mensajero = new XMLHttpRequest();
			var url = '/TiendaVirtualGrupo02Ecoshop/actualizarUsuario';
			var params = "nombre=" + nombre + "&" + "password=" + password + "&" + "cedula=" + cedula + "&" + "email=" + email + "&" +"nombreusuario=" + nombreusuario;
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
		txtU = document.getElementById("txtUser");
		txtP = document.getElementById("txtPass");
		txtC = document.getElementById("txtCedu");
		txtE = document.getElementById("txtEmail");
		txtN = document.getElementById("txtNombre");

		if (txtU.value.trim().length == 0 ||txtP.value.trim().length == 0 ||txtC.value.trim().length == 0 ||txtE.value.trim().length == 0 ||txtN.value.trim().length == 0 ) {
			alert("No puede estar vacio usuario.");
			return false;
		} else {
			return true;
		}

	}
</script>
</head>
<body>
	<main>
		<h1>Actualizacion del usuario</h1>
		<table>
			<tr>
				<td><label>User name:</label></td>
				<td><input required="required" type="text" id="txtUser"
					name="nombre"></td>
			</tr>
			<tr>
				<td><label>Password:</label></td>
				<td><input required="required" type="password" id="txtPass"
					name="password"></td>
			</tr>
			<tr>
				<td><label>Cedula:</label></td>
				<td><input required="required" type="number" id="txtCedu"
					name="cedula"></td>
			</tr>
			<tr>
				<td><label>Email:</label></td>
				<td><input required="required" type="email" id="txtEmail"
					name="email"></td>
			</tr>
			<tr>
				<td><label>Nombre del usuario:</label></td>
				<td><input required="required" type="text" id="txtNombre"
					name="nombreusuario"></td>
			</tr>
			
		</table>
		<br>
		<br>
		<button onclick="enviarDatos()">Actualizar</button>
		<br>
		<br>
		<%--  --%>
		<a href="FormClientes.jsp">Registro cliente</a>
		<br>
		<br>
		<div id="dvTabla"></div>
	</main>
</body>
</html>