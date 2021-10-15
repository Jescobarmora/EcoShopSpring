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

			var mensajero = new XMLHttpRequest();
			var url = '/TiendaVirtualGrupo02Ecoshop/eliminarUsuario';
			var params = "cedula=" + cedula;
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
		txtC = document.getElementById("txtCedu");

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
		<h1>Borrar usuario</h1>
		<table>
			
			<tr>
				<td><label>Cedula:</label></td>
				<td><input required="required" type="number" id="txtCedu"
					name="cedula"></td>
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