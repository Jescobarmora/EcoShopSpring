<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
	async function CargarArchivo() {
		let formData = new FormData();
		formData.append("file", fileupload.files[0]);
		let response = await
		fetch('/TiendaVirtualGrupo02Ecoshop/cargarProducto', {
			method : "POST",
			body : formData
		});
		if (response.status == 200) {
			alert(response.text());
		}
	}
</script>
</head>
<body>
	<h1>Cargue Masivo de Productos</h1>
	<input id="fileupload" type="file" name="fileupload" />
	<button id="btnUpload" onclick="CargarArchivo()">Subir Archivo</button>
</body>
</html>
