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

    String usuario = request.getParameter("usuario");
    System.out.println("Este es el usuario: " + usuario);
    String contador = request.getParameter("contador");
    String sinComillas = contador.replace("\"", "");
    System.out.println("Este es el resultado"+contador);
    int contador1 = Integer.parseInt(sinComillas);
    conexion con = new conexion();
    Connection cn = con.conectar();
    PreparedStatement ps = null;
    
    ResultSet rs = null;
    String sql2 = "SELECT Cuestionario_2 FROM cliente WHERE Usuario_cliente = (?);";

    ps = cn.prepareStatement(sql2);
    ps.setString(1, usuario);
    rs = ps.executeQuery();
    
    if (rs.next()) {
        if (rs.getInt(1) == 0) {
        try {
            String sql3 = "UPDATE cliente SET Cuestionario_2 = (?) WHERE Usuario_cliente = (?);";
            PreparedStatement ps2 = cn.prepareStatement(sql3);
            ps2.setInt(1, contador1);
            ps2.setString(2, usuario);
            ps2.executeUpdate();
            ps2.close();
            } catch (SQLException e) {
            throw e;
            }
        }
        if(contador1 != 0){
         request.getRequestDispatcher("/verificarIngresarCapital1.jsp").forward(request, response);
        
    }
        
       

        } 

     else {
        request.getRequestDispatcher("/indexMenu.jsp").forward(request, response);
    }
    ps.close();

%>