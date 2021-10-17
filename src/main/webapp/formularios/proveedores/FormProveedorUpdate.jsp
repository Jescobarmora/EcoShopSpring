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
			var NIT = document.getElementById("txtNIT").value.trim();
			var nombre = document.getElementById("txtNombre").value.trim();
			var direccion = document.getElementById("txtDireccion").value.trim();
			var telefono = document.getElementById("txtTelefono").value.trim();
			var email = document.getElementById("txtEmail").value.trim();
			var sitioweb = document.getElementById("txtSitioWeb").value.trim();

			var mensajero = new XMLHttpRequest();
			var url = '/TiendaVirtualGrupo02Ecoshop/actualizarProveedor';
			var params = "NIT=" + NIT + "&" + "nombre=" + nombre + "&" + "direccion=" + direccion + "&" + "telefono=" + telefono + "&" +"email=" + email + "&" + "sitioweb=" + sitioweb;
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
		txtU = document.getElementById("txtNIT");
		txtP = document.getElementById("txtNombre");
		txtC = document.getElementById("txtDireccion");
		txtE = document.getElementById("txtTelefono");
		txtN = document.getElementById("txtEmail");
		txtS = document.getElementById("txtSitioWeb");

		if (txtU.value.trim().length == 0 ||txtP.value.trim().length == 0 ||txtC.value.trim().length == 0 ||txtE.value.trim().length == 0 ||txtN.value.trim().length == 0 || txtS.value.trim().length == 0) {
			alert("No puede estar vacio Proveedor");
			return false;
		} else {
			return true;
		}

	}
</script>
</head>
<body>
	<main>
		<h1>Actualizacion Del Proveedor</h1>
		<table>
			<tr>
				<td><label>NIT:</label></td>
				<td><input required="required" type="number" id="txtNIT"
					name="NIT"></td>
			</tr>
			<tr>
				<td><label>Nombre:</label></td>
				<td><input required="required" type="text" id="txtNombre"
					name="nombre"></td>
			</tr>
			<tr>
				<td><label>Direcccion:</label></td>
				<td><input required="required" type="text" id="txtDireccion"
					name="direccion"></td>
			</tr>
			<tr>
				<td><label>Telefono:</label></td>
				<td><input required="required" type="number" id="txtTelefono"
					name="telefono"></td>
			</tr>
			<tr>
				<td><label>Email:</label></td>
				<td><input required="required" type="email" id="txtEmail"
					name="email"></td>
			</tr>
			<tr>
				<td><label>Sitio Web:</label></td>
				<td><input required="required" type="text" id="txtSitioWeb"
					name="sitioweb"></td>
			</tr>
			
		</table>
		<br>
		<br>
		<button onclick="enviarDatos()">Actualizar</button>
		<a class="back" href="../../admin.html">Atras</a>
		<br>
		<br>
		<div id="dvTabla"></div>
	</main>
</body>
</html>