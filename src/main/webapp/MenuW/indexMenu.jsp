<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if(session.getAttribute("usuario") != null){


    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WANDERLUST</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body>

    <input type="checkbox" id="check">
    <!--header area start-->
    <header>
        <label for="check">
            <i class="fa-solid fa-bars" id="sidebar_btn"></i>
        </label>
        <div class="left_area">
            <h3>Speed<span>Experience</span></h3>
        </div>
        <div class="right:left_area">
            <a href="/srvUsuario?accion=cerrar" class="logout_btn">Logout</a>
        </div>
    </header>
    <!--header area end-->

    <!--sidebar start-->
    <div class="sidebar">
        <center>
            <img src="logo.png" class="profile_image" alt="">
            <h4>Speed Experience</h4>
        </center>
        <a href="Cuestionario2.html"><i class="fa-solid fa-list"></i><span>Ingresar Datos</span></a>
        <a href="/CuestionarioInv/index.html"><i class="fa-solid fa-money-bill"></i><span>Movimientos</span></a>
        <a href="/Parte2Wanderlust/Grafica.html"><i class="fa-solid fa-table"></i><span>Gráficas</span></a>
        <a href="infoasesor.html"><i class="fa-regular fa-address-card"></i><span>Asesorías</span></a>
        <a href="about.html"><i class="fa-regular fa-circle"></i> <span>About</span></a>
        <a href="Avanzados.html"><i class="fa-regular fa-circle"></i> <span>Info</span></a>
    </div>
    <!--sidebar end-->

    <div class="content"></div>
    
</body>
</html>
<%
    }
else{
response.sendRedirect("/WANDERLUST_TOP/login2.jsp");
}
%>