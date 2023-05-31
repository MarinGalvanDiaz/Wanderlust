<%-- 
    Document   : recuperarContra
    Created on : 22 mar 2023, 23:26:06
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="jakarta.mail.*" %>
<%@page import="jakarta.mail.internet.*" %>
<%@page import="Controlador.Correo" %>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="Modelo.conexion"%>
<%@page import="Modelo.usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
        <title>Recuperar contraseña</title>
        
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
            <a class="nav-link active" aria-current="page" href="indexMenu.jsp">Regresar</a>
        </li>
        </li>
        
        
      </ul>
      
    </div>
  </div>
</nav>
        <div class="container-fluid">
            <br>
            <br>
            <div class="row">
            <div class="col">
                
            </div>
            <div class="col-6">
            <center>
            <div class="px-5 ms-xl-4 mx-auto">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4 mx-auto" style="color: #709085;"></i>
          <img src="./images/logoEmpresa.jpg" class="img-thumbnail" alt="...">
          <span class="h1 fw-bold mb-0 mx-auto">Wanderlust</span>
        </div>
                
                <br>
              <br>
        <h2 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Enviar un reporte</h2>
        <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Ingrese su Reporte</h4>
        <br><br><br>
        <form action="" method="post" name="formu">
            <div class="form-outline mb-4 col-4 mx-auto">
            <input type="text" name="reporte" placeholder="Usuario" id="form2Example18" class="form-control form-control-lg">
            <input type="hidden" name="usuario" value="${usuario.usuario}">
            <label class="form-label" for="form2Example18"></label>
            </div>
            <div class="d-grid gap-2 col-4 mx-auto">
            <button type="submit" name="subir" value="Reportar" class="btn btn-info btn-lg btn-block">Reportar</button> 
            </div>
        </form>
        </center>
            </div>
            <div class="col">
                
            </div>
            </div>
    </div>
        
        <%if (request.getParameter("subir") != null) {
                
                String usuario = request.getParameter("usuario");
                System.out.println("Este es el reporte: " + usuario);
                String reporte = request.getParameter("reporte");
                conexion con = new conexion();
                Connection cn = con.conectar();
                PreparedStatement ps = null;
                ResultSet rs = null;
                String sql = "select Contrasenia_cliente, Email_cliente from cliente where Usuario_cliente = (?);";
                ps = cn.prepareStatement(sql);
                ps.setString(1, usuario);
                rs = ps.executeQuery();
                
                if(rs.next()){
                String contra = rs.getString(1);
                String correo = rs.getString(2);
                String host = "smtp.gmail.com";
                String port = "465";
                String username = "speedexperienceexp@gmail.com";
                String password = "kwkgaogbmuzeoutp";
                boolean sslEnabled = true;

                Correo sender = new Correo(host, port, username, password, sslEnabled);

                String to = correo;
                String subject = "Reporte de "+usuario;
                String message = reporte;

                try {
                    sender.sendEmail(to, subject, message);
                    System.out.println("Correo electrónico enviado con éxito.");
                } catch (Exception ex) {
                    System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                }
                int cond =0;
              while(cond==0){
              out.println("<script>alert('Contraseña enviada al correo electrónico proporcionado');</script>");
              cond = 1;
            }
          request.getRequestDispatcher("indexMenu.jsp").forward(request, response);
          
    }
        
    else{
 out.println("<script>alert('Usuario no registrado');</script>");
    request.getRequestDispatcher("/registro.jsp").forward(request, response);
            }
    }
%>
    </body>
</html>
