<%-- 
    Document   : verificarIngresarCapital2
    Created on : 21 mar 2023, 12:02:46
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>

 <%
            
            
            int usuario = Integer.parseInt(request.getParameter("Usuario"));
            System.out.println("Este es el usuario: " + usuario);

            conexion con = new conexion();
            Connection cn = con.conectar();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String sql2 = "SELECT Id_mov FROM movimientos WHERE Id_cliente = (?);";

            ps = cn.prepareStatement(sql2);
            ps.setInt(1, usuario);
            rs = ps.executeQuery();

            if (rs.next()) {
            request.setAttribute("User", usuario);
            request.getRequestDispatcher("/IngresarCapital.jsp").forward(request, response);
              }
              else{
              request.getRequestDispatcher("/IngresarCapital2.jsp").forward(request, response);
              }
        %> 