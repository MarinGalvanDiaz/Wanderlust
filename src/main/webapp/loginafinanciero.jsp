<%-- 
    Document   : loginafinanciero
    Created on : 7 mar 2023, 11:54:06
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="imgasesores/logo_sin_fondo.png" type="image/x-icon">
    <title> WANDERLUST </title>
    <link rel="stylesheet" href="loginafinanciero.css">
   
</head>
<body>

    <div class="login-box">
        <img class="avatar" src="imgasesores/logo_sin_fondo.png" alt="WANDERLUST">
        <h1> LOGIN HERE </h1>

        <form action="srvaFinanciero?accion=verificar" method="post">
            <!-- USERNAME-->
            <label for="username"> Username </label>
            <input type="text" placeholder="Ingrese su Username" name="usuario">
    
            <!-- ID / PASSWORD-->
            <label for="password"> Password </label>
            <input type="password" placeholder="Ingrese su password" name="contrasenia">
   
            <input type="submit" name="altas" value="Ingresar">
            <!-- © Copyright 2023 Speed Experience. Todos los derechos reservados -->
            <a href=""> Perdiste tu password? </a>
            <br>
            <a href=""> Mas informacion </a>
            <div class="regresar">
                <a href="asesores.html"> Regresar </a>
            </div>

        </form>  

    </div>
</body>
</html>