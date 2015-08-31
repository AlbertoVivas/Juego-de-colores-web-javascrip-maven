<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProyectoPractica3</title>
<link href="css/Juego.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
var primer_click = false;
var div1;
var div2;
var color1;
var color2;
var colores_hechos=0;
var h1;
var m1;
var s1;
var h2;
var m2;
var s2;

var xmlHttp =null;

function llama(div){
	var mensaje = document.getElementById("mensaje");
	while(mensaje.hasChildNodes()){mensaje.removeChild(mensaje.lastChild);}
	var divmen = document.createElement("div");
	divmen.innerHTML = "nº="+colores_hechos;
	mensaje.appendChild(divmen);

	if (!primer_click){
		primer_click=true;
		div1 = div;
		color1 = div.style.background;
	}else {
		div2 = div;	
		color2 = div.style.background;
		primer_click = false;
		if(color1==color2 && div1!=div2 && color1!="white"){
			div1.style.background="white";// = 'background-color: "white";';
			div2.style.background="white";// = 'background-color: "white";';
			colores_hechos+=2;
			if(colores_hechos<20){
				while(mensaje.hasChildNodes()){mensaje.removeChild(mensaje.lastChild);}
				divmen = document.createElement("div");
				divmen.innerHTML="los colores son iguales, color1="+color1+" color2="+color2+ " nº="+colores_hechos+"/20";
				mensaje.appendChild(divmen);
					
			}else{
				colores_hechos=0;
				var date = new Date();
				h2 = date.getHours();
				m2 = date.getMinutes();
				s2 = date.getSeconds();
				//alert("Has ganado, eres la caña de españa!!! inicio:"+h1+m1+s1+"fin"+h2+m2+s2 );
				var tiempoJuego = tiempo();
				var fecha = date.getDate() + "/" + (date.getMonth() +1) + "/" + date.getFullYear();
				alert("Has ganado y lo has hecho en "+tiempoJuego+" segundos");
				var nombre = prompt("Por favor introduce tu Nombre", "Player");
				xmlHttp = new XMLHttpRequest();
				xmlHttp.onreadystatechange = procesarEventos;
			  //xmlHttp.open('GET','../ProyectoPractica3/registro?tiempo='+tiempoJuego,true);
				xmlHttp.open('GET','../ProyectoPractica3/registroj?tiempo='+tiempoJuego+"&nombre="+nombre+"&fecha="+fecha,true);
				xmlHttp.send(null);
			  //window.location.replace("http://localhost:8090/ProyectoPractica3/html/jugador.jsp");
				
				var jugar = document.getElementById("div_principal");
				while(jugar.hasChildNodes()){
					jugar.removeChild(jugar.lastChild);
				}
				while(mensaje.hasChildNodes()){mensaje.removeChild(mensaje.lastChild);}
			}
			
			
		}else{
			if(div1==div2){
				while(mensaje.hasChildNodes()){mensaje.removeChild(mensaje.lastChild);}
				divmen = document.createElement("div");
				divmen.innerHTML="No vale pulsar el mismo";
				mensaje.appendChild(divmen);
			
			
			}else{
				if(color1=="white"||color2=="white"){
					while(mensaje.hasChildNodes()){mensaje.removeChild(mensaje.lastChild);}
					divmen = document.createElement("div");
					divmen.innerHTML="no pulses los blancos -.-!";
					mensaje.appendChild(divmen);
				}else{
				while(mensaje.hasChildNodes()){mensaje.removeChild(mensaje.lastChild);}
				divmen = document.createElement("div");
				divmen.innerHTML="los colores son distintos "+color1+" "+color2;
				mensaje.appendChild(divmen);	
			
				}
			}	
		}	
	}		
}

function procesarEventos(){
	if(xmlHttp.readyState == 4){//tenemos respuesta del servidor
		if(xmlHttp.status == 200){
			pedirPaginaFinal(xmlHttp.responseText);
		}else{ alert("ha ocurrido un error al procesar el evento: "+xmlHttp.statusText);}
	}
}

/* function pedirPaginaFinal(tiempojson){
	alert("he recibido tiempo: "+tiempojson)
	var objetoJson = JSON.parse(tiempojson);
	var tiempo = objetoJson.time;
	window.location.replace("http://localhost:8090/ProyectoPractica3/final?tiempo="+tiempo);
} */

function pedirPaginaFinal(jugadorjson){
	alert("he recibido tiempo: "+jugadorjson)
	var objetoJson = JSON.parse(jugadorjson);
	var tiempo = objetoJson.tiempo;
	var nombre = objetoJson.nombre;
	var fecha = objetoJson.fecha;
	window.location.replace("http://localhost:8090/ProyectoPractica3/finalj?tiempo="+tiempo+"&nombre="+nombre+"&fecha="+fecha);
}
function aleatorio(){
	var inferior = 0;
	var superior = 10;
 	var numPosibilidades = superior - inferior 
   	var aleat = Math.random() * numPosibilidades 
   	aleat = Math.round(aleat) 
 	return parseInt(inferior) + aleat; 
}

function dameColor() {
	var arrayColores = new Array(10);
	arrayColores[0] = "yellow";
	arrayColores[1] = "green";
	arrayColores[2] = "red";
	arrayColores[3] = "blue";
	arrayColores[4] = "grey";
	arrayColores[5] = "pink";
	arrayColores[6] = "cyan";
	arrayColores[7] = "purple";
	arrayColores[8] = "black";
	arrayColores[9] = "lightgreen";
	return arrayColores[aleatorio()];
}

function bgc(){//back ground color	
	
	var arrayColores = new Array(20);
	var termine= false;
	var num=0;
	var color;
	var n_yel=0;
	var n_gre=0;
	var n_red=0;
	var n_blu=0;
	var n_gry=0;
	var n_pin=0;
	var n_cya=0;
	var n_pur=0;
	var n_bla=0;
	var n_lig=0;
	
	
	while (num<20){
		color = dameColor();
		
		if(color== "yellow" && n_yel<2){
			arrayColores[num]=color;
			n_yel++;
			num++;
		}
		
		if(color== "green" && n_gre<2){
			arrayColores[num]=color;
			n_gre++;
			num++;
		}
		
		if(color== "red" && n_red<2){
			arrayColores[num]=color;
			n_red++;
			num++;
		}
		
		if(color== "blue" && n_blu<2){
			arrayColores[num]=color;
			n_blu++;
			num++;
		}
		
		if(color== "grey" && n_gry<2){
			arrayColores[num]=color;
			n_gry++;
			num++;
		}
		
		if(color== "pink" && n_pin<2){
			arrayColores[num]=color;
			n_pin++;
			num++;
		}
		
		if(color== "cyan" && n_cya<2){
			arrayColores[num]=color;
			n_cya++;
			num++;
		}
		
		if(color== "purple" && n_pur<2){
			arrayColores[num]=color;
			n_pur++;
			num++;
		}
		
		if(color== "black" && n_bla<2){
			arrayColores[num]=color;
			n_bla++;
			num++;
		}
		
		if(color== "lightgreen" && n_lig<2){
			arrayColores[num]=color;
			n_lig++;
			num++;
		}	
	}
	return arrayColores;
}

function dameTabla() {
	var date = new Date();
	colores_hechos=0;
	h1 = date.getHours();
	m1 = date.getMinutes();
	s1 = date.getSeconds();
	
 	var jugar = document.getElementById("div_principal");
	while(jugar.hasChildNodes()){
		jugar.removeChild(jugar.lastChild);
	}
	
	var div_v = null;
	var div_h = null;
	var n_v=5;
	var n_h=4;
	
	var coloresDados = new Array(20);
	var num_cor =0;
	
	coloresDados = bgc();
	for(var j=1;j<=n_h;j++){
		div_h = document.createElement("div");
		div_h.setAttribute("id", "div_horizontal");
		for(var i=1;i<=n_v;i++){
			var color = coloresDados[num_cor];
			num_cor++;
			div_v = document.createElement("div");
		
			if(i!=5){
				div_v.setAttribute("id", "div_vertical");	
			}else{
				div_v.setAttribute("id", "div_vertical_u");
			}
			div_v.setAttribute("onclick","llama(this);");
			div_v.setAttribute("style","background:"+color);
			div_h.appendChild(div_v);
		}
		jugar.appendChild(div_h);
	}
}

function tiempo() {
	var segundos = (h2-h1)*3600+(m2-m1)*60+(s2-s1);
	return segundos;
}


</script>


</head>
<body>
<div>
<input type="submit" value="Comenzar" onclick="dameTabla();" style="float: left;">
<div id="mensaje" style="float: cen;"></div>
</div>
<div id="div_principal">
</div>
</body>
</html>