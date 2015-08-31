<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/Juego.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div>
	<div>Felicidades ${nombre}</div>
	<div>Te ha costado: ${tiempo} segundos.</div>
 	<div>fecha: ${fecha}</div>
</div>


<div>
	<form action="/ProyectoPractica3">
	<input type="submit" value="volver">
	</form>
</div>
 
</body>
</html>