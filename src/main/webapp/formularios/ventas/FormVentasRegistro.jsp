<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/admin_in.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function validateFields() {
	if (document.getElementById("txtCdProducto").value.trim().length == 0) {
		alert("El codigo del producto no puede ser vacio.");
		return false;
	} else if (document.getElementById("txtCantidad").value.trim().length == 0) {
		alert("La cantidad no puede ser vacio.");
		return false;
	} else if (document.getElementById("txtCdCliente").value.trim().length == 0) {
		alert("La cedula del cliente no puede ser vacia.");
		return false;
	} else if (document.getElementById("txtCdUsuario").value.trim().length == 0) {
		alert("La cedula del usuario no puede ser vacio.");
		return false;
	} else {
		return true;
	}
}

function sendData() {
	if (!validateFields()) {
		return;
	} else {
		var CdProducto = document.getElementById("txtCdProducto").value.trim();
		var Cantidad = document.getElementById("txtCantidad").value.trim();
		var CdCliente = document.getElementById("txtCdCliente").value.trim();
		var CdUsuario = document.getElementById("txtCdUsuario").value.trim();

		var http = new XMLHttpRequest();
		var url = '/TiendaVirtualGrupo02Ecoshop/insertarVentas';
		var params = "codigo_producto_fk=" + CdProducto + "&" + "cantidad=" + Cantidad + "&" + "cedula_cliente_fk=" + CdCliente + "&" + "cedula_usuario_fk="+CdUsuario;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				var myDiv = document.getElementById("dvTabla");
				myDiv.innerHTML = "<b>"+"Mensaje "+http.responseText+"</b>";
			}
		}
		http.send(params);
	}
}



function consultarUsuario() {
	var cedula = document.getElementById("txtCeduU").value.trim();
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
			//alert(http.responseText);
			CreateTableFromJSON(http.responseText);

		}
	}
	http.send(params);
}
	function consultarCliente() {
		var cedula = document.getElementById("txtCedu").value.trim();
		if (cedula.trim() == "") {
			cedula = -1;
		}
		var http = new XMLHttpRequest();
		var url = '/TiendaVirtualGrupo02Ecoshop/buscarCliente';
		var params = "cedula=" + cedula;
		http.open('POST', url, true);
	
		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
	
		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
				//alert(http.responseText);
				CreateTableFromJSON(http.responseText);
	
			}
		}
		http.send(params);
	}
	
	function consultarProducto() {
		var codigo = document.getElementById("txtCodigo").value.trim();
		if (codigo.trim() == "") {
			codigo = -1;
		}
		var http = new XMLHttpRequest();
		var url = '/TiendaVirtualGrupo02Ecoshop/consultarProducto';
		var params = "codigo_producto=" + codigo;
		http.open('POST', url, true);

		//Send the proper header information along with the request
		http.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');

		http.onreadystatechange = function() {//Call a function when the state changes.
			if (http.readyState == 4 && http.status == 200) {
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

	
</script>
</head>
<body>
	<main>
		<h1>Registrar ventas</h1>
		<table>
			<tr>
				<td><label>Codigo del producto:</label></td>
				<td><input type="number" id="txtCdProducto"></td>
			</tr>
			<tr>
				<td><label>Cantidad:</label></td>
				<td><input type="number" id="txtCantidad"></td>
			</tr>
			<tr>
				<td><label>Cedula de cliente:</label></td>
				<td><input type="number" id="txtCdCliente"></td>
			</tr>
			<tr>
				<td><label>Cedula del usuario:</label></td>
				<td><input type="number" id="txtCdUsuario"></td>
			</tr>
			
		</table>
		<br>
		<button onclick="sendData()">Registrar venta</button>
		<a class="back" href="../../admin.html">Atras</a>
		<br>
	<div id="dvTabla"></div>
		<br><br><br>
		<h1>Consultar Productos, clientes o usuarios</h1>
		<table>

			<tr>
				<td><label>Codigo del producto:</label></td>
				<td><input type="number" id="txtCodigo"></td>
				<td><button class="pds" onclick="consultarProducto()">Consultar Producto</button></td>
			</tr>
			<tr>
				<td><label>Cedula del cliente:</label></td>
				<td><input type="number" id="txtCedu"></td>
				<td><button class="pds" onclick="consultarCliente()">Consultar Cliente</button></td>
			</tr>
			<tr>
				<td><label>Cedula del usuario:</label></td>
				<td><input type="number" id="txtCeduU"></td>
				<td><button class="pds" onclick="consultarUsuario()">Consultar Usuario</button></td>
			</tr>

		</table>
		
		<br> <br>
		
		<a class="back" href="../../admin.html">Atras</a>
		<br> <br>
		<div id="dvResult"></div>
	</main>
</body>
</html>