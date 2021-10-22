<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="../../css/admin_in.css">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
	//google.charts.setOnLoadCallback(drawChart);

	//===================================== FUNCIONES PROPIAS =============================

		function generarLetra(){
	var letras = ['a','b','c','d','e','f','0','1','2','3','4','5','6','7','8','9'];
	var numero = (Math.random()*15).toFixed(0);
	return letras[numero];
}
	
function colorHEX(){
	var coolor = '';
	for(var i=0;i<6;i++){
		coolor = coolor + generarLetra() ;
	}
	return '#' + coolor;
}
function consultar(t) {
	var cedus="";
	if (t==1){
		var tipo = "cliente";
		cedus="CC: ";
	} else if (t==0){
		var tipo = "producto";
		cedus="Id: ";
	}
	var http = new XMLHttpRequest();
	var url = '/TiendaVirtualGrupo02Ecoshop/consultarVentas';
	var params = "tipo=" + tipo;
	http.open('POST', url, true);

	//Send the proper header information along with the request
	http.setRequestHeader('Content-type',
			'application/x-www-form-urlencoded');

	http.onreadystatechange = function() {//Call a function when the state changes.
		if (http.readyState == 4 && http.status == 200) {

			//alert(http.responseText);
			//CreateTableFromJSON(http.responseText);
			var regex = /(\d+)/g;
			var datos = http.responseText;
			var numeros=datos.match(regex);
			let tabla=[[cedus,"Cantidad de productos",{ role: 'style' }]];
			
			for (var i = 0; i < numeros.length; i++) {
				if (i%2==0){
					//let mat=[numeros[i],parseInt(numeros[i+1]),colorHEX()];
					tabla.push([cedus+numeros[i],parseInt(numeros[i+1]),colorHEX()]);
				}
			}
			drawChart(tabla,tipo);
		}
	}
	http.send(params);
}
	

	// ======================================= FIN DE FUNCIONES PROPIAS ===============================================

		function drawChart(tabla,tipo) {
			var data = google.visualization.arrayToDataTable(tabla);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
    	        title: "Cantidad por identificacion del "+tipo,
    	        width: 600,
    	        height: 400,
    	        bar: {groupWidth: "95%"},
    	        legend: { position: "none" },
    	      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
	
		function drawChart1(tabla,tipo) {
			var data = google.visualization.arrayToDataTable(tabla);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
    	        title: "Cantidad por identificacion del "+tipo,
    	        width: 600,
    	        height: 400,
    	        bar: {groupWidth: "95%"},
    	        legend: { position: "none" },
    	      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
	
	
</script>
</head>
<body>
	<button class="pds" onclick="consultar(0)">Consultar por producto</button>
	<br><br>
	<button class="pds" onclick="consultar(1)">Consultar por cliente</button>
	<br><br>
	<a class="back" href="../../admin.html">Atras</a>
	<br>
	<div id="barchart_values" style="width: 900px; height: 300px;"></div>
	<br>
	<br>
	
</body>
</html>