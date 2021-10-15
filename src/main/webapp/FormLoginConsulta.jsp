<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function consultar() {
		var cedula = document.getElementById("txtCedu").value.trim();
		if (cedula.trim() == "") {
			cedula = -1;
		}
		var http = new XMLHttpRequest();
		var url = '/TiendaVirtualGrupo02Ecoshop/buscarUsuario';
		var params = "cedula=" + cedula;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				alert(http.responseText);
				CreateTableFromJSON(http.responseText);

			}
		}
		http.send(params);
	}

	function CreateTableFromJSON(json_result) {

		const json_arr = JSON.parse(json_result);

		// EXTRACT VALUE FOR HTML HEADER. 	
		var col = [];
		for (var i = 0; i < json_arr.length; i++) {
			for ( var key in json_arr[i]) {
				if (col.indexOf(key) === -1) {
					col.push(key);
				}
			}
		}

		// CREATE DYNAMIC TABLE.
		var table = document.createElement("table");
		table.setAttribute("border", "1");

		// CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

		var tr = table.insertRow(-1); // TABLE ROW.

		for (var i = 0; i < col.length; i++) {
			var th = document.createElement("th"); // TABLE HEADER.
			th.innerHTML = col[i];
			tr.appendChild(th);
		}

		// ADD JSON DATA TO THE TABLE AS ROWS.
		for (var i = 0; i < json_arr.length; i++) {

			tr = table.insertRow(-1);

			for (var j = 0; j < col.length; j++) {
				var tabCell = tr.insertCell(-1);
				tabCell.innerHTML = json_arr[i][col[j]];
			}
		}

		// FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
		var divContainer = document.getElementById("dvResult");
		divContainer.innerHTML = "";
		divContainer.appendChild(table);
	}

	function validar() {
		txtC = document.getElementById("txtCedu");

		if (txtC.value.trim().length == 0) {
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
		<h1>Consultar usuario</h1>
		<table>

			<tr>
				<td><label>Cedula:</label></td>
				<td><input required="required" type="number" id="txtCedu"
					name="cedula"></td>
			</tr>

		</table>
		<br> <br>
		<button onclick="consultar()">Consultar</button>
		<br> <br>
		<div id="dvResult"></div>
	</main>
</body>
</html>