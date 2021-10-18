<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/admin_in.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/login.css">
  <title></title>
<script type="text/javascript">

	function consultar() {
		
		var booleano= false;
		
		if (validar()){
			var user = document.getElementById("txtUserAdmi").value.trim();
			var pass = document.getElementById("txtPassword").value.trim();
			
			var http = new XMLHttpRequest();
			var url = '/TiendaVirtualGrupo02Ecoshop/verificarAdmi';
			var params = "user=" + user + "&" + "passw=" + pass;
			http.open('POST', url, true);

			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');

			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					//alert(http.responseText)
					booleano=(http.responseText);
						if (booleano=="true"){
							//window.location.replace= "https://localhost8080:/TiendaVirtualGrupo02Ecoshop/admin.html";
							window.location.replace("/TiendaVirtualGrupo02Ecoshop/admin.html");
						}else{
							alert("Datos erroneos, intente nuevamente.")
						}
					}
			}
			http.send(params);
		}
		return booleano;
		
	}
	
	
		

	function validar() {
		txtU = document.getElementById("txtUserAdmi");
		txtP = document.getElementById("txtPassword");

		if (txtU.value.trim().length == 0 || txtP.value.trim().length == 0) {
			alert("No puede estar vacio ningun campo.");
			return false;
		} else {
			return true;
		}

	}
	
</script>
</head>

<body>
<main>
	<h1>INICIAR SESIÓN</h1>
	<table>
			<tr>
				<td><label>Usuario:</label></td>
				<td><input required="required" type="text" id="txtUserAdmi" name="Usuario"></td>
			</tr>
			
			<tr>
				<td><label>Contraseña:</label></td>
				<td><input required="required" type="Password" id="txtPassword" name="Contraseña"></td>
			</tr>

		</table>
		<br> <br>
		<button onclick="consultar()">Ingresar</button>
		<a class="back" href="index.html"> Salir a pantalla principal</a>
		<br> <br>
	</main>
	
	<br><br>
  
</body>

</html>