<%-- 
    Document   : verificarCuestionario1
    Created on : 16 mar 2023, 19:02:41
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="verificarCuestionario12.jsp" method="post" id="formu">
        <input type="hidden" name="usuario" value="${usuario.usuario}"> 
        
        </form>
        <script>
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('formu');
  
  // Envía el formulario automáticamente
  form.submit();
});
</script>
               
    </body>
</html>
