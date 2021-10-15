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
			var cedula = document.getElementById("txtCedu").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var direccion = document.getElementById("txtDirec").value.trim();
			var telefono = document.getElementById("txtTel").value.trim();
			var email = document.getElementById("txtEmail").value.trim();

			var mensajero = new XMLHttpRequest();
			var url = '/TiendaVirtualGrupo02Ecoshop/actualizarCliente';
			var params = "cedula=" + cedula + "&" + "nombre=" + nombre + "&" + "direccion=" + direccion + "&" + "telefono=" + telefono + "&" +"email=" + email;
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
		txtU = document.getElementById("txtCedu");
		txtP = document.getElementById("txtNombre");
		txtC = document.getElementById("txtDirec");
		txtE = document.getElementById("txtTel");
		txtN = document.getElementById("txtEmail");

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
		<h1>Actualizacion del usuario Cliente</h1>
		<table>
			<tr>
				<td><label>Cedula:</label></td>
				<td><input required="required" type="number" id="txtCedu"
					name="cedula"></td>
			</tr>
			<tr>
				<td><label>Nombre Completo:</label></td>
				<td><input required="required" type="text" id="txtNombre"
					name="nombre"></td>
			</tr>
			<tr>
				<td><label>Direccion:</label></td>
				<td><input required="required" type="text" id="txtDirec"
					name="direccion"></td>
			</tr>
			<tr>
				<td><label>Telefono:</label></td>
				<td><input required="required" type="number" id="txtTel"
					name="telefono"></td>
			</tr>
			<tr>
				<td><label>Email:</label></td>
				<td><input required="required" type="email" id="txtEmail"
					name="email"></td>
			</tr>
			
		</table>
		<br>
		<br>
		<button onclick="enviarDatos()">Actualizar Cliente</button>
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