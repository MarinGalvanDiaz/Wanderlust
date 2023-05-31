<%-- 
    Document   : validarCuestionario1
    Created on : 16 mar 2023, 22:40:31
    Author     : chang
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>


<%

    String usuario = session.getAttribute("IdUsuario").toString();
    System.out.println("Este es el usuario: " + usuario);
    String contador = request.getParameter("contador");
    int contador1 = Integer.parseInt(contador);
    conexion con = new conexion();
    Connection cn = con.conectar();
    PreparedStatement ps = null;
    
    ResultSet rs = null;
    String sql2 = "SELECT Cuestionario_inicial FROM cliente WHERE Id_cliente = (?);";

    ps = cn.prepareStatement(sql2);
    ps.setString(1, usuario);
    rs = ps.executeQuery();
    
    if (rs.next()) {
        if (rs.getInt(1) == 0) {
        try {
            String sql3 = "UPDATE cliente SET Cuestionario_Inicial = (?) where Id_cliente = (?);";
            PreparedStatement ps2 = cn.prepareStatement(sql3);
            ps2.setInt(1, contador1);
            ps2.setString(2, usuario);
            ps2.executeUpdate();
            ps2.close();
            } catch (SQLException e) {
            throw e;
            }
        }
        if(contador1 < 5 ){
         response.sendRedirect("Principiantes.html");
        
    }else{
     response.sendRedirect("Avanzados.html");
    }
        
       

        } 

     else {
        response.sendRedirect("login2.jsp");
    }
    ps.close();

%>

