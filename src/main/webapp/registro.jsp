<%-- 
    Document   : registro
    Created on : 17/10/2022, 10:18:58 PM
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
        <title>Registro</title>
        <script>
            function mostrarContrasena() {
                var tipo = document.getElementById("contra");
                var tipo2 = document.getElementById("repetircontra");
                if (tipo.type == "password") {
                    tipo.type = "text";
                    tipo2.type = "text";
                } else {
                    tipo.type = "password";
                    tipo2.type = "password";
                }
            }
            
            
        </script>
    </head>
    <body>
       
        <nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #2091F9">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">
      <img src="./images/logoEmpresa.jpg" alt="" width="30" height="24" class="d-inline-block align-text-top">
      Wanderlust
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="login2.jsp">Login</a>
        </li>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.html">Volver</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="asesores.html">Asesores</a>
        </li>
        
        <br>
      </ul>
      
    </div>
  </div>
</nav>
        <br>
        <br>
    <center>
        
        <div class="px-5 ms-xl-4">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
          <img src="./images/logoEmpresa.jpg" class="img-thumbnail" alt="...">
          <span class="h1 fw-bold mb-0">Wanderlust</span>
        </div>
    </center>
    <br>
    <CENTER>
        <div class="col-sm-2 text-black center-block">
                <h2 class="titulo">Registro</h2><br><br>
                <form action="registro2.jsp" id="formu" method="post" class="formu" enctype="multipart/form-data">
                    <div class="form-outline mb-4">
                        <input type="text" name="txtusu" id="usuario" required class="form-control" placeholder="Usuario" pattern="[a-zA-Z0-9]{4,10}" title="Ingrese un nombre de usuario de entre 4 y 10 caracteres">
              <label class="form-label" for="form2Example18"></label>
            </div>
                    <div class="form-outline mb-4">
                 <input type="password" name="txtcontra" id="contra" required pattern=".{4,16}" title="Ingresa una contraseña de entre 4-16 caracteres" maxlength="16" class="form-control" placeholder="Contraseña">
              <label class="form-label" for="form2Example18"></label>
            </div>
                  <div class="form-outline mb-4">
                 <input type="password" name="txtrepetircontra" id="repetircontra" required pattern=".{4,16}" title="Ingresa una contraseña de entre 4-16 caracteres" maxlength="16" class="form-control" placeholder="Repetir contraseña">
              <label class="form-label" for="form2Example18"></label>
            </div>  
                 <div class="form-outline mb-4">
                     <input type="text" name="txtnombre" id="nombre" required class="form-control" placeholder="Nombre" pattern="[A-Za-z]{2-15}" title="Ingrese un nombre entre 2 y 15 caracteres">
              <label class="form-label" for="form2Example18"></label>
            </div>      
                  <div class="form-outline mb-4">
                 <input type="text" name="txtapellido" id="apellido" required class="form-control" placeholder="Apellido" pattern="[A-Za-z]{2-15}" title="Ingrese un apellido entre 2 y 15 caracteres>
              <label class="form-label" for="form2Example18"></label>
            </div>  
                    
                    
                    <h5>Sexo: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br><br></h5>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sexo" id="sexooo" value="Masculino">
  <label class="form-check-label" for="flexRadioDefault1">
    Masculino
  </label>
</div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sexo" id="sexooo" value="Femenino">
  <label class="form-check-label" for="flexRadioDefault1">
    Femenino
  </label>
</div>
                    <br>
                    <br>
                    <div class="form-outline mb-4">
                 <input type="email" name="email" id="apellido" required title="Ingresa un formato válido de correo" class="form-control" placeholder="Email">
              <label class="form-label" for="form2Example18"></label>
            </div>  
                    <input type="file" name="foto" id="foto" required> 
                   
                    <div class="pt-1 mb-4">
                <button class="btn btn-light" onclick="mostrarContrasena()" id="boton" type="button">Mostrar Contraseña</button>
              
            </div>
                    
                    
                    
                    
                    <br><br>
                    <div class="d-grid gap-2">
                        <button class="btn btn-info btn-lg btn-block" type="submit" name="btngrabar">Registarse</button>
            </div>
                    
                    
                    
                    <a href="#">${msje}</a><br><br><br><br><br><br><br><br><br><br><br>
                </form>
        </div>
    </CENTER>
               
    </body>
    
</html>
