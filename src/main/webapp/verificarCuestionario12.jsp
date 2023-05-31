<%-- 
    Document   : verificarCuestionario12
    Created on : 16 mar 2023, 19:51:42
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>


<%
        
        String usuario = request.getParameter("usuario");
        System.out.println("Este es el usuario: "+usuario);
        
        conexion con = new conexion();
        Connection cn = con.conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql2 = "SELECT Cuestionario_inicial FROM cliente WHERE Usuario_cliente = (?);";
        
        ps = cn.prepareStatement(sql2);
        ps.setString(1, usuario);
        rs = ps.executeQuery();
        
        
        if(rs.next()){
        if(rs.getInt(1)==0){
             request.getRequestDispatcher("/Cuestionario1.jsp").forward(request, response);
             
            }
            else if(rs.getInt(1)>0){
                response.sendRedirect("indexMenu.jsp");
                
            }else{
                request.getRequestDispatcher("/login2.jsp").forward(request, response);
                
                
            }
            
             
    }else{
     request.getRequestDispatcher("/login2.jsp").forward(request, response);
    }
        
        %>
        
