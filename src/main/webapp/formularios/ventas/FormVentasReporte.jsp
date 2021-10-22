<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="../../css/admin_in.css">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
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
			cedus="CEDULA DEL CLIENTE";
		} else if (t==0){
			var tipo = "producto";
			cedus="CODIGO DE PRODUCTO";
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

				var datos = http.responseText;
				datos = datos.replace('[', '').replace(']', '');
				var tokens = datos.split(',');
				var tabla = [];
				tabla.push([cedus,"Cantidad de productos",{ role: 'style' }]);
				for (var i = 0; i < tokens.length; i++) {
					var tokens2 = tokens[i].split(';');
					var reg=[];
					reg.push(tokens2[0].replace('"',''));
					reg.push(parseInt(tokens2[1].replace('"','')));
					var color=colorHEX().replace('"','');
					//'color: #76A7FA'
					reg.push(color);
					tabla.push(reg);
				}
				drawChart(tabla);
			}
		}
		http.send(params);
	}

	// ======================================= FIN DE FUNCIONES PROPIAS ===============================================

	function drawChart(tabla) {
		
		var data = google.visualization.arrayToDataTable(tabla);
		var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "style" },
	                       2]);
	      var options = {
					//chart : {
						//width: 600,
				        //height: 400,
				title : 'Reporte de ventas de ropa 2021',
						//subtitle : 'Tienda EcoShop Store Grupo 02',
					//},
					//bars : 'horizontal' // Required for Material Bar Charts.
	    		 
	    	        width: 600,
	    	        height: 400,
	    	        bar: {groupWidth: "95%"},
	    	        legend: { position: "none" },	
	      };
	      

		var chart = new google.charts.Bar(document
				.getElementById('barchart_material'));
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
	<br>
	<div id="barchart_material" style="width: 900px; height: 500px;"></div>
	<br>
	<br>
	
</body>
</html>