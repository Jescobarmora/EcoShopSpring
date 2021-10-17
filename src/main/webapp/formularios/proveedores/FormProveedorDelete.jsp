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
			var NIT = document.getElementById("txtNIT").value.trim();

			var mensajero = new XMLHttpRequest();
			var url = '/TiendaVirtualGrupo02Ecoshop/eliminarProveedor';
			var params = "NIT=" + NIT;
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
		txtC = document.getElementById("txtNIT");

		if (txtC.value.trim().length == 0 ) {
			alert("No puede estar vacio cedula.");
			return false;
		} else {
			return true;
		}

	}
</script>
</head>
<body>
	<main>
		<h1>Borrar Proveedor</h1>
		<table>
			
			<tr>
				<td><label>NIT:</label></td>
				<td><input required="required" type="number" id="txtNIT"
					name="NIT"></td>
			</tr>
			
		</table>
		<br>
		<br>
		<button onclick="enviarDatos()">Eliminar</button>
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