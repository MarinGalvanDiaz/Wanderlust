<%-- 
    Document   : verificarIngresarCapital1
    Created on : 21 mar 2023, 11:44:54
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="jakarta.mail.*" %>
<%@page import="jakarta.mail.internet.*" %>
<%@page import="Controlador.Correo" %>
<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>
<%@page import="Modelo.usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        
        <form action="verificarIngresarCapital2.jsp" method="post" name="formu1" id="formu1">
            <input type="hidden" name="Usuario" value="${usuario.id}">
        </form>
        
        <script>
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('formu1');
  
  // Envía el formulario automáticamente
  form.submit();
});
</script>
   
         
    </body>
</html>
