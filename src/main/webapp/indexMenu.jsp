<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Modelo.conexion"%>
<%@page import="java.sql.*"%>

<%@page import="Modelo.usuario"%>
<%
if(session.getAttribute("usuario") != null){


    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> WANDERLUST </title>
    <link rel="stylesheet" href="style.css">
     <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Coiny&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a3dcb7996f.js" crossorigin="anonymous"></script>
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
            <a href="srvUsuario?accion=cerrar" class="logout_btn">Logout</a>
        </div>
    </header>
    <!--header area end-->

    <!--sidebar start-->
    <div class="sidebar">
        <center>
            <img src="logo.png" class="profile_image" alt="">
            <h4> ${usuario.nombre} ${usuario.apellido }</h4>
        </center>
        <div class="opcionesss" style="overflow-y: scroll; height: 490px;">
        <div>
       
        <a href="verificarCuestionario2.jsp"><i class="fa-solid fa-money-bill"></i><span>Movimientos</span></a>
        <a href="Parte2Wanderlust/Grafica.html"><i class="fa-solid fa-table"></i><span>Gráficas</span></a>
        <a href="InfoAsesorias.jsp"><i class="fa-regular fa-address-card"></i><span>Asesorías</span></a>
        <a href="calculator.html"><i class='fa-solid fa-calculator'></i><span>Calculadora</span></a>
        <a href="about.html"><i class="fa-sharp fa-solid fa-question"></i><span>About</span></a>
        <a href="Diversificar/opc.html"><i class="fa-solid fa-info"></i> <span>Info</span></a>
        <a href="MenuW/InformacionPU.jsp"><i class="fa-regular fa-user"></i> <span>Perfil</span></a>
        <a href="Reporte.jsp"><i class="fa-sharp fa-solid fa-circle-exclamation"></i><span>Soporte</span></a>
        </div>
        </div>
     
    </div>
    <!--sidebar end-->

    <div class="content">
        <canvas id="canvas">
            <div class="textito7">
                <p> Bienvenido a tu espacio de trabajo</p>
                <h3> Enjoy your staying</h3>
            </div>
        </canvas>
         <script src="estela.js"></script>
    </div>
    
</body>
</html>
<%
    }
else{
response.sendRedirect("/WANDERLUST_TOP/login2.jsp");
}
%>